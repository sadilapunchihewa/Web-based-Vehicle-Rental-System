// Driver.java
package com.vehicle_management_system.backend.models;

import jakarta.persistence.*;

@Entity
@Table(name = "Driver")
public class Driver {
    @Id
    @Column(name = "DriverID", length = 10)
    private String driverId;

    @OneToOne
    @JoinColumn(name = "UserID")
    private User user;

    @Column(name = "LicenseNumber", length = 50, nullable = false)
    private String licenseNumber;

    @Column(name = "AvailabilityStatus", length = 20)
    private String availabilityStatus;

    // Getters and Setters
    public String getDriverId() { return driverId; }
    public void setDriverId(String driverId) { this.driverId = driverId; }
    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }
    public String getLicenseNumber() { return licenseNumber; }
    public void setLicenseNumber(String licenseNumber) { this.licenseNumber = licenseNumber; }
    public String getAvailabilityStatus() { return availabilityStatus; }
    public void setAvailabilityStatus(String availabilityStatus) { this.availabilityStatus = availabilityStatus; }
}