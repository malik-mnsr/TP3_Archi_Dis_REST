package com.example.controller;

import com.example.model.Agency;
import com.example.repository.AgencyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.List;
import java.util.ArrayList;

@RestController
@RequestMapping("/agencyAirbnb/api")
public class AgencyAvailabilityController {
    @Autowired
    private AgencyRepository repository;

    @Autowired
    private RestTemplate restTemplate;

    // Fetch all agencies
    @GetMapping("/list")
    public List<Agency> getAll() {
        return repository.findAll();
    }

    @PostMapping("/check-availability")
    public ResponseEntity<?> checkAvailability(
            @RequestParam int agence_id,
            @RequestParam String username,
            @RequestParam String password,
            @RequestParam String city,
            @RequestParam String startDate,
            @RequestParam String endDate,
            @RequestParam int numberOfPersons,
            @RequestParam int minStars) {

        // Validation des entrées
        if (username == null || username.isEmpty()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Username is required.");
        }
        if (password == null || password.isEmpty()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Password is required.");
        }
        if (city == null || city.isEmpty()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("City is required.");
        }
        if (startDate == null || startDate.isEmpty() || endDate == null || endDate.isEmpty()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Start and end dates are required.");
        }
        if (numberOfPersons <= 0) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Number of persons must be greater than 0.");
        }
        if (minStars < 1) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Minimum stars must be at least 1.");
        }

        // Valider les dates
        if (!isValidDateRange(startDate, endDate)) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("Start date must be before end date.");
        }


        // List of URLs for the availability service of different hotels
        List<String> urls = List.of(
                "http://localhost:8080/AvailabilityService/api/check-availability",
                "http://localhost:8081/AvailabilityService/api/check-availability",
                "http://localhost:8082/AvailabilityService/api/check-availability"
        );

        // List to store the results
        List<Object> allOffers = new ArrayList<>();

        // Loop through each URL and get the availability
        for (String url : urls) {
            try {
                // Prepare the request parameters
                MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
                params.add("agence_id", "2");
                params.add("username", "airbnb");
                params.add("password", "admin");
                params.add("city", city);
                params.add("startDate", startDate);
                params.add("endDate", endDate);
                params.add("numberOfPersons", String.valueOf(numberOfPersons));
                params.add("minStars", String.valueOf(minStars));

                // Configurer les en-têtes HTTP
                HttpHeaders headers = new HttpHeaders();
                headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

                // Créer l'entité HTTP
                HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(params, headers);

                // Faire la requête API et obtenir la réponse
                ResponseEntity<List> response = restTemplate.exchange(url, HttpMethod.POST, entity, List.class);

                // Ajouter les résultats si la réponse est OK
                if (response.getStatusCode() == HttpStatus.OK && response.getBody() != null) {
                    allOffers.addAll(response.getBody());
                }
            } catch (Exception e) {
                // Journaliser l'erreur et continuer avec l'URL suivante
                System.err.println("Error calling API: " + url + ". Message: " + e.getMessage());
            }
        }

        // Retourner la liste des offres, même si elle est vide
        return ResponseEntity.ok(allOffers);
    }

    // Helper method to validate date range
    private boolean isValidDateRange(String startDate, String endDate) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        try {
            LocalDate start = LocalDate.parse(startDate, formatter);
            LocalDate end = LocalDate.parse(endDate, formatter);
            return start.isBefore(end);
        } catch (DateTimeParseException e) {
            System.err.println("Invalid date format: " + e.getMessage());
            return false; // Invalid date format
        }
    }
}
