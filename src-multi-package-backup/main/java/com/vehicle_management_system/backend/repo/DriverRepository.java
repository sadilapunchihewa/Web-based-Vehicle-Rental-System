// DriverRepository.java
package com.vehicle_management_system.backend.repo;

import com.vehicle_management_system.backend.models.Driver;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DriverRepository extends JpaRepository<Driver, String> {
    List<Driver> findByAvailabilityStatus(String availabilityStatus);
    List<Driver> findByUserUserId(String userId);
}