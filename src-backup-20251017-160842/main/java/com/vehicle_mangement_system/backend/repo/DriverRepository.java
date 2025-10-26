// DriverRepository.java
package com.vehicle_mangement_system.backend.repo;

import com.vehicle_mangement_system.backend.models.Driver;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DriverRepository extends JpaRepository<Driver, String> {
    // Add custom queries if needed, e.g., findAvailableDrivers()
}