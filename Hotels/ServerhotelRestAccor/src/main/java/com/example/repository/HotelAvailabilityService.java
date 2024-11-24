package com.example.repository;

import com.example.model.Hotel;
import com.example.model.Offer;
import org.springframework.data.jpa.repository.JpaRepository;

public interface HotelAvailabilityService extends JpaRepository<Offer, Integer> {
}
