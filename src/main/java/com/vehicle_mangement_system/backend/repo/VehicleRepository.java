package com.vehicle_mangement_system.backend.repo;

import org.drivelk.drivelk.entity.Vehicle;
import org.springframework.data.jpa.repository.JpaRepository;

public interface VehicleRepository extends JpaRepository<Vehicle, Long> {
}