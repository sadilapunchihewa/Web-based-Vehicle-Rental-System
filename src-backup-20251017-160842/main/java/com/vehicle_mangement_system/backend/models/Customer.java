package com.vehicle_mangement_system.backend.models;

import jakarta.persistence.*;

@Entity
@Table(name = "Customer")
public class Customer {

    @Id
    @Column(name = "CustomerID", length = 10)
    private String customerID;

    @OneToOne
    @JoinColumn(name = "UserID", nullable = false)
    private User user;

    // Getters and Setters
    public String getCustomerID() { return customerID; }
    public void setCustomerID(String customerID) { this.customerID = customerID; }

    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }
}