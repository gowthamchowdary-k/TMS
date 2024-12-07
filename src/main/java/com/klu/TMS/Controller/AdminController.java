package com.klu.TMS.Controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.klu.TMS.model.User;
import com.klu.TMS.model.Booking;
import com.klu.TMS.model.hotelbooking; // Import the hotelbooking model
import com.klu.TMS.repository.AdminRepository;
import com.klu.TMS.repository.UserRepository;
import com.klu.TMS.repository.hotelbookingRepository;
import com.klu.TMS.repository.BookingRepository; 

@Controller
public class AdminController {

    @Autowired
    private AdminRepository adminRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private BookingRepository bookingRepository;

    @Autowired
    private hotelbookingRepository hotelBookingRepository; // Inject HotelBookingRepository

    // Handle GET request to display the login form
    @GetMapping("/adminLogin")
    public String showAdminLoginPage() {
        return "AdminLogin"; // Return the AdminLogin.jsp view
    }

    // Handle POST request for admin login validation
    @PostMapping("/adminLogin")
    public String adminLogin(@RequestParam String username, @RequestParam String password, RedirectAttributes redirectAttributes) {
        // Hardcoded credentials for the admin
        if ("Tarunasri".equals(username) && "TS@123".equals(password)) {
            return "redirect:/adminDashboard"; // Redirect to admin dashboard on successful login
        } else {
            redirectAttributes.addFlashAttribute("error", "Invalid username or password.");
            return "redirect:/adminLogin"; // Redirect to login page with an error message
        }
    }

    // Display the admin dashboard
    @GetMapping("/adminDashboard")
    public String showAdminDashboard(Model model) {
        long totalUsers = userRepository.count(); // Get total number of users
        long totalBookings = bookingRepository.count(); // Get total number of tour bookings
        long totalHotelBookings = hotelBookingRepository.count(); // Get total number of hotel bookings

        // Add statistics to the model
        model.addAttribute("totalUsers", totalUsers);
        model.addAttribute("totalBookings", totalBookings);
        model.addAttribute("totalHotelBookings", totalHotelBookings);

        return "AdminDashboard"; // Return the AdminDashboard.jsp view
    }

    // Display users in the admin panel
    @GetMapping("/manageUsers")
    public String manageUsers(Model model) {
        List<User> users = userRepository.findAll(); // Fetch all users
        model.addAttribute("users", users); // Add users list to the model
        return "manageUsers"; // Return the manageUsers.jsp view
    }

    // Delete user
    @PostMapping("/deleteUser")
    public String deleteUser(@RequestParam("userId") Long userId, RedirectAttributes redirectAttributes) {
        User user = userRepository.findById(userId).orElse(null);
        if (user != null) {
            userRepository.delete(user);
            redirectAttributes.addFlashAttribute("message", "User deleted successfully!");
        } else {
            redirectAttributes.addFlashAttribute("error", "User not found!");
        }
        return "redirect:/manageUsers";
    }

    // Display tour bookings in the admin panel
    @GetMapping("/manageTourBookings")
    public String manageTourBookings(Model model) {
        List<Booking> bookings = bookingRepository.findAll(); // Fetch all bookings
        model.addAttribute("bookings", bookings); // Add bookings list to the model
        return "manageTourBookings"; // Return the manageTourBookings.jsp view
    }

    // Delete tour booking
    @PostMapping("/deleteBooking")
    public String deleteBooking(@RequestParam("bookingId") Long bookingId, RedirectAttributes redirectAttributes) {
        Booking booking = bookingRepository.findById(bookingId).orElse(null);
        if (booking != null) {
            bookingRepository.delete(booking);
            redirectAttributes.addFlashAttribute("message", "Booking deleted successfully!");
        } else {
            redirectAttributes.addFlashAttribute("error", "Booking not found!");
        }
        return "redirect:/manageTourBookings";
    }

    // Display hotel bookings in the admin panel
    @GetMapping("/manageHotelBookings")
    public String manageHotelBookings(Model model) {
        List<hotelbooking> hotelBookings = hotelBookingRepository.findAll(); // Fetch all hotel bookings
        model.addAttribute("hotelBookings", hotelBookings); // Add hotel bookings to the model
        return "manageHotelBookings"; // Return the manageHotelBookings.jsp view
    }

    // Delete hotel booking
    @PostMapping("/deleteHotelBooking")
    public String deleteHotelBooking(@RequestParam("bookingId") Long bookingId, RedirectAttributes redirectAttributes) {
        hotelbooking booking = hotelBookingRepository.findById(bookingId).orElse(null);
        if (booking != null) {
            hotelBookingRepository.delete(booking);
            redirectAttributes.addFlashAttribute("message", "Hotel booking deleted successfully!");
        } else {
            redirectAttributes.addFlashAttribute("error", "Hotel booking not found!");
        }
        return "redirect:/manageHotelBookings";
    }

