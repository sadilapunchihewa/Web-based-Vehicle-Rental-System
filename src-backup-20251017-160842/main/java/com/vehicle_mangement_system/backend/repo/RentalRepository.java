// RentalRepository.java - Without custom ordered query
package com.vehicle_mangement_system.backend.repo;

import com.vehicle_mangement_system.backend.models.Rental;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RentalRepository extends JpaRepository<Rental, String> {
    List<Rental> findByCustomerUserId(String customerId);
    List<Rental> findByVehicleVehicleId(String vehicleId);
}