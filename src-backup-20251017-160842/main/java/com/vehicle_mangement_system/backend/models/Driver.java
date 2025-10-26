// Driver.java
package com.vehicle_mangement_system.backend.models;

import jakarta.persistence.*;

@Entity
@Table(name = "Driver")
public class Driver {
    @Id
    @Column(name = "DriverID", length = 10)
    private String driverId;

    @Column(name = "Name", length = 100)
    private String name;

    @Column(name = "PhoneNumber", length = 20)
    private String phoneNumber;

    @Column(name = "ExperienceYears")
    private Integer experienceYears;

    // Constructors
    public Driver() {}

    public Driver(String name, String phoneNumber, Integer experienceYears) {
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.experienceYears = experienceYears;
    }

    // Getters and Setters
    public String getDriverId() { return driverId; }
    public void setDriverId(String driverId) { this.driverId = driverId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getPhoneNumber() { return phoneNumber; }
    public void setPhoneNumber(String phoneNumber) { this.phoneNumber = phoneNumber; }

    public Integer getExperienceYears() { return experienceYears; }
    public void setExperienceYears(Integer experienceYears) { this.experienceYears = experienceYears; }
}