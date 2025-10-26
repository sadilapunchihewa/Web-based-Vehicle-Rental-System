package com.vehicle_management_system.backend.service;

import com.vehicle_management_system.backend.models.Rental;
import com.vehicle_management_system.backend.models.User;
import com.vehicle_management_system.backend.models.Vehicle;
import com.vehicle_management_system.backend.repo.RentalRepository;
import com.vehicle_management_system.backend.repo.VehicleRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
@Transactional
public class RentalService {

    private final RentalRepository rentalRepository;
    private final VehicleRepository vehicleRepository;

    public RentalService(RentalRepository rentalRepository, VehicleRepository vehicleRepository) {
        this.rentalRepository = rentalRepository;
        this.vehicleRepository = vehicleRepository;
    }

    public List<Rental> getCustomerBookings(String customerId) {
        return rentalRepository.findByCustomerUserId(customerId);
    }

    public Optional<Rental> getBookingById(String rentalId) {
        return rentalRepository.findById(rentalId);
    }

    public Rental createBooking(User customer, String vehicleId, Integer numberOfDays) {
        Vehicle vehicle = vehicleRepository.findById(vehicleId)
                .orElseThrow(() -> new RuntimeException("Vehicle not found"));

        // Calculate total cost
        BigDecimal totalCost = BigDecimal.valueOf(vehicle.getDailyRate() * numberOfDays);

        // Create rental record
        Rental rental = new Rental();
        rental.setRentalId("R" + UUID.randomUUID().toString().substring(0, 9).toUpperCase());
        rental.setCustomer(customer);
        rental.setVehicle(vehicle);
        rental.setNumberOfDays(numberOfDays);
        rental.setTotalCost(totalCost);
        rental.setBookingStatus("Pending");
        rental.setRentalStartDate(LocalDate.now());
        rental.setRentalEndDate(LocalDate.now().plusDays(numberOfDays));

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

        // Recalculate total cost
        BigDecimal totalCost = BigDecimal.valueOf(rental.getVehicle().getDailyRate() * numberOfDays);
        rental.setNumberOfDays(numberOfDays);
        rental.setTotalCost(totalCost);
        rental.setRentalEndDate(rental.getRentalStartDate().plusDays(numberOfDays));

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
