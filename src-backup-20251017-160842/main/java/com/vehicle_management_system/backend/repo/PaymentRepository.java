package com.vehicle_management_system.backend.repo;

import com.vehicle_management_system.backend.models.Payment;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PaymentRepository extends JpaRepository<Payment, Long> {
    List<Payment> findByUserId(String userId);

    Payment bookingId(String bookingId);

}