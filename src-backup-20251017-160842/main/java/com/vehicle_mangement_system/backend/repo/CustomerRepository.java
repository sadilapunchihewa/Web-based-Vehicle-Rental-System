package com.vehicle_mangement_system.backend.repo;

import com.vehicle_mangement_system.backend.models.Customer;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CustomerRepository extends JpaRepository<Customer, String> {
}