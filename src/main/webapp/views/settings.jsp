<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Settings</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        .settings-container {
            width: 60%;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        .header {
            text-align: center;
            margin-bottom: 30px;
        }

        .setting-card {
            background-color: #fafafa;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
        }

        .setting-card h3 {
            margin-bottom: 10px;
        }

        .setting-card p {
            font-size: 16px;
        }

        .toggle-switch {
            position: relative;
            display: inline-block;
            width: 60px;
            height: 34px;
        }

        .toggle-switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }

        .toggle-switch .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            transition: 0.4s;
            border-radius: 34px;
        }

        .toggle-switch .slider:before {
            position: absolute;
            content: "";
            height: 26px;
            width: 26px;
            border-radius: 50%;
            left: 4px;
            bottom: 4px;
            background-color: white;
            transition: 0.4s;
        }

        .toggle-switch input:checked + .slider {
            background-color: #2c3e50;
        }

        .toggle-switch input:checked + .slider:before {
            transform: translateX(26px);
        }

        /* Sidebar */
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

        /* Content area */
        .main-content {
            margin-left: 240px;
            padding: 30px;
        }

        .role-section {
            display: none;
        }

        .admin-section {
            display: block;
        }

        .superadmin-section {
            display: none;
        }

        /* Modal */
        #confirmationModal {
            display: none;
        }

        .modal-overlay {
            background: rgba(0, 0, 0, 0.5);
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 1000;
        }

        .modal-content {
            width: 300px;
            margin: 100px auto;
            background: white;
            padding: 20px;
            border-radius: 5px;
            text-align: center;
        }

        /* Dark Mode Styles */
        body.dark-mode {
            background-color: #2c3e50;
            color: #ecf0f1;
        }

        body.dark-mode .settings-container {
            background-color: #34495e;
        }

        body.dark-mode .setting-card {
            background-color: #2c3e50;
            border-color: #7f8c8d;
        }

        body.dark-mode .toggle-switch .slider {
            background-color: #7f8c8d;
        }

        body.dark-mode .toggle-switch input:checked + .slider {
            background-color: #2ecc71;
        }

        body.dark-mode .modal-content {
            background-color: #34495e;
            color: #ecf0f1;
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
        <a href="${pageContext.request.contextPath}/settings">Admin Settings</a>
        <a href="${pageContext.request.contextPath}/logout">Logout</a>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="settings-container">
            <div class="header">
                <h2>Admin Settings</h2>
            </div>

            <!-- Role Selection Dropdown -->
            <div class="setting-card">
                <h3>Select Role</h3>
                <select id="roleSelect">
                    <option value="admin">Admin</option>
                    <option value="superAdmin">Super Admin</option>
                </select>
            </div>

            <!-- Admin Section (visible by default) -->
            <div id="adminSection" class="setting-card admin-section">
                <h3>Account Information (Admin)</h3>
                <p>Username: Tarunasri</p>
                <p>Email: taruna@gmail.com</p>
                <p>Phone: 987-654-3210</p>
            </div>

            <!-- Super Admin Section (hidden by default) -->
            <div id="superAdminSection" class="setting-card superadmin-section">
                <h3>Super Admin Settings</h3>
                <p>As a Super Admin, you have higher privileges.</p>
                <button class="button" onclick="showConfirmation()">Go to Super Admin Dashboard</button>
            </div>

            <!-- Common Dark Mode Toggle -->
            <div class="setting-card">
                <h3>Enable/Disable Features</h3>
                <p>Enable dark mode:</p>
                <label class="toggle-switch">
                    <input type="checkbox" id="darkModeToggle">
                    <span class="slider"></span>
                </label>
            </div>
        </div>
    </div>

    <!-- Confirmation Modal -->
    <div id="confirmationModal" class="modal-overlay">
        <div class="modal-content">
            <h3>Are you sure you want to go to the Super Admin Dashboard?</h3>
            <button onclick="confirmAction()">Yes</button>
            <button onclick="closeModal()">No</button>
        </div>
    </div>

    <script>
        // Function to handle role selection change
        document.getElementById('roleSelect').addEventListener('change', function() {
            var selectedRole = this.value;

            // Hide all role-specific sections
            document.getElementById('adminSection').style.display = 'none';
            document.getElementById('superAdminSection').style.display = 'none';

            // Show section based on the selected role
            if (selectedRole === 'admin') {
                document.getElementById('adminSection').style.display = 'block';
            } else if (selectedRole === 'superAdmin') {
                document.getElementById('superAdminSection').style.display = 'block';
            }
        });

        // Dark Mode Toggle
        if (localStorage.getItem('darkMode') === 'enabled') {
            document.body.classList.add('dark-mode');
            document.querySelectorAll('.setting-card').forEach(card => {
                card.classList.add('dark-mode');
            });
            document.querySelector('.settings-container').classList.add('dark-mode');
            document.getElementById('darkModeToggle').checked = true;
        }

        document.getElementById('darkModeToggle').addEventListener('change', function() {
            if (this.checked) {
                // Enable dark mode
                document.body.classList.add('dark-mode');
                document.querySelectorAll('.setting-card').forEach(card => {
                    card.classList.add('dark-mode');
                });
                document.querySelector('.settings-container').classList.add('dark-mode');
                localStorage.setItem('darkMode', 'enabled');
            } else {
                // Disable dark mode
                document.body.classList.remove('dark-mode');
                document.querySelectorAll('.setting-card').forEach(card => {
                    card.classList.remove('dark-mode');
                });
                document.querySelector('.settings-container').classList.remove('dark-mode');
                localStorage.setItem('darkMode', 'disabled');
            }
        });

        // Function to show the confirmation modal
        function showConfirmation() {
            document.getElementById('confirmationModal').style.display = 'block';
        }

        // Function to close the confirmation modal
        function closeModal() {
            document.getElementById('confirmationModal').style.display = 'none';
        }

        // Function to confirm the action and redirect
        function confirmAction() {
            // Close the modal
            closeModal();

            // Redirect to the Super Admin Dashboard
            window.location.href = '/superAdminDashboard'; // Change this to your actual URL
        }
    </script>

</body>
</html>