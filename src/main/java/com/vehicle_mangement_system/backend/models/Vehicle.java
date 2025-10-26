package com.vehiclerental.backend.models;

import jakarta.persistence.*;

@Entity
@Table(name = "Vehicle")
public class Vehicle {
    @Id
    @Column(name = "VehicleID", length = 10)
    private String vehicleId;

    @Column(name = "brand", length = 50, nullable = false)
    private String brand;

    @Column(name = "model", length = 50, nullable = false)
    private String model;

    @Column(name = "type", length = 20, nullable = false)
    private String type;

    @Column(name = "year", nullable = false)
    private Integer year;

    @Column(name = "mileage")
    private Integer mileage;

    @Column(name = "fuel_type", length = 20)
    private String fuelType;

    @Column(name = "seating_capacity")
    private Integer seatingCapacity;

    @Column(name = "description", length = 1000)
    private String description;

    @Column(name = "image_url", length = 255)
    private String imageUrl;

    @Column(name = "availability_status", length = 20)
    private String availabilityStatus;

    @Column(name = "has_gps")
    private Boolean hasGps;

    @Column(name = "has_leather_seats")
    private Boolean hasLeatherSeats;

    @Column(name = "has_sunroof")
    private Boolean hasSunroof;

    @Column(name = "has_premium_sound")
    private Boolean hasPremiumSound;

    @Column(name = "has_awd")
    private Boolean hasAwd;

    // Default daily rates based on vehicle type (included for completeness)
    public Double getDailyRate() {
        return switch (type.toLowerCase()) {
            case "luxury" -> 15000.0;
            case "suv" -> 8500.0;
            case "sedan" -> 5500.0;
            case "truck" -> 7000.0;
            case "bike" -> 2000.0;
            default -> 3500.0; // economy
        };
    }

    // Getters and Setters
    public String getVehicleId() { return vehicleId; }
    public void setVehicleId(String vehicleId) { this.vehicleId = vehicleId; }
    public String getBrand() { return brand; }
    public void setBrand(String brand) { this.brand = brand; }
    public String getModel() { return model; }
    public void setModel(String model) { this.model = model; }
    public String getType() { return type; }
    public void setType(String type) { this.type = type; }
    public Integer getYear() { return year; }
    public void setYear(Integer year) { this.year = year; }
    public Integer getMileage() { return mileage; }
    public void setMileage(Integer mileage) { this.mileage = mileage; }
    public String getFuelType() { return fuelType; }
    public void setFuelType(String fuelType) { this.fuelType = fuelType; }
    public Integer getSeatingCapacity() { return seatingCapacity; }
    public void setSeatingCapacity(Integer seatingCapacity) { this.seatingCapacity = seatingCapacity; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }
    public String getAvailabilityStatus() { return availabilityStatus; }
    public void setAvailabilityStatus(String availabilityStatus) { this.availabilityStatus = availabilityStatus; }
    public Boolean getHasGps() { return hasGps; }
    public void setHasGps(Boolean hasGps) { this.hasGps = hasGps; }
    public Boolean getHasLeatherSeats() { return hasLeatherSeats; }
    public void setHasLeatherSeats(Boolean hasLeatherSeats) { this.hasLeatherSeats = hasLeatherSeats; }
    public Boolean getHasSunroof() { return hasSunroof; }
    public void setHasSunroof(Boolean hasSunroof) { this.hasSunroof = hasSunroof; }
    public Boolean getHasPremiumSound() { return hasPremiumSound; }
    public void setHasPremiumSound(Boolean hasPremiumSound) { this.hasPremiumSound = hasPremiumSound; }
    public Boolean getHasAwd() { return hasAwd; }
    public void setHasAwd(Boolean hasAwd) { this.hasAwd = hasAwd; }
}