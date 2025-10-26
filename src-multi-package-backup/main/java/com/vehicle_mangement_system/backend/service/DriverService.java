package com.vehicle_mangement_system.backend.Service;

import com.vehicle_mangement_system.backend.models.Driver;
import com.vehicle_mangement_system.backend.models.User;
import com.vehicle_mangement_system.backend.repo.DriverRepository;
import com.vehicle_mangement_system.backend.repo.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
public class DriverService {

    @Autowired
    private DriverRepository driverRepository;

    @Autowired
    private UserRepository userRepository;

    public List<Driver> getAllDrivers() {
        return driverRepository.findAll();
    }

    public Optional<Driver> getDriverById(String driverId) {
        return driverRepository.findByUserId(driverId);
    }

    @Transactional
    public Driver saveDriver(Driver driver) {
        // Process checkbox values
        if (driver.getVehicleTypes() != null && driver.getVehicleTypes().contains("[")) {
            driver.setVehicleTypes(driver.getVehicleTypes().replace("[", "").replace("]", "").replace("\"", ""));
        }
        if (driver.getLanguages() != null && driver.getLanguages().contains("[")) {
            driver.setLanguages(driver.getLanguages().replace("[", "").replace("]", "").replace("\"", ""));
        }

        // Also save to User table
        User user = new User();
        user.setUserId(driver.getUserId());
        user.setFirstName(driver.getFirstName());
        user.setLastName(driver.getLastName());
        user.setUsername(driver.getUsername());
        user.setPassword(driver.getPassword());
        user.setContactInfo(driver.getContactInfo());
        user.setRole("Driver");

        userRepository.save(user);
        return driverRepository.save(driver);
    }

    @Transactional
    public Driver updateDriver(String driverId, Driver driverDetails) {
        Driver driver = driverRepository.findByUserId(driverId)
                .orElseThrow(() -> new RuntimeException("Driver not found with id: " + driverId));

        // Process checkbox values
        if (driverDetails.getVehicleTypes() != null && driverDetails.getVehicleTypes().contains("[")) {
            driverDetails.setVehicleTypes(driverDetails.getVehicleTypes().replace("[", "").replace("]", "").replace("\"", ""));
        }
        if (driverDetails.getLanguages() != null && driverDetails.getLanguages().contains("[")) {
            driverDetails.setLanguages(driverDetails.getLanguages().replace("[", "").replace("]", "").replace("\"", ""));
        }

        // Update driver table
        driver.setFirstName(driverDetails.getFirstName());
        driver.setLastName(driverDetails.getLastName());
        driver.setUsername(driverDetails.getUsername());
        driver.setPassword(driverDetails.getPassword());
        driver.setContactInfo(driverDetails.getContactInfo());
        driver.setDateOfBirth(driverDetails.getDateOfBirth());
        driver.setAddress(driverDetails.getAddress());
        driver.setLicenseNumber(driverDetails.getLicenseNumber());
        driver.setLicenseExpiry(driverDetails.getLicenseExpiry());
        driver.setJoinDate(driverDetails.getJoinDate());
        driver.setDriverStatus(driverDetails.getDriverStatus());
        driver.setHourlyRate(driverDetails.getHourlyRate());
        driver.setVehicleTypes(driverDetails.getVehicleTypes());
        driver.setLanguages(driverDetails.getLanguages());

        // Also update user table
        Optional<User> userOpt = userRepository.findById(driverId);
        if (userOpt.isPresent()) {
            User user = userOpt.get();
            user.setFirstName(driverDetails.getFirstName());
            user.setLastName(driverDetails.getLastName());
            user.setUsername(driverDetails.getUsername());
            user.setPassword(driverDetails.getPassword());
            user.setContactInfo(driverDetails.getContactInfo());
            userRepository.save(user);
        }

        return driverRepository.save(driver);
    }

    @Transactional
    public void deleteDriver(String driverId) {
        // Delete from both tables
        driverRepository.deleteById(driverId);
        userRepository.deleteById(driverId);
    }

    public String generateDriverId() {
        // Find the highest existing driver ID and increment it
        List<Driver> drivers = driverRepository.findAll();
        int maxId = 0;

        for (Driver driver : drivers) {
            if (driver.getUserId().startsWith("D")) {
                try {
                    int idNum = Integer.parseInt(driver.getUserId().substring(1));
                    if (idNum > maxId) {
                        maxId = idNum;
                    }
                } catch (NumberFormatException e) {
                    // Skip if format doesn't match
                }
            }
        }

        return "D" + String.format("%03d", maxId + 1);
    }
}
