<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BookNow.com - Your Travel Experience</title>
<!-- Bootstrap CSS -->
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
    rel="stylesheet" />
<!-- Bootstrap Icons -->
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
    rel="stylesheet" />
<style>
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
    color: #333;
}

/* Navbar */
.navbar {
    background-color: #0d47a1;
    padding: 10px;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
    display: flex;
    justify-content: space-between;
    align-items: center;
}

/* Profile image and username */
.profile img {
    width: 50px;  /* Set the desired width */
    height: 50px;  /* Set the desired height */
    border-radius: 50%;  /* Make it circular */
    object-fit: cover;  /* Ensures the image fits well inside the circle */
    margin-right: 10px;
}

.profile .username {
    color: #fff;
    font-weight: bold;
}

/* Navbar links */
.navbar a {
    color: #fff;
    text-decoration: none;
    font-size: 18px;
    margin-right: 30px;
    font-weight: bold;
}

.navbar a:hover {
    color: #ffd700; /* Golden color on hover */
    text-decoration: underline;
}

.navbar .logo {
    font-size: 24px;
    color: #ffd700;
    font-weight: bold;
}

/* Banner image and Explore button */
.banner {
    background-image: url('images/desti.jpg'); /* Your destination image */
    background-size: cover;
    background-position: center;
    height: 60vh;
    display: flex;
    justify-content: center;
    align-items: center;
    text-align: center;
    color: white;
}

.banner h1 {
    font-size: 50px;
    font-weight: bold;
    text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.6);
}

/* Quote Box */
.quote-box {
    background: linear-gradient(135deg, #ff7e5f, #feb47b);
    /* Gradient from coral to peach */
    padding: 40px;
    border-radius: 15px;
    box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.1);
    text-align: center;
    margin-top: 50px;
    max-width: 800px;
    margin-left: auto;
    margin-right: auto;
    position: relative;
}

.quote-box blockquote {
    font-size: 28px;
    font-style: italic;
    color: #fff;
    margin: 0;
    padding-bottom: 20px;
    border-bottom: 3px solid #ffd700; /* Golden underline */
}

.quote-box footer {
    font-size: 20px;
    font-weight: bold;
    color: #fff;
    padding-top: 20px;
}

.quote-box::before {
    content: "“";
    font-size: 60px;
    font-weight: bold;
    color: #ffd700; /* Golden color */
    position: absolute;
    top: -30px;
    left: 20px;
}

.quote-box::after {
    content: "”";
    font-size: 60px;
    font-weight: bold;
    color: #ffd700;
    position: absolute;
    bottom: -30px;
    right: 20px;
}

/* Optional: Add animation to the quote box */
.quote-box {
    animation: fadeInUp 1s ease-out;
}

/* Keyframe animation for the quote box */
@keyframes fadeInUp {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

/* Stats Section */
.stats {
    display: flex;
    justify-content: space-around;
    margin-top: 10px;
    text-align: center;
}

.stat-box {
    background-color: #fff;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
    width: 20%;
}

.stat-box h3 {
    font-size: 28px;
    color: #003366;
}

.stat-box p {
    font-size: 22px;
    color: #777;
}

/* Our Travel Stats Heading */
.custom-heading {
    font-size: 36px;
    font-weight: bold;
    text-transform: uppercase;
    color: #003366; /* Dark blue color */
    letter-spacing: 2px;
    border-bottom: 3px solid #ffd700; /* Golden underline */
    padding-bottom: 10px;
    display: inline-block;
    margin-top: 50px;
}

/* Customer Reviews */
.reviews {
    background-color: #003366;
    color: #fff;
    padding: 40px 20px;
    margin-top: 60px;
}

.review-card {
    background-color: #fff;
    color: #333;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
    margin-bottom: 30px;
    height: 220px;
}

.review-card h5 {
    font-size: 20px;
    color: #003366;
    margin-bottom: 10px;
}

.review-card p {
    font-size: 16px;
    color: #555;
    flex: 1;
}

.review-card img {
    border-radius: 50%;
    width: 80px;
    height: 80px;
    margin-right: 20px;
}

.review-card .review-content {
    display: flex;
    align-items: center;
    justify-content: center;
    height: 100%;
}

.review-card .review-content .text {
    flex: 1;
}

.review-card .review-content .text p {
    font-style: italic;
}
</style>
</head>
<body>

    <!-- Navbar -->
    <div class="navbar">
        <!-- Profile Section -->
        <div class="profile">
            <img src="images/profile.jpeg" alt="Profile Photo">
            <%-- Check if the username exists in the session --%>
            <%
                String username = (String) session.getAttribute("username");
            %>

            <% if (username != null) { %>
                <div class="username"><%= username %></div>
            <% } else { %>
                <div class="username">Welcome, Guest</div>
            <% } %>
        </div>

        <div>
            <a href="/home2"><i class="bi bi-house-door-fill"></i> Home</a>
            <a href="/explore"><i class="bi bi-geo-alt-fill"></i> Explore</a>
            <a href="/hotels"><i class="bi bi-building"></i> Hotels</a>
            <a href="/localGuides"><i class="bi bi-person-bounding-box"></i> Tourist Guides</a>
            <a href="/thankyou"><i class="bi bi-box-arrow-right"></i> Logout</a>
        </div>
    </div>

    <!-- Banner Section -->
    <div class="banner">
        <div>
            <h1>Destinations & Travel Guides</h1>
            <a href="/explore" class="btn btn-warning btn-lg mt-3">Explore Now</a>
        </div>
    </div>

    <!-- Quote Box -->
    <div class="quote-box">
        <blockquote>"The world is a book, and those who do not travel read only one page."</blockquote>
        <footer>- Saint Augustine</footer>
    </div>

    <h2 class="text-center my-5 custom-heading">Our Travel Stats</h2>

    <div class="stats">
        <div class="stat-box">
            <h3>Countries</h3>
            <p>50+</p>
            <a href="/countries" class="btn btn-link p-0">*</a>
        </div>
        <div class="stat-box">
            <h3>Flight Miles Flown</h3>
            <p>100M+</p>
        </div>
        <div class="stat-box">
            <h3>Continents</h3>
            <p>6</p>
        </div>
        <div class="stat-box">
            <h3>States/U.S. Territories</h3>
            <p>25+</p>
        </div>
    </div>

    <!-- Customer Reviews -->
    <div class="reviews">
        <div class="container">
            <h2 class="text-center mb-5">What Our Customers Say</h2>
            <div class="row">
                <div class="col-md-4">
                    <div class="review-card">
                        <div class="review-content">
                            <img src="images/john.jpeg" alt="John Doe">
                            <div class="text">
                                <h5>John Doe</h5>
                                <p>"Amazing experience! The travel guides were fantastic, and the homestays were so cozy. Highly recommend!"</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="review-card">
                        <div class="review-content">
                            <img src="images/jane.jpeg" alt="Jane Smith">
                            <div class="text">
                                <h5>Jane Smith</h5>
                                <p>"I loved exploring new destinations with the help of the expert guides. Definitely worth it!"</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="review-card">
                        <div class="review-content">
                            <img src="images/michael.jpeg" alt="Michael Johnson">
                            <div class="text">
                                <h5>Michael Johnson</h5>
                                <p>"The flight miles tracker was a fun feature, and I can't wait for my next trip with BookNow.com!"</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
