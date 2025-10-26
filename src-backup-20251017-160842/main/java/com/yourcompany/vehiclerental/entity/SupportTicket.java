package com.yourcompany.vehiclerental.entity;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "support_tickets")
public class SupportTicket {
    @Id
    @Column(name = "ticket_id")
    private String ticketId;

    @ManyToOne
    @JoinColumn(name = "customer_id")
    private User customer;

    @Column(name = "description")
    private String description;

    @Column(name = "status")
    private String status;

    @Column(name = "response")
    private String response;
}