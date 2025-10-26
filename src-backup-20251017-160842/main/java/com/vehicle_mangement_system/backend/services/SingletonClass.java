package com.vehicle_mangement_system.backend.services;
import com.vehicle_mangement_system.backend.models.User;
import java.util.ArrayList;
import java.util.List;
/**
 * Singleton Pattern - Ensures a single instance of AdminManager
 * to manage admin user data in the system.
 */
public class SingletonClass {
    private static SingletonClass instance;
    private final List<User> adminCache = new ArrayList<>();

    private SingletonClass() { // Private constructor
    }

    //  Singleton getter
    public static synchronized SingletonClass getInstance() {
        if (instance == null) {
            instance = new SingletonClass();
        }
        return instance;
    }

    public void addAdmin(User admin) {
        adminCache.add(admin);
        System.out.println("Admin added: " + admin.getUsername());
    }

    public List<User> getAllAdmins() {
        return adminCache;
    }
}
