package com.example.data;

import com.example.model.Offer;
import com.example.repository.HotelAvailabilityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@Service
public class OfferService {

    @Autowired
    private HotelAvailabilityService offerRepository;

    public List<Offer> getAvailableOffers(int agence_id, Date startDate, Date endDate, int numberOfPersons, String city, int minStars) {
        // Fetch all offers from the repository
        List<Offer> offers = offerRepository.findAll();

        // If there are no offers, return an empty list
        if (offers == null || offers.isEmpty()) {
            return new ArrayList<>(); // You can also log here if needed
        }

        List<Offer> availableOffers = new ArrayList<>();
        for (Offer offer : offers) {
            // Ensure dates are not null before comparing
            if (startDate != null && endDate != null) {
                // Logic to compare dates using compareTo method
                if (startDate.compareTo(offer.getAvailabilityStart()) >= 0 && // startDate >= offer.getAvailabilityStart()
                        endDate.compareTo(offer.getAvailabilityEnd()) <= 0 &&   // endDate <= offer.getAvailabilityEnd()
                        offer.getAgencyId() == agence_id &&
                        offer.getNumberOfBeds() >= numberOfPersons &&
                        offer.getChambre().getHotel().getAdr().getCity().equalsIgnoreCase(city) &&              // Filter by city
                        offer.getChambre().getHotel().getStars()>= minStars
                ) {                        // Filter by minimum stars

                    availableOffers.add(offer);
                }
            }
        }

        return availableOffers;
    }
}
