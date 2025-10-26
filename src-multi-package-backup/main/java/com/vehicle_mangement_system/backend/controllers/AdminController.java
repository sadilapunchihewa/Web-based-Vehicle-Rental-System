package com.vehicle_mangement_system.backend.controllers;

import com.vehicle_mangement_system.backend.models.User;
import com.vehicle_mangement_system.backend.repo.UserRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private UserRepository userRepository;

    // Helper method for admin check
    private String checkAdmin(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null || !"Admin".equals(user.getRole())) {
            return "redirect:/login";
        }
        return null;
    }

    // Admin dashboard
    @GetMapping("/dashboard")
    public String dashboard(Model model, HttpSession session) {
        String redirect = checkAdmin(session);
        if (redirect != null) return redirect;
        return "admin_dashboard";
    }

    // List all admins
    @GetMapping("/list")
    public String listAdmins(Model model, HttpSession session) {
        String redirect = checkAdmin(session);
        if (redirect != null) return redirect;

        List<User> admins = userRepository.findByRole("Admin");
        model.addAttribute("admins", admins);
        return "admin_list";
    }

    // Show add form
    @GetMapping("/add")
    public String showAddForm(Model model, HttpSession session) {
        String redirect = checkAdmin(session);
        if (redirect != null) return redirect;

        // Suggest next UserID
        String suggestedUserId = getNextAdminUserId();
        model.addAttribute("suggestedUserId", suggestedUserId);
        model.addAttribute("admin", new User());
        return "admin_add";
    }

    // Save new admin
    @PostMapping("/add")
    public String addAdmin(@ModelAttribute("admin") User admin, HttpSession session, Model model) {
        String redirect = checkAdmin(session);
        if (redirect != null) return redirect;

        try {
            admin.setRole("Admin");  // Force role as Admin
            userRepository.save(admin);
            return "redirect:/admin/list";
        } catch (DataIntegrityViolationException e) {
            model.addAttribute("error", "Username or User ID already exists");
            model.addAttribute("admin", admin);
            return "admin_add";
        }
    }

    // Show edit form
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") String id, Model model, HttpSession session) {
        String redirect = checkAdmin(session);
        if (redirect != null) return redirect;

        User admin = userRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid admin Id:" + id));
        model.addAttribute("admin", admin);
        return "admin_edit";
    }

    // Update admin
    @PostMapping("/update/{id}")
    public String updateAdmin(@PathVariable("id") String id, @ModelAttribute("admin") User admin, HttpSession session) {
        String redirect = checkAdmin(session);
        if (redirect != null) return redirect;

        User existingAdmin = userRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid admin Id:" + id));

        existingAdmin.setFirstName(admin.getFirstName());
        existingAdmin.setLastName(admin.getLastName());
        existingAdmin.setUsername(admin.getUsername());
        existingAdmin.setPassword(admin.getPassword());
        existingAdmin.setContactInfo(admin.getContactInfo());

        userRepository.save(existingAdmin);
        return "redirect:/admin/list";
    }

    // Delete admin
    @GetMapping("/delete/{id}")
    public String deleteAdmin(@PathVariable("id") String id, HttpSession session) {
        String redirect = checkAdmin(session);
        if (redirect != null) return redirect;

        userRepository.deleteById(id);
        return "redirect:/admin/list";
    }

    // Suggest next UserID for admins
    private String getNextAdminUserId() {
        // Find the maximum UserID starting with 'A'
        List<User> admins = userRepository.findByRole("Admin");
        int maxNum = 0;
        for (User admin : admins) {
            if (admin.getUserId().startsWith("A")) {
                try {
                    int num = Integer.parseInt(admin.getUserId().substring(1));
                    if (num > maxNum) maxNum = num;
                } catch (NumberFormatException e) {
                    // Ignore invalid formats
                }
            }
        }
        // format
        return String.format("A%03d", maxNum + 1);
    }
}