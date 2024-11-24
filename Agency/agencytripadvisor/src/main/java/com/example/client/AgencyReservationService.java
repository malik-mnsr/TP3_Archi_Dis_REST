package com.example.client;

import com.example.model.Reservation;
import com.example.repository.ReservationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.http.ResponseEntity;

import java.sql.Date;
import java.util.List;

@Service
public class AgencyReservationService {

    private final RestTemplate restTemplate;
    private final ReservationRepository reservationRepository;

    private final List<String> serviceUrls = List.of(
            "http://localhost:8080/ReservationService/api/make-reservation",
            "http://localhost:8081/ReservationService/api/make-reservation",
            "http://localhost:8082/ReservationService/api/make-reservation"
    );

    @Autowired
    public AgencyReservationService(RestTemplate restTemplate, ReservationRepository reservationRepository) {
        this.restTemplate = restTemplate;
        this.reservationRepository = reservationRepository;
    }

    public Reservation makeReservation(String name, Date startDate, Date endDate, int offerId, int agencyId) {
        for (String baseUrl : serviceUrls) {
            try {
                // Construct query parameters
                String queryParams = String.format("?name=%s&startDate=%s&endDate=%s&offer_id=%d&agency_id=%d",
                        name, startDate.toString(), endDate.toString(), offerId, agencyId);

                // Call the external reservation service
                ResponseEntity<Reservation> response = restTemplate.postForEntity(baseUrl + queryParams, null, Reservation.class);

                if (response.getStatusCode().is2xxSuccessful()) {
                    Reservation reservation = response.getBody();

                    // Save the reservation locally in the agency's database
                    if (reservation != null) {
                        reservation.setAgencyId(agencyId);
                        return reservationRepository.save(reservation);
                    }
                }
            } catch (Exception e) {
                // Log the error and continue with the next URI
                System.err.println("Failed to connect to service at " + baseUrl + ": " + e.getMessage());
            }
        }

        // If all URIs fail
        throw new RuntimeException("Failed to make reservation. All services are unreachable.");
    }
}
