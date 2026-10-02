package com.jobportal.controller;

import com.jobportal.dto.*;
import com.jobportal.model.User;
import com.jobportal.repository.UserRepository;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/auth")
@CrossOrigin
public class AuthController {
    private final UserRepository users;

    public AuthController(UserRepository users) {
        this.users = users;
    }

    @PostMapping("/register")
    public ResponseEntity<?> register(@RequestBody RegisterRequest request) {
        if (users.findByEmail(request.email()).isPresent()) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body("Email already registered");
        }

        User user = new User();
        user.setName(request.name());
        user.setEmail(request.email());
        user.setPassword(request.password());
        user.setSkills(request.skills());
        users.save(user);

        return ResponseEntity.status(HttpStatus.CREATED).body("Registration successful");
    }

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody LoginRequest request) {
        return users.findByEmailAndPassword(request.email(), request.password())
                .map(user -> ResponseEntity.ok(
                        new LoginResponse(user.getId(), user.getName(), user.getSkills())))
                .orElseGet(() -> ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                        .body("Invalid email or password"));
    }
}