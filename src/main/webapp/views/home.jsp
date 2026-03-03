<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JFSD-PSI 1 - Travel Connect</title>
    
    <!-- Link to Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    
    <!-- Link to Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <link rel="stylesheet" href="styles.css"> <!-- Link to your CSS file -->

    <style>
        body {
            font-family: 'Roboto', Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('../images/pro1.webp'); /* Use a relevant image */
            background-size: cover; /* Cover the entire viewport */
            background-position: center; /* Center the image */
            height: 100vh; /* Full height */
            color: white; /* Change text color for better visibility */
            display: flex;
            flex-direction: column;
            justify-content: space-between; /* Spread header, content, and footer */
        }
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #424242;
            padding: 10px 20px;
            color: white;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
        }
        .logo img {
            height: 50px; /* Adjust the height as needed */
            width: 50px; /* Make the width equal to the height for a perfect circle */
            border-radius: 50%; /* This makes the image circular */
            object-fit: cover; /* Ensures the image fits inside the circle */
        }
        nav {
            display: flex;
            gap: 15px;
        }
        nav a {
            color: white;
            text-decoration: none;
            padding: 10px;
            transition: background-color 0.3s;
            display: flex;
            align-items: center;
            gap: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        }
        nav a:hover {
            background-color: rgba(255, 255, 255, 0.2);
            border-bottom: 2px solid white;
        }
        .heading {
            text-align: center;
            margin: 50px 0;
            font-size: 2.5em;
            background-color: rgba(0, 0, 0, 0.6);
            padding: 20px;
            border-radius: 10px;
            display: inline-block;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7);
            animation: fadeIn 2s ease-in-out;
        }
        footer {
            background-color: #424242;
            color: white;
            text-align: center;
            padding: 10px;
            font-size: 0.9em;
        }
        @media (max-width: 768px) {
            header {
                flex-direction: column;
                align-items: flex-start;
            }
            nav {
                flex-direction: column;
                gap: 10px;
            }
            .heading {
                font-size: 2em;
            }
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
    </style>
</head>

<body>

<header>
    <div class="logo">
        <img src="<c:url value='/images/logo.webp' />" alt="Logo">
    </div>
    <nav>
        <a href="/"><i class="fas fa-home"></i> Home</a>
        <a href="/aboutus"><i class="fas fa-info-circle"></i> About</a>
        <a href="/login"><i class="fas fa-sign-in-alt"></i> Login</a>
        <a href="/register"><i class="fas fa-user-plus"></i> Register</a>
    </nav>
</header>

<div class="heading">Welcome to Our Travel Website</div>

<footer>
    <p>&copy; 2026 Travel Connect | Designed by team GS²</p>
</footer>


</body>
</html>
