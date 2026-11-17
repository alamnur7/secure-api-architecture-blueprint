package com.example.security.dto;


import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;


public class UserRegistrationDTO {


    @NotBlank(message = "Username cannot be empty")
    @Size(min = 4, max = 20, message = "Username must be between 4 and 20 characters")
    private String username;


    @NotBlank(message = "Email cannot be empty")
    @Email(message = "Invalid email format")
    private String email;


    @NotBlank(message = "Password cannot be empty")
    @Size(min = 12, message = "Password must be at least 12 characters long")
    private String password;


    // Getters and Setters
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }


    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }


    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
}