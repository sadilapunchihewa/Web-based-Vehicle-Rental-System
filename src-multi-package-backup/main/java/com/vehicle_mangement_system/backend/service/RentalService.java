// RentalService.java
package com.vehicle_mangement_system.backend.service;

import com.vehicle_mangement_system.backend.models.Driver;
import com.vehicle_mangement_system.backend.models.Rental;
import com.vehicle_mangement_system.backend.models.User;
import com.vehicle_mangement_system.backend.models.Vehicle;
import com.vehicle_mangement_system.backend.repo.DriverRepository;
import com.vehicle_mangement_system.backend.repo.RentalRepository;
import com.vehicle_mangement_system.backend.repo.VehicleRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
@Transactional
public class RentalService {

    private final RentalRepository rentalRepository;
    private final VehicleRepository vehicleRepository;
    private final DriverRepository driverRepository;  // Added DriverRepository

    private static final BigDecimal DRIVER_DAILY_RATE = BigDecimal.valueOf(1500);

    public RentalService(RentalRepository rentalRepository, VehicleRepository vehicleRepository, DriverRepository driverRepository) {
        this.rentalRepository = rentalRepository;
        this.vehicleRepository = vehicleRepository;
        this.driverRepository = driverRepository;
    }

    public List<Rental> getCustomerBookings(String customerId) {
        return rentalRepository.findByCustomerUserId(customerId);
    }

    public Optional<Rental> getBookingById(String rentalId) {
        return rentalRepository.findById(rentalId);
    }

    public Rental createBooking(User customer, String vehicleId, LocalDate startDate, LocalDate endDate, String driverId) {
        Vehicle vehicle = vehicleRepository.findById(vehicleId)
                .orElseThrow(() -> new RuntimeException("Vehicle not found"));

        Driver driver = null;
        if (driverId != null && !driverId.isEmpty()) {
            driver = driverRepository.findById(driverId)
                    .orElseThrow(() -> new RuntimeException("Driver not found"));
        }

        // Calculate number of days (inclusive)
        long daysBetween = ChronoUnit.DAYS.between(startDate, endDate);
        if (daysBetween < 0) {
            throw new RuntimeException("End date must be after start date");
        }
        int numberOfDays = (int) (daysBetween + 1);

        // Calculate total cost (vehicle rate + driver rate if applicable)
        BigDecimal vehicleCost = BigDecimal.valueOf(vehicle.getDailyRate()).multiply(BigDecimal.valueOf(numberOfDays));
        BigDecimal totalCost = vehicleCost;
        if (driver != null) {
            BigDecimal driverCost = DRIVER_DAILY_RATE.multiply(BigDecimal.valueOf(numberOfDays));
            totalCost = totalCost.add(driverCost);
        }

        // Create rental record
        Rental rental = new Rental();
        rental.setRentalId("R" + UUID.randomUUID().toString().substring(0, 9).toUpperCase());
        rental.setCustomer(customer);
        rental.setVehicle(vehicle);
        rental.setDriver(driver);
        rental.setNumberOfDays(numberOfDays);
        rental.setTotalCost(totalCost);
        rental.setBookingStatus("Pending");
        rental.setRentalStartDate(startDate);
        rental.setRentalEndDate(endDate);

        return rentalRepository.save(rental);
    }

    public Rental updateBooking(String rentalId, String customerId, Integer numberOfDays) {
        Rental rental = rentalRepository.findById(rentalId)
                .orElseThrow(() -> new RuntimeException("Booking not found"));

        // Verify ownership
        if (!rental.getCustomer().getUserId().equals(customerId)) {
            throw new RuntimeException("Unauthorized: Not your booking");
        }

        // Only allow updates for Pending bookings
        if (!"Pending".equals(rental.getBookingStatus())) {
            throw new RuntimeException("Only pending bookings can be updated");
        }

        // Recalculate end date and total cost based on new number of days from start date
        // Note: Driver remains unchanged
        LocalDate newEndDate = rental.getRentalStartDate().plusDays(numberOfDays - 1);  // Adjusted for inclusive count
        BigDecimal vehicleCost = BigDecimal.valueOf(rental.getVehicle().getDailyRate()).multiply(BigDecimal.valueOf(numberOfDays));
        BigDecimal totalCost = vehicleCost;
        if (rental.getDriver() != null) {
            BigDecimal driverCost = DRIVER_DAILY_RATE.multiply(BigDecimal.valueOf(numberOfDays));
            totalCost = totalCost.add(driverCost);
        }
        rental.setNumberOfDays(numberOfDays);
        rental.setRentalEndDate(newEndDate);
        rental.setTotalCost(totalCost);

        return rentalRepository.save(rental);
    }

    public Rental cancelBooking(String rentalId, String customerId) {
        Rental rental = rentalRepository.findById(rentalId)
                .orElseThrow(() -> new RuntimeException("Booking not found"));

        // Verify ownership
        if (!rental.getCustomer().getUserId().equals(customerId)) {
            throw new RuntimeException("Unauthorized: Not your booking");
        }

        // Only allow cancellation for Pending or Confirmed bookings
        if ("Cancelled".equals(rental.getBookingStatus()) || "Completed".equals(rental.getBookingStatus())) {
            throw new RuntimeException("Cannot cancel this booking");
        }

        rental.setBookingStatus("Cancelled");
        return rentalRepository.save(rental);
    }

    public void deleteBooking(String rentalId, String customerId) {
        Rental rental = rentalRepository.findById(rentalId)
                .orElseThrow(() -> new RuntimeException("Booking not found"));

        // Verify ownership
        if (!rental.getCustomer().getUserId().equals(customerId)) {
            throw new RuntimeException("Unauthorized: Not your booking");
        }

        rentalRepository.delete(rental);
    }
}