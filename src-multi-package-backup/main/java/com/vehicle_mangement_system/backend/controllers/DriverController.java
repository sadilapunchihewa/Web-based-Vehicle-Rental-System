package com.vehicle_mangement_system.backend.controllers;

import com.vehicle_mangement_system.backend.models.Driver;
import com.vehicle_mangement_system.backend.Service.DriverService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/driver")
public class DriverController {

    @Autowired
    private DriverService driverService;

    // Display all drivers
    @GetMapping("/list")
    public String getAllDrivers(Model model) {
        List<Driver> drivers = driverService.getAllDrivers();
        model.addAttribute("drivers", drivers);
        return "driver_list";
    }

    // Show form to add new driver
    @GetMapping("/add")
    public String showAddDriverForm(Model model) {
        String suggestedUserId = driverService.generateDriverId();
        model.addAttribute("suggestedUserId", suggestedUserId);
        model.addAttribute("driver", new Driver());
        return "driver_add";
    }

    // Save new driver
    @PostMapping("/add")
    public String createDriver(@ModelAttribute Driver driver, RedirectAttributes redirectAttributes) {
        try {
            driverService.saveDriver(driver);
            redirectAttributes.addFlashAttribute("success", "Driver registered successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Error registering driver: " + e.getMessage());
        }
        return "redirect:/driver/list";
    }

    // Show edit form
    @GetMapping("/edit/{driverId}")
    public String showEditDriverForm(@PathVariable String driverId, Model model) {
        Driver driver = driverService.getDriverById(driverId)
                .orElseThrow(() -> new RuntimeException("Driver not found with id: " + driverId));
        model.addAttribute("driver", driver);
        return "driver_edit";
    }

    // Update driver
    @PostMapping("/update/{driverId}")
    public String updateDriver(@PathVariable String driverId, @ModelAttribute Driver driverDetails,
                               RedirectAttributes redirectAttributes) {
        try {
            driverService.updateDriver(driverId, driverDetails);
            redirectAttributes.addFlashAttribute("success", "Driver updated successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Error updating driver: " + e.getMessage());
        }
        return "redirect:/driver/list";
    }

    // Delete driver
    @GetMapping("/delete/{driverId}")
    public String deleteDriver(@PathVariable String driverId, RedirectAttributes redirectAttributes) {
        try {
            driverService.deleteDriver(driverId);
            redirectAttributes.addFlashAttribute("success", "Driver deleted successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Error deleting driver: " + e.getMessage());
        }
        return "redirect:/driver/list";
    }

    // View driver details
    @GetMapping("/view/{driverId}")
    public String viewDriver(@PathVariable String driverId, Model model) {
        Driver driver = driverService.getDriverById(driverId)
                .orElseThrow(() -> new RuntimeException("Driver not found with id: " + driverId));
        model.addAttribute("driver", driver);
        return "driver_view";
    }

    // Update driver status
    @GetMapping("/update-status/{driverId}")
    public String updateDriverStatus(@PathVariable String driverId,
                                     @RequestParam String status,
                                     RedirectAttributes redirectAttributes) {
        try {
            Driver driver = driverService.getDriverById(driverId)
                    .orElseThrow(() -> new RuntimeException("Driver not found"));
            driver.setDriverStatus(status);
            driverService.updateDriver(driverId, driver);
            redirectAttributes.addFlashAttribute("success", "Driver status updated successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Error updating driver status: " + e.getMessage());
        }
        return "redirect:/driver/list";
    }
}
