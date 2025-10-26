package com.vehiclerental.backend.services;

import com.vehiclerental.backend.models.User;
import com.vehiclerental.backend.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public User findByUserId(String userId) {
        return userRepository.findById(userId).orElse(null);
    }
}