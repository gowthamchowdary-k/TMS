<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Explore</title>
    <link rel="stylesheet" href="styles.css"> 
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        header {
            display: flex;
            justify-content: center; /* Center the heading text */
            align-items: center;
            background-color: #26a69a ;
            padding: 20px;
            color: white;
            position: relative; /* Needed for positioning the button */
        }
        .logo img {
            height: 50px;
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
        }
        nav a:hover {
            background-color: #575757;
            border-radius: 5px;
        }
        .heading {
            font-size: 2.5em;
        }
        .back-button {
            position: absolute;
            top: 50%;
            right: 10px;
            transform: translateY(-50%);
            background-color: transparent;
            border: none;
            font-size: 18px;
            color: white;
            cursor: pointer;
            padding: 8px 12px;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .back-button:hover {
            background-color: #575757;
        }
        .country-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            padding: 20px;
        }
        .country-card {
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 90px;
            overflow: hidden;
            text-align: center;
            padding: 50px;
            transition: transform 0.3s;
        }
        .country-card:hover {
            transform: scale(1.05);
        }
        .country-card img {
            width: 100%;
            height: 150px;
            object-fit: cover;
            border-bottom: 2px solid #ddd;
        }
        .country-card h3 {
            margin: 15px 0;
            font-size: 1.2em;
        }
        .country-card p {
            color: #555;
            font-size: 0.9em;
        }
    </style>
</head>
<body>

<header>
    <div class="heading">Explore the World</div>
    <a href="/home2" class="back-button">Back</a> <!-- Redirect to home2 -->
</header>

<div class="country-grid">
    <c:forEach var="country" items="${countries}">
        <a href="<c:url value='/explore/country?country=${country.name}' />">
            <div class="country-card">
                <img src="<c:url value='/images/${country.image}' />" alt="${country.name} Image">
                <h3>${country.name}</h3>
                <p>Explore the beautiful places in ${country.name}</p>
            </div>
        </a>
    </c:forEach>
</div>

</body>
</html>
