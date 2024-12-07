<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Your Homestay & Tourism Guide</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 0;
            padding: 0;
            position: relative;
        }

        .container {
            width: 70%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 40px;
        }

        header {
            background-color: #b39ddb;
            padding: 7px;
            color: white;
            text-align: center;
            border-radius: 8px;
        }

        header h1 {
            font-size: 3em;
            text-transform: uppercase;
        }

        .content {
            margin-top: 40px;
        }

        .section-title {
            font-size: 2em;
            color: #9575cd;
            margin-bottom: 20px;
        }

        .section-content {
            font-size: 1.1em;
            line-height: 1.6;
            color: #666;
            margin-bottom: 30px;
        }

        .roles {
            display: flex;
            justify-content: space-around;
            margin-top: 40px;
        }

        .role-card {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 30px;
            width: 220px;
            text-align: center;
            transition: transform 0.3s ease;
        }

        .role-card h3 {
            font-size: 1.8em;
            color: #b388ff;
            margin-bottom: 20px;
        }

        .role-card p {
            font-size: 1em;
            color: #777;
            margin-bottom: 20px;
        }

        .role-card:hover {
            transform: translateY(-10px);
        }

        /* Close Button Style - Circular */
		.close-btn {
		    position: absolute;
		    top: 20px;
		    right: 20px;
		    font-size: 1em;
		    color: white;
		    background-color: #b39ddb;
		    border: none;
		    border-radius: 50%; /* Makes the button circular */
		    width: 40px; /* Equal width and height for circle */
		    height: 40px;
		    display: flex;
		    align-items: center; /* Centers text vertically */
		    justify-content: center; /* Centers text horizontally */
		    text-decoration: none; /* Removes underline */
		    font-weight: bold;
		    cursor: pointer;
		    transition: background-color 0.3s ease, transform 0.3s ease; /* Smooth transitions */
		}
		
		.close-btn:hover {
		    background-color: #9575cd; /* Darker shade on hover */
		    transform: scale(1.1); /* Slight zoom effect */
		}


    </style>
</head>
<body>

<!-- Close Button (X) -->
<a href="/" class="close-btn">X</a>

<div class="container">
    <header>
        <h1>About Us</h1>
    </header>

    <div class="content">
        <h2 class="section-title">Our Vision</h2>
        <p class="section-content">
            Our platform is designed to connect travelers with homestay options and provide detailed information about nearby tourist attractions.
            We aim to enhance the travel experience by offering personalized recommendations and insights from locals. Whether you're seeking a cozy stay with a local family or looking to explore hidden gems around the area, we are here to make your travel journey unforgettable.
        </p>

        <h2 class="section-title">Our Mission</h2>
        <p class="section-content">
            Our mission is to create a seamless experience for tourists, hosts, and local guides. We believe that travel is more than just visiting popular destinations; it's about connecting with local culture, traditions, and people.
            We strive to offer not only a place to stay but an opportunity to immerse yourself in the local community, discover new places, and create memories that last a lifetime.
        </p>

        <h2 class="section-title">Meet Our Roles</h2>
        <div class="roles">
            <div class="role-card">
                <h3>Admin</h3>
                <p>The admin ensures the smooth functioning of the platform, managing user interactions, content, and homestay listings. They make sure everything is up to date and the platform runs efficiently for all users.</p>
            </div>

            <div class="role-card">
                <h3>Homestay Host</h3>
                <p>Homestay hosts can list their properties on the platform, manage bookings, and interact directly with guests to provide the best possible experience. Hosts play a crucial role in making travelers feel at home.</p>
            </div>

            <div class="role-card">
                <h3>Tourist</h3>
                <p>Tourists can search for homestays, book accommodations, and explore local attractions with the help of our platform. With personalized recommendations, we make it easier for tourists to experience new places authentically.</p>
            </div>

            <div class="role-card">
                <h3>Local Guide</h3>
                <p>Local guides provide valuable insights and recommendations on nearby tourism places. They help tourists discover off-the-beaten-path destinations and give an authentic perspective of the local culture and history.</p>
            </div>
        </div>
    </div>

</div>

</body>
</html>

