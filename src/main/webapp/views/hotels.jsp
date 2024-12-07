<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotels in India</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            color: #333;
        }

        header {
            background-color: #039be5;
            color: white;
            padding: 3px 0;
            text-align: center;
            position: relative;
        }

        header h1 {
            font-size: 36px;
            margin: 0;
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

        .close-btn:hover {
            color: #ff4d4d;
        }

        .hotel-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
            padding: 20px;
        }

        .hotel-card {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: transform 0.3s ease-in-out;
        }

        .hotel-card:hover {
            transform: translateY(-10px);
        }

        .hotel-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-bottom: 2px solid #f1f1f1;
        }

        .hotel-card-body {
            padding: 20px;
        }

        .hotel-card h3 {
            font-size: 24px;
            color: #039be5;
            margin: 10px 0;
        }

        .hotel-card p {
            font-size: 16px;
            color: #666;
            margin: 10px 0;
        }

        .hotel-card .price {
            font-size: 18px;
            color: #28a745;
            font-weight: bold;
        }

        .hotel-card .location {
            font-size: 14px;
            color: #888;
        }

        .cta-button {
            display: block;
            text-align: center;
            background-color: #039be5;
            color: white;
            padding: 10px;
            margin: 15px 0;
            border: none;
            border-radius: 4px;
            text-decoration: none;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        .cta-button:hover {
            background-color: #0288d1;
        }
    </style>
</head>
<body>

<header>
    <h1>Top Hotels</h1>
    <p>Explore the best hotels for your next stay in India</p>
    <!-- Close Button -->
    <a href="/home2" class="back-button">Back</a>
</header>

<div class="hotel-container">
  
<div class="hotel-card">
    <img src="images/tajh.jpg" alt="Hotel Image">
    <div class="hotel-card-body">
        <h3>Taj Mahal Palace, Mumbai</h3>
        <p>A stunning luxury hotel in the heart of Mumbai, offering world-class services and breathtaking views.</p>
        <span class="price">₹12,500 / night</span>
        <p class="location">Location: Mumbai, Maharashtra</p>
        <a href="/booknow" class="cta-button">Book Now</a>
    </div>
</div>


    <!-- Hotel 2 -->
    <div class="hotel-card">
        <img src="images/leelah.jpg" alt="Hotel Image">
        <div class="hotel-card-body">
            <h3>Leela Palace, New Delhi</h3>
            <p>Experience royalty with elegant rooms and top-notch amenities at this luxury hotel in Delhi.</p>
            <span class="price">₹15,000 / night</span>
            <p class="location">Location: New Delhi</p>
            <a href="/booknow" class="cta-button">Book Now</a>
        </div>
    </div>

    <!-- Hotel 3 -->
    <div class="hotel-card">
         <img src="images/obeh.jpg" alt="Hotel Image">
        <div class="hotel-card-body">
            <h3>Oberoi Udaivilas, Udaipur</h3>
            <p>A lakeside haven in Udaipur offering luxurious villas and royal-style hospitality.</p>
            <span class="price">₹18,000 / night</span>
            <p class="location">Location: Udaipur, Rajasthan</p>
            <a href="/booknow" class="cta-button">Book Now</a>
        </div>
    </div>

    <!-- Hotel 4 -->
    <div class="hotel-card">
         <img src="images/obh.jpg" alt="Hotel Image">
        <div class="hotel-card-body">
            <h3>The Oberoi, Bengaluru</h3>
            <p>Enjoy a tranquil stay in the garden city at The Oberoi, offering an amazing fusion of nature and luxury.</p>
            <span class="price">₹10,500 / night</span>
            <p class="location">Location: Bengaluru, Karnataka</p>
            <a href="/booknow" class="cta-button">Book Now</a>
        </div>
    </div>

    <!-- Hotel 5 -->
    <div class="hotel-card">
         <img src="images/ramh.jpg" alt="Hotel Image">
        <div class="hotel-card-body">
            <h3>Rambagh Palace, Jaipur</h3>
            <p>Step into a world of luxury and history at the Rambagh Palace, known as the “Jewel of Jaipur”.</p>
            <span class="price">₹14,000 / night</span>
            <p class="location">Location: Jaipur, Rajasthan</p>
            <a href="/booknow" class="cta-button">Book Now</a>
        </div>
    </div>
    
    <!-- Hotel 6 -->
<div class="hotel-card">
    <img src="images/rosh.jpg" alt="Hotel Image">
    <div class="hotel-card-body">
        <h3>Rosewood, New York</h3>
        <p>Experience unparalleled luxury and elegance at the Rosewood Hotel, offering stunning views of the Manhattan skyline.</p>
        <span class="price">₹25,000 / night</span>
        <p class="location">Location: New York, USA</p>
        <a href="/booknow" class="cta-button">Book Now</a>
    </div>
</div>

<!-- Hotel 7 -->
<div class="hotel-card">
    <img src="images/burh.jpg" alt="Hotel Image">
    <div class="hotel-card-body">
        <h3>Burj Al Arab, Dubai</h3>
        <p>The world-renowned 7-star luxury hotel offering unmatched service, luxury, and breathtaking views in Dubai.</p>
        <span class="price">₹40,000 / night</span>
        <p class="location">Location: Dubai, UAE</p>
        <a href="/booknow" class="cta-button">Book Now</a>
    </div>
</div>

<!-- Hotel 8 -->
<div class="hotel-card">
    <img src="images/rith.jpg" alt="Hotel Image">
    <div class="hotel-card-body">
        <h3>The Ritz Paris</h3>
        <p>Step into timeless luxury at The Ritz Paris, where elegance and French sophistication meet.</p>
        <span class="price">₹30,000 / night</span>
        <p class="location">Location: Paris, France</p>
        <a href="/booknow" class="cta-button">Book Now</a>
    </div>
</div>
    
</div>

</body>
</html>