package com.vehicle_mangement_system.backend.services;

import com.vehicle_mangement_system.backend.models.Vehicle;
import com.vehicle_mangement_system.backend.repo.VehicleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Base64;
import java.util.List;

@Service
public class VehicleServiceImpl implements VehicleService {

    @Autowired
    private VehicleRepository vehicleRepository;

    @Override
    public List<Vehicle> getAllVehicles() {
        return vehicleRepository.findAll();
    }

    @Override
    public Vehicle getVehicleById(Long id) {
        return vehicleRepository.findById(id).orElse(null);
    }

    @Override
    public void saveVehicle(Vehicle vehicle, MultipartFile imageFile) throws IOException {
        if (imageFile != null && !imageFile.isEmpty()) {
            byte[] bytes = imageFile.getBytes();
            String base64 = Base64.getEncoder().encodeToString(bytes);
            String contentType = imageFile.getContentType();
            vehicle.setImageBase64("data:" + contentType + ";base64," + base64);
        }
        vehicleRepository.save(vehicle);
    }

    @Override
    public void deleteVehicle(Long id) {
        vehicleRepository.deleteById(id);
    }

    @Override
    public void setPendingDelete(Long id) {
        Vehicle vehicle = getVehicleById(id);
        if (vehicle != null) {
            vehicle.setStatus("Pending Deletion");
            vehicleRepository.save(vehicle);
        }
    }
}