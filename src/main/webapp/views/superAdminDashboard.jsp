<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Super Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

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

        .main-content {
            margin-left: 240px;
            padding: 30px;
        }

        .dashboard-container {
            width: 80%;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        .header {
            text-align: center;
        }

        .action-card {
            margin-top: 20px;
            background-color: #fafafa;
            padding: 20px;
            border-radius: 8px;
        }

        .action-card h3 {
            margin-bottom: 15px;
        }

        .button {
            padding: 10px 20px;
            background-color: #2c3e50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
        }

        .button:hover {
            background-color: #34495e;
        }
    </style>
</head>

<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <h2 style="color: white; text-align: center;">Super Admin Panel</h2>
        <a href="${pageContext.request.contextPath}/adminDashboard">Dashboard</a>
        <a href="${pageContext.request.contextPath}/manageUsers">Manage Users</a>
        <a href="${pageContext.request.contextPath}/manageAdmins">Manage Admins</a>
        <a href="${pageContext.request.contextPath}/systemSettings">System Settings</a>
        <a href="${pageContext.request.contextPath}/logout">Logout</a>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="dashboard-container">
            <div class="header">
                <h2>Welcome to the Super Admin Dashboard</h2>
            </div>

            <!-- Super Admin Actions -->
            <div class="action-card">
                <h3>Super Admin Actions</h3>
                <p>As a Super Admin, you can manage various functions related to users, admins, and system settings.</p>
            </div>

            <!-- Add Admin -->
            <div class="action-card">
                <h3>Add New Admin</h3>
                <p>Use this option to add new admin users to the system.</p>
                <button class="button" onclick="window.location.href='${pageContext.request.contextPath}/addAdmin'">Add New Admin</button>
            </div>

            <!-- Manage Users -->
            <div class="action-card">
                <h3>Manage Users</h3>
                <p>View and manage users, including assigning roles and permissions.</p>
                <button class="button" onclick="window.location.href='${pageContext.request.contextPath}/manageUsers'">Manage Users</button>
            </div>

            <!-- System Settings -->
            <div class="action-card">
                <h3>System Settings</h3>
                <p>Configure the global settings of the system, such as system preferences and configurations.</p>
                <button class="button" onclick="window.location.href='${pageContext.request.contextPath}/systemSettings'">System Settings</button>
            </div>

            <!-- Special Super Admin Actions -->
            <div class="action-card">
                <h3>Special Super Admin Actions</h3>
                <p>As a Super Admin, you have access to additional management functionalities.</p>
                <ul>
                    <li>Manage permissions for admins and users.</li>
                    <li>Access and configure system-wide features.</li>
                    <li>Perform security audits and view system logs.</li>
                </ul>
                <button class="button" onclick="window.location.href='${pageContext.request.contextPath}/performSecurityAudit'">Perform Security Audit</button>
                <button class="button" onclick="window.location.href='${pageContext.request.contextPath}/viewSystemLogs'">View System Logs</button>
            </div>

        </div>
    </div>

</body>

</html>
