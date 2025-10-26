package com.vehicle_mangement_system.backend.service;

import com.vehicle_mangement_system.backend.models.Vehicle;
import com.vehicle_mangement_system.backend.repo.VehicleRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class VehicleService {

    private final VehicleRepository vehicleRepository;

    public VehicleService(VehicleRepository vehicleRepository) {
        this.vehicleRepository = vehicleRepository;
    }

    public List<Vehicle> getAllAvailableVehicles() {
        return vehicleRepository.findAvailableVehicles();
    }

    public Optional<Vehicle> getVehicleById(String vehicleId) {
        return vehicleRepository.findById(vehicleId);
    }

    public List<Vehicle> getVehiclesByType(String type) {
        return vehicleRepository.findByType(type);
    }

    public List<Vehicle> searchVehiclesByBrand(String brand) {
        return vehicleRepository.findByBrandContainingIgnoreCase(brand);
    }
}
