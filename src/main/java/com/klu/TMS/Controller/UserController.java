package com.klu.TMS.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klu.TMS.model.User;
import com.klu.TMS.repository.UserRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
    @Autowired
    private UserRepository userRepository;

    @GetMapping("/")
    public ModelAndView showWelcomePage() {
        return new ModelAndView("home");
    }

    @GetMapping("/register")
    public String showSignupForm(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }
    
    @GetMapping("/thankyou")
    public String thankyou() {
    	return "thankyou";
    }

    @PostMapping("/register")
    public String processSignup(User user) {
        userRepository.save(user);
        return "redirect:/login?signupSuccess=true";
    }

    @GetMapping("/login")
    public String showLoginForm(@RequestParam(value = "signupSuccess", required = false) String signupSuccess, Model model) {
        if (signupSuccess != null) {
            model.addAttribute("message", "Signup successful! Please log in.");
        }
        return "login";
    }

    @PostMapping("/login")
    public String processLogin(User user, Model model, HttpSession session) {
        User foundUser = userRepository.findByUsername(user.getUsername());
        if (foundUser != null && foundUser.getPassword().equals(user.getPassword())) {
            // Store the username in the session
            session.setAttribute("username", foundUser.getUsername());
            return "redirect:/home2"; // Redirect after successful login
        }
        model.addAttribute("error", "Invalid username or password");
        return "login"; // Redirect back to login page if login fails
    }

    
    @GetMapping("/forgotPassword")
    public String showForgotPasswordPage() {
        return "forgotPassword";
    }

    @PostMapping("/resetPassword")
    public String resetPassword(@RequestParam("username") String username,
                                 @RequestParam("newPassword") String newPassword,
                                 @RequestParam("confirmPassword") String confirmPassword,
                                 Model model) {
        // Check if passwords match
        if (!newPassword.equals(confirmPassword)) {
            model.addAttribute("error", "New password and confirm password do not match!");
            return "forgotPassword";
        }

        // Check if the user exists
        User foundUser = userRepository.findByUsername(username);
        if (foundUser == null) {
            model.addAttribute("error", "No user found with the provided username!");
            return "forgotPassword";
        }

        // Update the user's password
        foundUser.setPassword(newPassword); // Ideally, hash the password here
        userRepository.save(foundUser);
        model.addAttribute("message", "Password reset successfully. Please log in.");
        return "redirect:/login";
    }
    
    @GetMapping("/home2")
    public String showHomePage() {
        return "home2"; 
    }
    
    @GetMapping("/hotels")
    public String showHotelsPage() {
        return "hotels"; 
    }
    
    @RequestMapping("/booknow")
    public String showBookingForm() {
        return "booknow"; // This will forward to /WEB-INF/views/booknow.jsp
    }
    
    
    @GetMapping("/homestays")
    public String showHomeStays() {
        return "homestays"; 
    }
    
    @GetMapping("/guides")
    public String showLocalGuides() {
        return "localGuides"; 
    }
    
    @GetMapping("/booking")
    public String showBookings() {
        return "booking"; 
    }
    
    @GetMapping("/aboutus")
    public String showaboutus() {
        return "aboutus"; 
    }
    
    @GetMapping("/countries")
    public String showhome2Countries() {
        return "countries";
    }
    
	
}