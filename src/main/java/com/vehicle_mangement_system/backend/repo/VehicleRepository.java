package com.vehiclerental.backend.repositories;

import com.vehiclerental.backend.models.Vehicle;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
// FIX: Uses String ID, consistent with your controller.
public interface VehicleRepository extends JpaRepository<Vehicle, String> {

    List<Vehicle> findByAvailabilityStatus(String availabilityStatus);

    List<Vehicle> findByType(String type);

    @Query("SELECT v FROM Vehicle v WHERE v.availabilityStatus = 'Available'")
    List<Vehicle> findAvailableVehicles();

    List<Vehicle> findByBrandContainingIgnoreCase(String brand);
}