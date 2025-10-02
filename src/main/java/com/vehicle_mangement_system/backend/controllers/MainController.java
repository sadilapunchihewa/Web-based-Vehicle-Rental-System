package com.vehicle_mangement_system.backend.controllers;
import com.vehicle_mangement_system.backend.models.Vehicle;
import com.vehicle_mangement_system.backend.services.VehicleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


@Controller
public class    MainController {

    private final VehicleService vehicleService;

    @Autowired
    public MainController(VehicleService vehicleService) {
        this.vehicleService = vehicleService;
    }

    @GetMapping("/home")
    public String index() {
        return "home";
    }

    @GetMapping("/vehicle_list")
    public String vehicleList(@RequestParam(value = "sortBy", required = false, defaultValue = "none") String sortBy,
                              @RequestParam(value = "statusFilter", required = false, defaultValue = "all") String statusFilter,
                              Model model) {
        List<Vehicle> vehicles = vehicleService.getAllVehicles();
        if ("type".equals(sortBy)) {
            vehicles.sort((v1, v2) -> {
                int compare = (v1.getType() != null ? v1.getType() : "").compareTo(v2.getType() != null ? v2.getType() : "");
                if (compare != 0) return compare;
                return (v1.getModel() != null ? v1.getModel() : "").compareTo(v2.getModel() != null ? v2.getModel() : "");
            });
        } else if ("model".equals(sortBy)) {
            vehicles.sort((v1, v2) -> (v1.getModel() != null ? v1.getModel() : "").compareTo(v2.getModel() != null ? v2.getModel() : ""));
        }
        if (!"all".equals(statusFilter)) {
            vehicles = vehicles.stream()
                    .filter(v -> statusFilter.equals(v.getStatus()))
                    .toList();
        }
        model.addAttribute("vehicles", vehicles);
        model.addAttribute("sortBy", sortBy);
        model.addAttribute("statusFilter", statusFilter);
        return "Vehicle_List";
    }

    @GetMapping("/vehicle_add")
    public String vehicleAdd(Model model) {
        model.addAttribute("vehicle", new Vehicle());
        return "Vehicle_AddForm";
    }

    @PostMapping("/vehicle_add")
    public String addVehicle(@ModelAttribute Vehicle vehicle,
                             @RequestParam("imageFile") MultipartFile imageFile,
                             @RequestParam(value = "features", required = false) List<String> features) throws IOException {
        vehicle.setFeatures(features != null ? String.join(", ", features) : "");
        vehicle.setStatus("Available");
        vehicleService.saveVehicle(vehicle, imageFile);
        return "redirect:/vehicle_list";
    }

    @GetMapping("/vehicle_details/{id}")
    public String vehicleDetails(@PathVariable Long id, Model model) {
        Vehicle vehicle = vehicleService.getVehicleById(id);
        if (vehicle == null) {
            return "redirect:/vehicle_list";
        }
        model.addAttribute("vehicle", vehicle);
        if (vehicle.getFeatures() != null) {
            model.addAttribute("vehicleFeatures", Arrays.asList(vehicle.getFeatures().split(", ")));
        } else {
            model.addAttribute("vehicleFeatures", new ArrayList<>());
        }
        return "Vehicle_Details";
    }

    @GetMapping("/vehicle_edit/{id}")
    public String vehicleEdit(@PathVariable Long id, Model model) {
        Vehicle vehicle = vehicleService.getVehicleById(id);
        if (vehicle == null) {
            return "redirect:/vehicle_list";
        }
        model.addAttribute("vehicle", vehicle);
        if (vehicle.getFeatures() != null) {
            model.addAttribute("vehicleFeatures", Arrays.asList(vehicle.getFeatures().split(", ")));
        } else {
            model.addAttribute("vehicleFeatures", new ArrayList<>());
        }
        return "Vehicle_EditForm";
    }

    @PostMapping("/vehicle_edit/{id}")
    public String updateVehicle(@PathVariable Long id,
                                @ModelAttribute Vehicle updatedVehicle,
                                @RequestParam("imageFile") MultipartFile imageFile,
                                @RequestParam(value = "features", required = false) List<String> features) throws IOException {
        Vehicle existing = vehicleService.getVehicleById(id);
        if (existing != null) {
            existing.setBrand(updatedVehicle.getBrand());
            existing.setModel(updatedVehicle.getModel());
            existing.setType(updatedVehicle.getType());
            existing.setYear(updatedVehicle.getYear());
            existing.setMileage(updatedVehicle.getMileage());
            existing.setFuelType(updatedVehicle.getFuelType());
            existing.setSeatingCapacity(updatedVehicle.getSeatingCapacity());
            existing.setDescription(updatedVehicle.getDescription());
            existing.setFeatures(features != null ? String.join(", ", features) : "");
            existing.setStatus(updatedVehicle.getStatus());
            vehicleService.saveVehicle(existing, imageFile);
        }
        return "redirect:/vehicle_details/" + id;
    }

    @GetMapping("/vehicle_delete/{id}")
    public String deleteVehicle(@PathVariable Long id) {
        vehicleService.setPendingDelete(id);
        return "redirect:/vehicle_list";
    }

    @GetMapping("/vehicle_confirm_delete/{id}")
    public String confirmDeleteVehicle(@PathVariable Long id) {
        vehicleService.deleteVehicle(id);
        return "redirect:/vehicle_list";
    }

    @GetMapping("/vehicle_rent/{id}")
    public String rentVehicle(@PathVariable Long id) throws IOException {
        Vehicle vehicle = vehicleService.getVehicleById(id);
        if (vehicle != null && "Available".equals(vehicle.getStatus())) {
            vehicle.setStatus("Rented");
            vehicleService.saveVehicle(vehicle, null);
        }
        return "redirect:/vehicle_list";
    }
}