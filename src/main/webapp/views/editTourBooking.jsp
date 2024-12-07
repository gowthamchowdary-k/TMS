<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Tour Booking</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            background: white;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #343a40;
        }
        form label {
            display: block;
            margin: 10px 0 5px;
            font-weight: bold;
        }
        form input, form button {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        form button {
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
        }
        form button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Edit Tour Booking</h1>
    <form action="${pageContext.request.contextPath}/updateTourBooking" method="POST">
        <input type="hidden" name="bookingId" value="${booking.id}">
        <label for="placeName">Place Name:</label>
        <input type="text" name="placeName" id="placeName" value="${booking.placeName}" required>

        <label for="userName">User Name:</label>
        <input type="text" name="userName" id="userName" value="${booking.userName}" required>

        <label for="email">Email:</label>
        <input type="email" name="email" id="email" value="${booking.email}" required>

        <label for="phone">Phone:</label>
        <input type="text" name="phone" id="phone" value="${booking.phone}" required>

        <label for="bookingDate">Booking Date:</label>
        <input type="date" name="bookingDate" id="bookingDate" value="${booking.bookingDate}" required>

        <button type="submit">Update</button>
    </form>
</div>
</body>
</html>
