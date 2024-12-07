<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard</title>
<style>
/* Reset and basic styles */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: #f4f4f9;
	display: flex;
	min-height: 100vh;
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

/* Dashboard Content */
.dashboard-content {
	margin-left: 240px;
	padding: 30px;
	width: 100%;
}

.dashboard-content h1 {
	color: #007BFF;
	font-size: 36px;
	margin-bottom: 20px;
}

.stat-boxes {
	display: flex;
	justify-content: space-between;
	margin-top: 40px;
}

.stat-box {
	width: 23%;
	padding: 30px;
	background-color: #007BFF;
	color: white;
	text-align: center;
	border-radius: 10px;
	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
}

.stat-box h2 {
	font-size: 28px;
	font-weight: bold;
}

.stat-box p {
	font-size: 18px;
	margin-top: 10px;
}

.stat-box:hover {
	background-color: #0056b3;
	cursor: pointer;
}

/* Button styles */
.btn {
	display: inline-block;
	padding: 12px 24px;
	background-color: #ff4081;
	color: white;
	text-decoration: none;
	font-weight: bold;
	text-align: center;
	border-radius: 10px;
	margin-top: 30px;
	transition: background-color 0.3s ease;
}

.btn:hover {
	background-color: #d81b60;
}

/* Footer Styles */
.footer {
	text-align: center;
	margin-top: 370px;
	font-size: 14px;
	color: #888;
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

	<!-- Dashboard Content -->
	<div class="dashboard-content">
		<h1>Welcome to the Admin Dashboard</h1>
		<p>You have successfully logged in as an Admin.</p>

		<!-- Display some statistics -->
		<div class="stat-boxes">
			<div class="stat-box">
				<h2>${totalUsers}</h2>
				<p>Total Users</p>
			</div>
			<div class="stat-box">
				<h2>${totalBookings}</h2>
				<p>Total Tour Bookings</p>
			</div>
			<div class="stat-box">
				<h2>${totalHotelBookings}</h2>
				<!-- Updated to display Total Hotel Bookings -->
				<p>Total Hotel Bookings</p>
				<!-- Updated label -->
			</div>
		</div>


		<!-- Footer -->
		<div class="footer">
			<p>
				Admin Dashboard | <a
					href="${pageContext.request.contextPath}/adminLogin">Return to
					Admin Login</a>
			</p>
		</div>
	</div>
</body>
</html>
