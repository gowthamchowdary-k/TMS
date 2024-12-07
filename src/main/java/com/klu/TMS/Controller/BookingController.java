package com.klu.TMS.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.klu.TMS.model.Booking;
import com.klu.TMS.repository.BookingRepository;

@Controller
@RequestMapping("/api/bookings")
public class BookingController {

    @Autowired
    private BookingRepository bookingRepository;

    // Method to handle the form submission and save the booking
    @PostMapping("/confirmBooking")
    public String confirmBooking(@RequestParam String fullName,
                                 @RequestParam String email,
                                 @RequestParam String phone,
                                 @RequestParam String country,
                                 @RequestParam String place,
                                 @RequestParam String travelDate,
                                 @RequestParam String transport,
                                 Model model) {

        // Create a new Booking object
        Booking booking = new Booking();
        booking.setUserName(fullName);
        booking.setEmail(email);
        booking.setPhone(phone);
        booking.setCountry(country);
        booking.setPlaceName(place);
        booking.setTravelDate(travelDate);
        booking.setTransportType(transport);

        // Save the booking
        bookingRepository.save(booking);

        // Add booking details to the model to display on the confirmation page
        model.addAttribute("fullName", fullName);
        model.addAttribute("email", email);
        model.addAttribute("phone", phone);
        model.addAttribute("country", country);
        model.addAttribute("place", place);
        model.addAttribute("travelDate", travelDate);
        model.addAttribute("transport", transport);

        return "bookingConfirmation"; // Return the name of the JSP for confirmation
    }

    // This method returns the booking confirmation view
    @GetMapping("/bookingConfirmation")
    public String bookingConfirmation() {
        return "bookingConfirmation"; // This assumes bookingConfirmation.jsp exists in /WEB-INF/views
    }
}
