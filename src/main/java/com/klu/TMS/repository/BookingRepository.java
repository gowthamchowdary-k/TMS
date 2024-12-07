package com.klu.TMS.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.klu.TMS.model.Booking;

@Repository
public interface BookingRepository extends JpaRepository<Booking, Long> {

    // Find bookings by country
    List<Booking> findByCountry(String country);

    // Find bookings by place
    List<Booking> findByPlaceName(String placeName);

    // Find bookings by transport type
    List<Booking> findByTransportType(String transportType);

    // Custom query to find by country and travel date
    @Query("SELECT b FROM Booking b WHERE b.country = :country AND b.travelDate = :travelDate")
    List<Booking> findByCountryAndTravelDate(@Param("country") String country, @Param("travelDate") String travelDate);
}
