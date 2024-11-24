package com.example.data;

import com.example.model.Reservation;
import com.example.repository.HotelReservationService;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.time.LocalDate;

@Service
public class ReservationService {

    @Autowired
    private HotelReservationService reservationRepository;  // Ensure it's a Spring-managed bean

    // Optional: If you need to manually create the Reservation object before saving
    public Reservation createReservation(String name, Date startDate, Date endDate, int offer_id, int agency_id) {
        Reservation reservation = new Reservation();
        reservation.setName(name);
        reservation.setStartDate(startDate);
        reservation.setEndDate(endDate);
        reservation.setOfferId(offer_id);
        reservation.setReservationDate(new Date(System.currentTimeMillis())); // Or use LocalDate.now() -> Date.valueOf(localDate)
        saveReservation(reservation);
        return reservation;

    }

    @Transactional
    public Reservation saveReservation(Reservation reservation) {
        return reservationRepository.save(reservation);
    }
}
