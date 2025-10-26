package com.vehicle_mangement_system.backend.controllers;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashboardController {

    // Helper method to check if user is admin
    private String checkAdmin(HttpSession session) {
        Object userObj = session.getAttribute("user");
        if (userObj == null) {
            return "redirect:/login";
        }

        // Assuming your User object has a getRole() method
        com.vehicle_mangement_system.backend.models.User user = (com.vehicle_mangement_system.backend.models.User) userObj;
        if (!"Admin".equals(user.getRole())) {
            return "redirect:/login";
        }

        return null;
    }

    // Admin Dashboard
    @GetMapping("/admin/dashboard")
    public String dashboard(HttpSession session, Model model) {
        String redirect = checkAdmin(session);
        if (redirect != null) return redirect;

        return "admin_dashboard"; // Your admin_dashboard.jsp
    }

    // Redirect sidebar "Manage Vehicles" link to MainController /vehicle_list
    @GetMapping("/admin/vehicle/list")
    public String redirectToVehicleList(HttpSession session) {
        String redirect = checkAdmin(session);
        if (redirect != null) return redirect;

        return "redirect:/vehicle_list"; // MainController handles this URL
    }
}
