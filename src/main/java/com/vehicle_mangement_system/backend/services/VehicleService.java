package com.vehicle_mangement_system.backend.services;
import com.vehicle_mangement_system.backend.models.Vehicle;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

public interface VehicleService {
    List<Vehicle> getAllVehicles();
    Vehicle getVehicleById(Long id);
    void saveVehicle(Vehicle vehicle, MultipartFile imageFile) throws IOException;
    void deleteVehicle(Long id);
    void setPendingDelete(Long id);
}