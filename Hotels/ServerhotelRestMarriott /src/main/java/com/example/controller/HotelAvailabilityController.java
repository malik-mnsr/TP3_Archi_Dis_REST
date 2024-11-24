package com.example.controller;

import com.example.data.OfferService;
import com.example.exceptions.*;
import com.example.model.Offer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/AvailabilityService/api")
public class HotelAvailabilityController {

    @Autowired
    private OfferService offerService;

    @PostMapping("/check-availability")
    public ResponseEntity<List<Offer>> checkAvailability(
            @RequestParam int agence_id,
            @RequestParam String username,
            @RequestParam String password,
            @RequestParam String startDate,  // receive as String
            @RequestParam String endDate,    // receive as String
            @RequestParam String city,       // New field to filter by city
            @RequestParam int minStars,      // New field to filter by minimum stars
            @RequestParam int numberOfPersons) {

        try {
            // Convert the date strings to java.sql.Date
            Date start = Date.valueOf(startDate); // Converts String to java.sql.Date
            Date end = Date.valueOf(endDate);     // Converts String to java.sql.Date

            // Validate agency credentials
            if (agence_id != 1 && agence_id != 2 && agence_id != 3) {
                throw new InvalidAgencyCredentialsException("Invalid credentials provided for the agency.");
            }

            // Validate number of persons
            if (numberOfPersons <= 0) {
                throw new PersonException("Number of persons must be greater than zero.");
            }

            // Validate minimum stars
            if (minStars < 1) {
                throw new IllegalArgumentException("Minimum stars must be at least 1.");
            }

            // Validate city
            if (city == null || city.isEmpty()) {
                throw new IllegalArgumentException("City cannot be empty.");
            }

            // Call the service layer to get available offers
            List<Offer> availableOffers = offerService.getAvailableOffers(agence_id, start, end, numberOfPersons, city, minStars);

            if (availableOffers.isEmpty()) {
                // If no offers are available, return an empty list with a 200 OK status
                return ResponseEntity.ok(new ArrayList<>());
            }

            return ResponseEntity.ok(availableOffers);

        } catch (InvalidAgencyCredentialsException | PersonException | IllegalArgumentException e) {
            // Return an empty list for invalid input or agency errors
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new ArrayList<>());
        }
    }
    }
