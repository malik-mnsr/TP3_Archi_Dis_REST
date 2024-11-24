package com.example.controller;

import com.example.model.Reservation;
import com.example.data.ReservationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.sql.Date;

@RestController
@RequestMapping("/ReservationService/api")
public class ReservationController {

    @Autowired
    private ReservationService repository;

    @PostMapping("/make-reservation")
    public ResponseEntity<Reservation> makeReservation(
            @RequestParam String name,
            @RequestParam Date startDate,
            @RequestParam Date endDate,
            @RequestParam int offer_id,
            @RequestParam int agency_id) {  // Added agency_id parameter

        try {
            // Validate input
            if (name == null || name.isEmpty()) {
                return ResponseEntity.badRequest().build(); // Return 400 Bad Request for invalid input
            }
            if (startDate == null || endDate == null || startDate.after(endDate)) {
                return ResponseEntity.badRequest().build(); // Return 400 Bad Request for invalid date range
            }

            // Validate agency_id (must be 1, 2, or 3)
            if (agency_id < 1 || agency_id > 3) {
                return ResponseEntity.badRequest().build(); // Return 400 Bad Request for invalid agency_id
            }

            // Create the reservation, passing the agency_id
            Reservation reservation = repository.createReservation(name, startDate, endDate, offer_id, agency_id);

            // Return the created reservation
            return ResponseEntity.ok(reservation);

        } catch (Exception e) {
            // Handle any exceptions and return 500 Internal Server Error
            return ResponseEntity.status(500).build();
        }
    }
}
