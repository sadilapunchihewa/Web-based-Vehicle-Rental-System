package com.vehicle_management_system.backend;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class VehicalRentalSystemBackend extends SpringBootServletInitializer {
    public static void main(String[] args) {
        SpringApplication.run(VehicalRentalSystemBackend.class, args);
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(VehicalRentalSystemBackend.class);
    }
}
