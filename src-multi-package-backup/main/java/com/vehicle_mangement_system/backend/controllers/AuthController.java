package com.vehicle_mangement_system.backend.controllers;

import com.vehicle_mangement_system.backend.models.User;
import com.vehicle_mangement_system.backend.repo.UserRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;
import java.util.UUID;

@Controller
public class AuthController {

    private final UserRepository userRepo;

    public AuthController(UserRepository userRepo) {
        this.userRepo = userRepo;
    }

    // Show signup page
    @GetMapping("/signup")
    public String signupPage() {
        return "signup";
    }

    // Handle signup
    @PostMapping("/signup")
    public String doRegister(@RequestParam String firstName,
                             @RequestParam String lastName,
                             @RequestParam String username,
                             @RequestParam String password,
                             @RequestParam String contactInfo,
                             Model model) {
        try {
            // Check if username already exists
            Optional<User> existingUser = userRepo.findByUsername(username);
            if (existingUser.isPresent()) {
                model.addAttribute("error", "Username already exists");
                return "signup";
            }

            // Generate unique 10-char userId (starts with 'C')
            String uniqueId = "C" + UUID.randomUUID().toString().replace("-", "").substring(0, 9);

            // Create new user
            User user = new User();
            user.setUserId(uniqueId);
            user.setFirstName(firstName);
            user.setLastName(lastName);
            user.setUsername(username);
            user.setPassword(password);
            user.setContactInfo(contactInfo);
            user.setRole("Customer");

            // Save to DB
            userRepo.save(user);

            model.addAttribute("success", "Account created successfully! Please login.");
            return "login";

        } catch (Exception e) {
            e.printStackTrace(); // log to console
            model.addAttribute("error", "Error: " + e.getMessage());
            return "signup";
        }
    }

    // Show login page
    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }

    // Handle login
    @PostMapping("/login")
    public String doLogin(@RequestParam String username,
                          @RequestParam String password,
                          HttpSession session,
                          Model model) {
        Optional<User> user = userRepo.findByUsername(username);

        if (user.isPresent() && user.get().getPassword().equals(password)) {
            User loggedInUser = user.get();
            session.setAttribute("user", loggedInUser);

            if (loggedInUser.getUserId().startsWith("A")) {
                loggedInUser.setRole("Admin");
                return "redirect:/admin/dashboard";
            } else {
                loggedInUser.setRole("Customer");
                return "redirect:/home";
            }

        } else {
            // Invalid login
            model.addAttribute("error", "Invalid username or password");
            return "login";
        }
    }

    // Handle logout
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
}
