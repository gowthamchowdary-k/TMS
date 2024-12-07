<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Hotel Bookings</title>
    <style>
        /* Styling the table */
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #fff;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #2c3e50;
            color: white;
        }
        tr:hover {
            background-color: #f1f1f1;
        }

        /* Sidebar styling */
        .sidebar {
            width: 220px;
            background-color: #2c3e50;
            color: white;
            padding-top: 20px;
            position: fixed;
            height: 100%;
            top: 0;
            left: 0;
            box-shadow: 2px 0 8px rgba(0, 0, 0, 0.2);
        }
        .sidebar a {
            display: block;
            padding: 15px 20px;
            color: white;
            text-decoration: none;
            font-size: 18px;
            transition: background-color 0.3s ease;
        }
        .sidebar a:hover {
            background-color: #34495e;
        }
    </style>
</head>
<body>

<!-- Sidebar -->
<div class="sidebar">
    <h2 style="color: white; text-align: center;">Admin Panel</h2>
    <a href="${pageContext.request.contextPath}/adminDashboard">Dashboard</a>
    <a href="${pageContext.request.contextPath}/manageUsers">Manage Users</a>
    <a href="${pageContext.request.contextPath}/manageTourBookings">Manage Tour Bookings</a>
    <a href="${pageContext.request.contextPath}/manageHotelBookings">Manage Hotel Bookings</a>
    <a href="${pageContext.request.contextPath}/settings">Settings</a>
    <a href="${pageContext.request.contextPath}/logout">Logout</a>
</div>

<!-- Main Content -->
<div class="main-content" style="margin-left: 240px; padding: 30px;">
    <h1>Manage Hotel Bookings</h1>

    <!-- Display message or error -->
    <c:if test="${not empty message}">
        <div style="color: green; font-weight: bold;">${message}</div>
    </c:if>
    <c:if test="${not empty error}">
        <div style="color: red; font-weight: bold;">${error}</div>
    </c:if>

    <!-- Hotel Bookings Table -->
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Full Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Check-in</th>
                <th>Check-out</th>
                <th>Rooms</th>
                <th>Breakfast</th>
                <th>Room Type</th>
                <th>Services</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
    <c:forEach var="booking" items="${hotelBookings}">
        <tr>
            <td>${booking.id}</td>
            <td>${booking.fullName}</td>
            <td>${booking.email}</td>
            <td>${booking.phone}</td>
            <td>${booking.checkIn}</td>
            <td>${booking.checkOut}</td>
            <td>${booking.rooms}</td>
            <td>${booking.breakfast}</td>
            <td>${booking.roomType}</td>
            <td>${booking.services}</td>
            <td>
                <!-- Delete Booking -->
                <form action="${pageContext.request.contextPath}/deleteHotelBooking" method="POST" style="display:inline;">
                    <input type="hidden" name="bookingId" value="${booking.id}">
                    <button type="submit">Delete</button>
                </form>
                <!-- Update Booking -->
                <a href="${pageContext.request.contextPath}/editHotelBooking?bookingId=${booking.id}">
                    <button type="button">Update</button>
                </a>
            </td>
        </tr>
    </c:forEach>
</tbody>

    </table>
</div>

</body>
</html>
