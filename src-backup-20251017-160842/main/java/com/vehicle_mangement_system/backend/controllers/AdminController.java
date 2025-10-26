package com.vehicle_mangement_system.backend.controllers;

import com.vehicle_mangement_system.backend.models.User;
import com.vehicle_mangement_system.backend.repo.UserRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.vehicle_mangement_system.backend.services.SingletonClass;


import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private UserRepository userRepository;

    // Admin check
    private String checkAdmin(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null || !"Admin".equals(user.getRole())) {
            return "redirect:/login";
        }
        return null;
    }

    // List admins
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

        model.addAttribute("admin", new User());
        model.addAttribute("suggestedUserId", getNextAdminUserId());
        return "admin_add";  // JSP for adding admin
    }

    // Save new admin
    @PostMapping("/add")
    public String saveAdmin(@ModelAttribute("admin") User admin, HttpSession session, Model model) {
        String redirect = checkAdmin(session);
        if (redirect != null) return redirect;

        try {
            admin.setRole("Admin");
            userRepository.save(admin);

            // Add to Singleton cache
            SingletonClass.getInstance().addAdmin(admin);
            System.out.println("Admins in Singleton: " + SingletonClass.getInstance().getAllAdmins().size());

            return "redirect:/admin/list";
        } catch (DataIntegrityViolationException e) {
            model.addAttribute("error", "Username or User ID already exists");
            model.addAttribute("admin", admin);
            return "admin_add";
        }
    }

    // Edit admin
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") String id, Model model, HttpSession session) {
        String redirect = checkAdmin(session);
        if (redirect != null) return redirect;

        User admin = userRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid admin Id:" + id));
        model.addAttribute("admin", admin);
        return "admin_edit";
    }

    @PostMapping("/update/{id}")
    public String updateAdmin(@PathVariable("id") String id, @ModelAttribute("admin") User admin, HttpSession session) {
        String redirect = checkAdmin(session);
        if (redirect != null) return redirect;

        User existing = userRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid admin Id:" + id));

        existing.setFirstName(admin.getFirstName());
        existing.setLastName(admin.getLastName());
        existing.setUsername(admin.getUsername());
        existing.setPassword(admin.getPassword());
        existing.setContactInfo(admin.getContactInfo());

        userRepository.save(existing);
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

    // Suggest next UserID
    private String getNextAdminUserId() {
        List<User> admins = userRepository.findByRole("Admin");
        int max = 0;
        for (User a : admins) {
            if (a.getUserId().startsWith("A")) {
                try { int num = Integer.parseInt(a.getUserId().substring(1)); if (num > max) max = num; }
                catch(NumberFormatException ignored){}
            }
        }
        return String.format("A%03d", max + 1);
    }

    // Test Singleton cache
    @GetMapping("/test-cache")
    @ResponseBody
    public String testAdminCache(HttpSession session) {
        String redirect = checkAdmin(session);
        if (redirect != null) return "Not authorized";

        List<User> cachedAdmins = SingletonClass.getInstance().getAllAdmins();
        StringBuilder sb = new StringBuilder("Admins in Singleton: " + cachedAdmins.size() + "<br>");
        cachedAdmins.forEach(a -> sb.append(a.getUsername()).append("<br>"));
        return sb.toString();
    }
}
