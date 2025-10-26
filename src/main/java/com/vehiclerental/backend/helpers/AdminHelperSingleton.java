package com.vehiclerental.backend.helpers;

import com.vehiclerental.backend.models.User;
import java.util.List;

public class AdminHelperSingleton {

    // Single instance
    private static AdminHelperSingleton instance;

    // Private constructor
    private AdminHelperSingleton() {}

    // getInstance
    public static synchronized AdminHelperSingleton getInstance() {
        if (instance == null) {
            instance = new AdminHelperSingleton();
        }
        return instance;
    }

    // Helper method to get next UserID
    public String getNextAdminUserId(List<User> admins) {
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
        return String.format("A%03d", maxNum + 1);
    }
}
