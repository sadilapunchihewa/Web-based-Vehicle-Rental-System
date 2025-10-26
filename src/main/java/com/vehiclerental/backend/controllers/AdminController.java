package com.vehiclerental.backend.controllers;

import com.vehiclerental.backend.helpers.AdminHelperSingleton;
import com.vehiclerental.backend.models.User;
import com.vehiclerental.backend.repositories.UserRepository;
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

        // Suggest next UserID using singleton
        String suggestedUserId = AdminHelperSingleton.getInstance()
                .getNextAdminUserId(userRepository.findByRole("Admin"));

        model.addAttribute("suggestedUserId", suggestedUserId);
        model.addAttribute("admin", new User());
        return "admin_add";
    }

    // Save new admin
    @PostMapping("/add")
    public String addAdmin(@ModelAttribute("admin") User admin, HttpSession session, Model model) {
        String redirect = checkAdmin(session);
        if (redirect != null) return redirect;

        if (!admin.getFirstName().matches("^[A-Za-z]+$")) {
            model.addAttribute("error", "First name should contain only letters.");
            model.addAttribute("suggestedUserId", AdminHelperSingleton.getInstance()
                    .getNextAdminUserId(userRepository.findByRole("Admin")));
            return "admin_add";
        }

        if (!admin.getLastName().matches("^[A-Za-z]+$")) {
            model.addAttribute("error", "Last name should contain only letters.");
            model.addAttribute("suggestedUserId", AdminHelperSingleton.getInstance()
                    .getNextAdminUserId(userRepository.findByRole("Admin")));
            return "admin_add";
        }

        if (!admin.getUsername().matches("^[a-zA-Z0-9]{3,20}$")) {
            model.addAttribute("error", "Username must be 3–20 characters long and only contain letters or numbers.");
            model.addAttribute("suggestedUserId", AdminHelperSingleton.getInstance()
                    .getNextAdminUserId(userRepository.findByRole("Admin")));
            return "admin_add";
        }

        if (!admin.getPassword().matches("^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d).{6,}$")) {
            model.addAttribute("error", "Password must have at least one uppercase, one lowercase, one number, and be 6+ characters long.");
            model.addAttribute("suggestedUserId", AdminHelperSingleton.getInstance()
                    .getNextAdminUserId(userRepository.findByRole("Admin")));
            return "admin_add";
        }

        if (admin.getContactInfo() != null && !admin.getContactInfo().isEmpty()) {
            boolean validEmail = admin.getContactInfo().matches("^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$");
            boolean validPhone = admin.getContactInfo().matches("^[0-9]{10}$");
            if (!validEmail && !validPhone) {
                model.addAttribute("error", "Contact info must be a valid email address or 10-digit phone number.");
                model.addAttribute("suggestedUserId", AdminHelperSingleton.getInstance()
                        .getNextAdminUserId(userRepository.findByRole("Admin")));
                return "admin_add";
            }
        }

        // Save the new admin if validation passes
        try {
            admin.setRole("Admin");
            userRepository.save(admin);

            // Add message to the model for JSP
            model.addAttribute("successMessage", "Admin successfully added! UserID: " + admin.getUserId());

            return "admin_add"; // Show the same form page with message
        } catch (DataIntegrityViolationException e) {
            model.addAttribute("error", "Username or User ID already exists.");
            model.addAttribute("suggestedUserId", AdminHelperSingleton.getInstance()
                    .getNextAdminUserId(userRepository.findByRole("Admin")));
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
}
