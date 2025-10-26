package com.vehiclerental.backend.controllers;

import com.vehiclerental.backend.models.Vehicle;
import com.vehiclerental.backend.repositories.VehicleRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/vehicle")
public class VehicleController {

    private final VehicleRepository vehicleRepository;

    public VehicleController(VehicleRepository vehicleRepository) {
        this.vehicleRepository = vehicleRepository;
    }

    // List all vehicles (admin view)
    @GetMapping("/list")
    public String listVehicles(Model model, HttpSession session) {
        // Check if user is logged in and is admin
        Object user = session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        List<Vehicle> vehicles = vehicleRepository.findAll();
        model.addAttribute("vehicles", vehicles);
        return "vehicle_list";
    }

    // Show add vehicle form
    @GetMapping("/add")
    public String showAddForm(HttpSession session) {
        Object user = session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        return "vehicle_form"; // Controller returns "vehicle_form"
    }

    // Handle add vehicle
    @PostMapping("/add")
    public String addVehicle(@RequestParam String vehicleId,
                             @RequestParam String brand,
                             @RequestParam String model,
                             @RequestParam String type,
                             @RequestParam Integer year,
                             @RequestParam String fuelType,
                             @RequestParam Integer seatingCapacity,
                             @RequestParam(required = false) String description,
                             @RequestParam(required = false) Integer mileage,
                             @RequestParam(required = false) String imageUrl,
                             @RequestParam(defaultValue = "Available") String availabilityStatus,
                             @RequestParam(required = false, defaultValue = "false") Boolean hasGps,
                             @RequestParam(required = false, defaultValue = "false") Boolean hasLeatherSeats,
                             @RequestParam(required = false, defaultValue = "false") Boolean hasSunroof,
                             @RequestParam(required = false, defaultValue = "false") Boolean hasPremiumSound,
                             @RequestParam(required = false, defaultValue = "false") Boolean hasAwd,
                             HttpSession session,
                             Model modelAttr) {
        try {
            Object user = session.getAttribute("user");
            if (user == null) {
                return "redirect:/login";
            }

            // Check if vehicle ID already exists
            Optional<Vehicle> existing = vehicleRepository.findById(vehicleId);
            if (existing.isPresent()) {
                modelAttr.addAttribute("error", "Vehicle ID already exists");
                return "vehicle_add"; // Fallback view in case of error
            }

            Vehicle vehicle = new Vehicle();
            vehicle.setVehicleId(vehicleId);
            vehicle.setBrand(brand);
            vehicle.setModel(model);
            vehicle.setType(type);
            vehicle.setYear(year);
            vehicle.setFuelType(fuelType);
            vehicle.setSeatingCapacity(seatingCapacity);
            vehicle.setDescription(description);
            vehicle.setMileage(mileage);
            vehicle.setImageUrl(imageUrl);
            vehicle.setAvailabilityStatus(availabilityStatus);
            vehicle.setHasGps(hasGps);
            vehicle.setHasLeatherSeats(hasLeatherSeats);
            vehicle.setHasSunroof(hasSunroof);
            vehicle.setHasPremiumSound(hasPremiumSound);
            vehicle.setHasAwd(hasAwd);

            vehicleRepository.save(vehicle);

            return "redirect:/vehicle/list";
        } catch (Exception e) {
            e.printStackTrace();
            modelAttr.addAttribute("error", "Error: " + e.getMessage());
            return "vehicle_add";
        }
    }

    // ... (Other controller methods: edit, update, delete, view)
    // ...
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable String id, Model model, HttpSession session) {
        Object user = session.getAttribute("user");
        if (user == null) { return "redirect:/login"; }
        Optional<Vehicle> vehicle = vehicleRepository.findById(id);
        if (vehicle.isEmpty()) { return "redirect:/vehicle/list"; }
        model.addAttribute("vehicle", vehicle.get());
        return "vehicle_edit";
    }

    @PostMapping("/update/{id}")
    public String updateVehicle(@PathVariable String id, @RequestParam String brand, @RequestParam String model, @RequestParam String type, @RequestParam Integer year, @RequestParam String fuelType, @RequestParam Integer seatingCapacity, @RequestParam(required = false) String description, @RequestParam(required = false) Integer mileage, @RequestParam(required = false) String imageUrl, @RequestParam String availabilityStatus, @RequestParam(required = false, defaultValue = "false") Boolean hasGps, @RequestParam(required = false, defaultValue = "false") Boolean hasLeatherSeats, @RequestParam(required = false, defaultValue = "false") Boolean hasSunroof, @RequestParam(required = false, defaultValue = "false") Boolean hasPremiumSound, @RequestParam(required = false, defaultValue = "false") Boolean hasAwd, HttpSession session, Model modelAttr) {
        try {
            Object user = session.getAttribute("user");
            if (user == null) { return "redirect:/login"; }
            Optional<Vehicle> vehicleOpt = vehicleRepository.findById(id);
            if (vehicleOpt.isEmpty()) { return "redirect:/vehicle/list"; }
            Vehicle vehicle = vehicleOpt.get();
            vehicle.setBrand(brand); vehicle.setModel(model); vehicle.setType(type); vehicle.setYear(year); vehicle.setFuelType(fuelType); vehicle.setSeatingCapacity(seatingCapacity); vehicle.setDescription(description); vehicle.setMileage(mileage); vehicle.setImageUrl(imageUrl); vehicle.setAvailabilityStatus(availabilityStatus); vehicle.setHasGps(hasGps); vehicle.setHasLeatherSeats(hasLeatherSeats); vehicle.setHasSunroof(hasSunroof); vehicle.setHasPremiumSound(hasPremiumSound); vehicle.setHasAwd(hasAwd);
            vehicleRepository.save(vehicle);
            return "redirect:/vehicle/list";
        } catch (Exception e) {
            e.printStackTrace();
            modelAttr.addAttribute("error", "Error: " + e.getMessage());
            return "vehicle_edit";
        }
    }

    @GetMapping("/delete/{id}")
    public String deleteVehicle(@PathVariable String id, HttpSession session) {
        Object user = session.getAttribute("user");
        if (user == null) { return "redirect:/login"; }
        vehicleRepository.deleteById(id);
        return "redirect:/vehicle/list";
    }

    @GetMapping("/view/{id}")
    public String viewVehicle(@PathVariable String id, Model model, HttpSession session) {
        Object user = session.getAttribute("user");
        if (user == null) { return "redirect:/login"; }
        Optional<Vehicle> vehicle = vehicleRepository.findById(id);
        if (vehicle.isEmpty()) { return "redirect:/vehicle/list"; }
        model.addAttribute("vehicle", vehicle.get());
        return "vehicle_view";
    }
}