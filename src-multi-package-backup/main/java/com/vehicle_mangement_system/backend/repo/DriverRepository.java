package com.vehicle_mangement_system.backend.repo;

import com.vehicle_mangement_system.backend.models.Driver;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

public interface DriverRepository extends JpaRepository<Driver, String> {
    Optional<Driver> findByUsername(String username);
    Optional<Driver> findByUserId(String userId);
}
