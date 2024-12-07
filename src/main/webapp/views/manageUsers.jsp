<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users</title>
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
    <h1>Manage Users</h1>

    <!-- Display message or error -->
    <c:if test="${not empty message}">
        <div style="color: green; font-weight: bold;">${message}</div>
    </c:if>
    <c:if test="${not empty error}">
        <div style="color: red; font-weight: bold;">${error}</div>
    </c:if>

    <!-- Users Table -->
    <table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Username</th>
            <th>Email</th>
            <th>Full Name</th>
            <th>Phone Number</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="user" items="${users}">
            <tr>
                <td>${user.id}</td>
                <td>${user.username}</td>
                <td>${user.email}</td>
                <td>${user.fullName}</td>
                <td>${user.phoneNumber}</td>
                <td>
                    <!-- Delete User -->
                    <form action="${pageContext.request.contextPath}/deleteUser" method="POST" style="display:inline;">
                        <input type="hidden" name="userId" value="${user.id}">
                        <button type="submit">Delete</button>
                    </form>
                    <!-- Update User -->
                    <a href="${pageContext.request.contextPath}/editUser?userId=${user.id}">
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