    @GetMapping("/editUser")
    public String editUser(@RequestParam("userId") Long userId, Model model, RedirectAttributes redirectAttributes) {
        User user = userRepository.findById(userId).orElse(null);
        if (user != null) {
            model.addAttribute("user", user);
            return "editUser";
        } else {
            redirectAttributes.addFlashAttribute("error", "User not found!");
            return "redirect:/manageUsers";
        }
    }

    // Update user details
    @PostMapping("/updateUser")
    public String updateUser(@RequestParam("userId") Long userId,
                             @RequestParam("username") String username,
                             @RequestParam("email") String email,
                             @RequestParam("fullName") String fullName,
                             @RequestParam("phoneNumber") String phoneNumber,
                             RedirectAttributes redirectAttributes) {
        User user = userRepository.findById(userId).orElse(null);
        if (user != null) {
            user.setUsername(username);
            user.setEmail(email);
            user.setFullName(fullName);
            user.setPhoneNumber(phoneNumber);
            userRepository.save(user);
            redirectAttributes.addFlashAttribute("message", "User updated successfully!");
        } else {
            redirectAttributes.addFlashAttribute("error", "User not found!");
        }
        return "redirect:/manageUsers";
    }

    // Display form to edit tour booking
    @GetMapping("/editTourBooking")
    public String editTourBooking(@RequestParam("bookingId") Long bookingId, Model model) {
        Booking booking = bookingRepository.findById(bookingId).orElse(null);
        model.addAttribute("booking", booking);
        return "editTourBooking";
    }

    // Update tour booking
    @PostMapping("/updateTourBooking")
    public String updateTourBooking(@RequestParam("bookingId") Long bookingId,
                                     @RequestParam("placeName") String placeName,
                                     @RequestParam("userName") String userName,
                                     @RequestParam("email") String email,
                                     @RequestParam("phone") String phone,
                                     @RequestParam("bookingDate") String bookingDate,
                                     RedirectAttributes redirectAttributes) {
        Booking booking = bookingRepository.findById(bookingId).orElse(null);
        if (booking != null) {
            booking.setPlaceName(placeName);
            booking.setUserName(userName);
            booking.setEmail(email);
            booking.setPhone(phone);

            // Convert String to LocalDate (handling only date part)
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate localDate = LocalDate.parse(bookingDate, formatter);  // Parse only the date part
            LocalDateTime dateTime = localDate.atStartOfDay();  // Convert LocalDate to LocalDateTime at the start of the day
            booking.setBookingDate(dateTime);

            bookingRepository.save(booking);
            redirectAttributes.addFlashAttribute("message", "Tour Booking updated successfully!");
        } else {
            redirectAttributes.addFlashAttribute("error", "Booking not found!");
        }
        return "redirect:/manageTourBookings";
    }

    // Display form to edit hotel booking
    @GetMapping("/editHotelBooking")
    public String editHotelBooking(@RequestParam("bookingId") Long bookingId, Model model) {
        hotelbooking booking = hotelBookingRepository.findById(bookingId).orElse(null);
        model.addAttribute("booking", booking);
        return "editHotelBooking";
    }

    // Update hotel booking
    @PostMapping("/updateHotelBooking")
    public String updateHotelBooking(@RequestParam("bookingId") Long bookingId,
                                      @RequestParam("fullName") String fullName,
                                      @RequestParam("email") String email,
                                      @RequestParam("phone") String phone,
                                      @RequestParam("checkIn") String checkIn,
                                      @RequestParam("checkOut") String checkOut,
                                      @RequestParam("rooms") int rooms,
                                      @RequestParam("breakfast") String breakfast,
                                      @RequestParam("roomType") String roomType,
                                      @RequestParam("services") String services,
                                      RedirectAttributes redirectAttributes) {
        hotelbooking booking = hotelBookingRepository.findById(bookingId).orElse(null);
        if (booking != null) {
            booking.setFullName(fullName);
            booking.setEmail(email);
            booking.setPhone(phone);
            booking.setCheckIn(checkIn);
            booking.setCheckOut(checkOut);
            booking.setRooms(rooms);
            booking.setBreakfast(breakfast);
            booking.setRoomType(roomType);
            booking.setServices(services);
            hotelBookingRepository.save(booking);
            redirectAttributes.addFlashAttribute("message", "Hotel Booking updated successfully!");
        } else {
            redirectAttributes.addFlashAttribute("error", "Hotel Booking not found!");
        }
        return "redirect:/manageHotelBookings";
    }

    // Redirect to settings page
    @GetMapping("/settings")
    public String settings() {
        return "settings"; // Return the settings.jsp view
    }
    
    @RequestMapping("/superAdminDashboard")
    public String superAdminDashboard(Model model) {
        // Add logic if needed
        return "superAdminDashboard";  // This should map to /WEB-INF/jsp/superAdminDashboard.jsp
    }

    // Handle logout
    @GetMapping("/logout")
    public String logout() {
        return "redirect:/adminLogin"; // Redirect to the login page after logout
    }
}
