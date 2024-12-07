package com.klu.TMS.Controller;

import com.klu.TMS.model.hotelbooking;  // Import hotelbooking entity
import com.klu.TMS.repository.hotelbookingRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/api/hotelbooking")
public class hotelbookingController {

    @Autowired
    private hotelbookingRepository hotelBookingRepository;

    @PostMapping("/confirmBooking")
    public String confirmBooking(@RequestParam String fullName,
                                 @RequestParam String email,
                                 @RequestParam String phone,
                                 @RequestParam String checkIn,
                                 @RequestParam String checkOut,
                                 @RequestParam int rooms,
                                 @RequestParam String breakfast,
                                 @RequestParam String roomType,
                                 @RequestParam(required = false) String services,
                                 Model model) {
        // Create and populate a new hotelbooking object
        hotelbooking hbooking = new hotelbooking();
        hbooking.setFullName(fullName);
        hbooking.setEmail(email);
        hbooking.setPhone(phone);
        hbooking.setCheckIn(checkIn);
        hbooking.setCheckOut(checkOut);
        hbooking.setRooms(rooms);
        hbooking.setBreakfast(breakfast);
        hbooking.setRoomType(roomType);
        hbooking.setServices(services != null ? services : "None");

        // Save the booking to the database
        hotelBookingRepository.save(hbooking);

        // Add booking details to the model to display on the confirmation page
        model.addAttribute("fullName", fullName);
        model.addAttribute("email", email);
        model.addAttribute("phone", phone);
        model.addAttribute("checkIn", checkIn);
        model.addAttribute("checkOut", checkOut);
        model.addAttribute("rooms", rooms);
        model.addAttribute("breakfast", breakfast);
        model.addAttribute("roomType", roomType);
        model.addAttribute("services", services != null ? services : "None");

        return "bookingConfirmation"; // Redirect to booking confirmation JSP
    }

    @GetMapping("/bookingConfirmation")
    public String bookingConfirmation() {
        return "bookingConfirmation";
    }
}
