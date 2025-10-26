package com.vehiclerental.backend;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EnableJpaRepositories(basePackages = "com.vehiclerental.backend.repositories")
@EntityScan(basePackages = "com.vehiclerental.backend.models")
public class VehicalRentalSystemBackend extends SpringBootServletInitializer {
    public static void main(String[] args) {
        SpringApplication.run(VehicalRentalSystemBackend.class, args);
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(VehicalRentalSystemBackend.class);
    }
}
