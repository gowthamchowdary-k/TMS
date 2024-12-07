//booknow.jsp


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Your Stay</title>
    <style>
        /* General styles */
        body {
            font-family: Arial, sans-serif;
            background: url('../images/hotel.jpg') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding: 0;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
        }
        header {
            text-align: center;
            margin-bottom: 20px;
        }
        header h1 {
            font-size: 2.5rem;
            margin-bottom: 10px;
        }
        .close-btn {
            position: absolute;
            top: 20px;
            right: 20px;
            font-size: 1.5rem;
            color: #ffeb3b;
            cursor: pointer;
            background: none;
            border: none;
            transition: color 0.3s;
        }
        .close-btn:hover {
            color: #000;
        }
        .booking-form {
            background-color: rgba(0, 0, 0, 0.6);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
            width: 90%;
            max-width: 550px;
            margin-top: 20px;
        }
        .form-label {
            font-size: 0.9rem;
            color: #ffeb3b;
        }
        .form-control {
            width: 100%;
            padding: 6px;
            border-radius: 8px;
            border: 2px solid #ffeb3b;
            margin-bottom: 12px;
            background-color: #fff;
            color: #333;
            font-size: 0.9rem;
            outline: none;
        }
        .cta-button {
            background-color: #ff5722;
            color: white;
            font-size: 1rem;
            padding: 12px;
            border-radius: 8px;
            text-align: center;
            display: inline-block;
            width: 100%;
            cursor: pointer;
        }
        .cta-button:hover {
            background-color: #e64a19;
        }
    </style>
</head>
<body>

<header>
    <button class="close-btn" onclick="window.location.href='/hotels';">X</button>
    <h1>Book Your Stay</h1>
</header>

<div class="booking-form">
   <form action="/api/hotelbooking/confirmBooking" method="post">
    <div class="mb-3">
        <label for="fullName" class="form-label">Full Name</label>
        <input type="text" class="form-control" id="fullName" name="fullName" required>
    </div>

    <div class="mb-3">
        <label for="email" class="form-label">Email</label>
        <input type="email" class="form-control" id="email" name="email" required>
    </div>

    <div class="mb-3">
        <label for="phone" class="form-label">Phone</label>
        <input type="text" class="form-control" id="phone" name="phone" required>
    </div>

    <div class="mb-3">
        <label for="checkIn" class="form-label">Check-in</label>
        <input type="date" class="form-control" id="checkIn" name="checkIn" required>
    </div>

    <div class="mb-3">
        <label for="checkOut" class="form-label">Check-out</label>
        <input type="date" class="form-control" id="checkOut" name="checkOut" required>
    </div>

    <div class="mb-3">
        <label for="rooms" class="form-label">Rooms</label>
        <input type="number" class="form-control" id="rooms" name="rooms" min="1" required>
    </div>

    <div class="mb-3">
        <label for="breakfast" class="form-label">Breakfast</label>
        <select class="form-control" id="breakfast" name="breakfast" required>
            <option value="yes">Yes</option>
            <option value="no">No</option>
        </select>
    </div>

    <div class="mb-3">
        <label for="roomType" class="form-label">Room Type</label>
        <select class="form-control" id="roomType" name="roomType" required>
            <option value="single">Single</option>
            <option value="double">Double</option>
            <option value="suite">Suite</option>
        </select>
    </div>

    <div class="mb-3">
        <label for="services" class="form-label">Services</label>
        <div>
            <input type="checkbox" id="wifi" name="services" value="wifi">
            <label for="wifi">Wi-Fi</label>
        </div>
        <div>
            <input type="checkbox" id="spa" name="services" value="spa">
            <label for="spa">Spa</label>
        </div>
        <div>
            <input type="checkbox" id="gym" name="services" value="gym">
            <label for="gym">Gym</label>
        </div>
    </div>

    <button type="submit" class="cta-button">Confirm Booking</button>
</form>
</div>

</body>
</html>