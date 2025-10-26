package com.vehicle_management_system.backend.controllers;

import com.vehicle_management_system.backend.models.User;
import com.vehicle_management_system.backend.repo.UserRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class AuthController {

    private final UserRepository userRepo;

    public AuthController(UserRepository userRepo) {
        this.userRepo = userRepo;
    }

    @GetMapping("/login")
    public String loginForm() {
        return "login"; // /WEB-INF/jsp/login.jsp
    }

    @PostMapping("/login")
    public String doLogin(@RequestParam String username,
                          @RequestParam String password,
                          HttpSession session,
                          Model model) {
        User u = userRepo.findByUsername(username).orElse(null);

        if (u != null && u.getPassword().equals(password)) {
            // Save user in session
            session.setAttribute("user", u);
            return "redirect:/home";
        } else {
            model.addAttribute("error", "Invalid username or password");
            return "login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login?logout=true";
    }
}
