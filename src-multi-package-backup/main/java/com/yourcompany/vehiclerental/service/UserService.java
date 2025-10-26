package com.yourcompany.vehiclerental.service;

import com.yourcompany.vehiclerental.entity.User;
import com.yourcompany.vehiclerental.repository.UserRepository;
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