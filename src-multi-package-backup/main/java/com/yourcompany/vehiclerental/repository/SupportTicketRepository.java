package com.yourcompany.vehiclerental.repository;

import com.yourcompany.vehiclerental.entity.SupportTicket;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface SupportTicketRepository extends JpaRepository<SupportTicket, String> {
    List<SupportTicket> findByCustomerUserId(String customerId);
}