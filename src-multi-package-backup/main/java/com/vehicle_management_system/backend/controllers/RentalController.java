// RentalController.java
package com.vehicle_management_system.backend.controllers;

import com.vehicle_management_system.backend.models.Rental;
import com.vehicle_management_system.backend.models.User;
import com.vehicle_management_system.backend.models.Vehicle;
import com.vehicle_management_system.backend.repo.VehicleRepository;
import com.vehicle_management_system.backend.service.RentalService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/rental")
public class RentalController {

    private final VehicleRepository vehicleRepository;
    private final RentalService rentalService;

    public RentalController(VehicleRepository vehicleRepository, RentalService rentalService) {
        this.vehicleRepository = vehicleRepository;
        this.rentalService = rentalService;
    }

    @GetMapping("/vehicles")
    public String showVehicles(Model model) {
        List<Vehicle> availableVehicles = vehicleRepository.findAvailableVehicles();
        model.addAttribute("vehicles", availableVehicles);
        return "rental/vehicles";
    }

    @GetMapping("/book/{vehicleId}")
    public String showBookingForm(@PathVariable String vehicleId, Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        Vehicle vehicle = vehicleRepository.findById(vehicleId).orElse(null);
        if (vehicle == null) {
            return "redirect:/rental/vehicles";
        }

        model.addAttribute("vehicle", vehicle);
        model.addAttribute("rental", new Rental());
        return "rental/booking";
    }

    @PostMapping("/book")
    public String processBooking(@RequestParam String vehicleId,
                                 @RequestParam Integer numberOfDays,
                                 HttpSession session,
                                 RedirectAttributes redirectAttributes) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        try {
            rentalService.createBooking(user, vehicleId, numberOfDays);
            redirectAttributes.addFlashAttribute("success", "Booking submitted successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Failed to create booking: " + e.getMessage());
        }

        return "redirect:/rental/my-bookings";
    }

    @GetMapping("/my-bookings")
    public String showMyBookings(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        List<Rental> bookings = rentalService.getCustomerBookings(user.getUserId());
        model.addAttribute("bookings", bookings);
        return "rental/my-bookings";
    }

    @PostMapping("/update/{rentalId}")
    public String updateBooking(@PathVariable String rentalId,
                                @RequestParam Integer numberOfDays,
                                HttpSession session,
                                RedirectAttributes redirectAttributes) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        try {
            rentalService.updateBooking(rentalId, user.getUserId(), numberOfDays);
            redirectAttributes.addFlashAttribute("success", "Booking updated successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
        }

        return "redirect:/rental/my-bookings";
    }

    @PostMapping("/cancel/{rentalId}")
    public String cancelBooking(@PathVariable String rentalId,
                                HttpSession session,
                                RedirectAttributes redirectAttributes) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        try {
            rentalService.cancelBooking(rentalId, user.getUserId());
            redirectAttributes.addFlashAttribute("success", "Booking cancelled successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
        }

        return "redirect:/rental/my-bookings";
    }

    @PostMapping("/delete/{rentalId}")
    public String deleteBooking(@PathVariable String rentalId,
                                HttpSession session,
                                RedirectAttributes redirectAttributes) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        try {
            rentalService.deleteBooking(rentalId, user.getUserId());
            redirectAttributes.addFlashAttribute("success", "Booking deleted successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
        }

        return "redirect:/rental/my-bookings";
    }
}