package com.vehicle_mangement_system.backend.repo;
import com.vehicle_mangement_system.backend.models.Vehicle;
import org.springframework.data.jpa.repository.JpaRepository;

public interface VehicleRepository extends JpaRepository<Vehicle, Long> {
}