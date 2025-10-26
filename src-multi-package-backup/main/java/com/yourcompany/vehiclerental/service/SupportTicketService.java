package com.yourcompany.vehiclerental.service;

import com.yourcompany.vehiclerental.entity.SupportTicket;
import com.yourcompany.vehiclerental.entity.User;
import com.yourcompany.vehiclerental.repository.SupportTicketRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class SupportTicketService {

    @Autowired
    private SupportTicketRepository ticketRepository;

    public List<SupportTicket> getTicketsByCustomer(String userId) {
        return ticketRepository.findByCustomerUserId(userId);
    }

    public List<SupportTicket> getAllTickets() {
        return ticketRepository.findAll();
    }

    public void createTicket(User user, String description) {
        SupportTicket ticket = new SupportTicket();
        ticket.setTicketId(UUID.randomUUID().toString());
        ticket.setCustomer(user);
        ticket.setDescription(description);
        ticket.setStatus("OPEN");

        ticketRepository.save(ticket);
    }

    public void updateTicket(String id, String status, String response) {
        SupportTicket ticket = ticketRepository.findById(id).orElseThrow(() -> new RuntimeException("Ticket not found"));
        ticket.setStatus(status);
        ticket.setResponse(response);
        ticketRepository.save(ticket);
    }

    public Optional<SupportTicket> findById(String id) {
        return ticketRepository.findById(id);
    }

    public void deleteTicket(String id) {
        ticketRepository.findById(id).orElseThrow(() -> new RuntimeException("Ticket not found"));
        ticketRepository.deleteById(id);
    }
}