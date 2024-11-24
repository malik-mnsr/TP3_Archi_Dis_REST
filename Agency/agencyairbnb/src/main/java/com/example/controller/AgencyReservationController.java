package com.example.controller;


import com.example.model.Reservation;
import com.example.client.AgencyReservationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


import java.sql.Date;

@RestController
@RequestMapping("/agencyAirbnb/api")
public class AgencyReservationController {

    @Autowired
    private AgencyReservationService agencyReservationService;

    @PostMapping("/reserve")
    public ResponseEntity<Reservation> reserve(
            @RequestParam String name,
            @RequestParam Date startDate,
            @RequestParam Date endDate,
            @RequestParam int offerId,
            @RequestParam int agencyId) {

        try {
            Reservation reservation = agencyReservationService.makeReservation(name, startDate, endDate, offerId, 2);
            return ResponseEntity.ok(reservation);
        } catch (Exception e) {
            return ResponseEntity.status(500).build();
        }
    }
}
