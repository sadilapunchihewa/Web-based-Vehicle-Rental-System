package com.vehicle_mangement_system.backend.controllers;

import com.vehicle_mangement_system.backend.models.User;
import com.vehicle_mangement_system.backend.models.Vehicle;
import com.vehicle_mangement_system.backend.services.VehicleService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class CustomerController {

    private final VehicleService vehicleService;

    @Autowired
    public CustomerController(VehicleService vehicleService) {
        this.vehicleService = vehicleService;
    }

    @GetMapping("/customer/dashboard")
    public String customerDashboard(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null || !"Customer".equalsIgnoreCase(user.getRole())) {
            return "redirect:/login";
        }

        model.addAttribute("username", user.getUsername());

        // Get all vehicles and pass to JSP
        List<Vehicle> vehicles = vehicleService.getAllVehicles();
        model.addAttribute("vehicles", vehicles);

        // Optional: default filters
        model.addAttribute("sortBy", "none");
        model.addAttribute("statusFilter", "all");

        return "customer_dashboard"; // JSP page
    }
}