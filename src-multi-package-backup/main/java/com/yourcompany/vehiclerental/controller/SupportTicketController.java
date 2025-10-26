package com.yourcompany.vehiclerental.controller;

import com.yourcompany.vehiclerental.entity.SupportTicket;
import com.yourcompany.vehiclerental.entity.User;
import com.yourcompany.vehiclerental.service.SupportTicketService;
import com.yourcompany.vehiclerental.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class SupportTicketController {

    @Autowired
    private SupportTicketService ticketService;

    @Autowired
    private UserService userService;

    @GetMapping("/dashboard")
    public String dashboard(HttpSession session) {
        String userId = (String) session.getAttribute("userId");
        if (userId != null) {
            User user = userService.findByUserId(userId);
            if ("SupportAgent".equals(user.getRole())) {
                return "redirect:/support/tickets";
            }
            return "redirect:/customer/tickets";
        }
        return "redirect:/";
    }

    @GetMapping("/customer/tickets")
    public String customerTickets(Model model, HttpSession session, @RequestParam(required = false) String userIdParam) {
        String userId = (String) session.getAttribute("userId");
        if (userId == null && userIdParam != null) {
            userId = userIdParam;
            session.setAttribute("userId", userId);
        }
        if (userId == null) {
            userId = "C001";
        }
        User user = userService.findByUserId(userId);
        if (user == null) {
            return "redirect:/customer/tickets?error=invalid-user";
        }
        List<SupportTicket> tickets = ticketService.getTicketsByCustomer(userId);
        model.addAttribute("tickets", tickets);
        return "customer-tickets";
    }

    @GetMapping("/customer/ticket/new")
    public String newTicketForm(HttpSession session, Model model) {
        String userId = (String) session.getAttribute("userId");
        if (userId == null) {
            model.addAttribute("error", "Please provide user ID for submission.");
        }
        return "new-ticket";
    }

    @PostMapping("/customer/ticket/new")
    public String createTicket(@RequestParam("description") String description, HttpSession session, @RequestParam(required = false) String userIdParam) {
        String userId = (String) session.getAttribute("userId");
        if (userId == null && userIdParam != null) {
            userId = userIdParam;
            session.setAttribute("userId", userId);
        }
        if (userId == null) {
            return "redirect:/customer/ticket/new?error=no-user";
        }
        User user = userService.findByUserId(userId);
        if (user == null) {
            return "redirect:/customer/ticket/new?error=invalid-user";
        }
        try {
            ticketService.createTicket(user, description);
            return "redirect:/customer/tickets?success=true";
        } catch (Exception e) {
            return "redirect:/customer/tickets?error=Failed to create ticket: " + e.getMessage();
        }
    }

    @GetMapping("/support/tickets")
    public String supportTickets(Model model) {
        List<SupportTicket> tickets = ticketService.getAllTickets();
        model.addAttribute("tickets", tickets);
        return "support-tickets";
    }

    @GetMapping("/support/ticket/update/{id}")
    public String updateTicketForm(@PathVariable("id") String id, Model model) {
        SupportTicket ticket = ticketService.findById(id).orElseThrow(() -> new RuntimeException("Ticket not found"));
        model.addAttribute("ticket", ticket);
        return "update-ticket";
    }

    @PostMapping("/support/ticket/update/{id}")
    public String updateTicket(@PathVariable("id") String id, @RequestParam("status") String status, @RequestParam("response") String response) {
        ticketService.updateTicket(id, status, response);
        return "redirect:/support/tickets";
    }

    @PostMapping("/support/ticket/delete/{id}")
    public String deleteTicket(@PathVariable("id") String id) {
        ticketService.deleteTicket(id);
        return "redirect:/support/tickets";
    }
}