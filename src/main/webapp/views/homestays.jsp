<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Homestays Available | BookNow.com</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
            color: #333;
        }

        .navbar {
            background-color: #003366;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
        }

        .navbar a {
            color: #fff;
            text-decoration: none;
            font-size: 18px;
            margin-right: 30px;
            font-weight: bold;
        }

        .navbar a:hover {
            color: #ffd700;
        }

        .content {
            padding: 80px 20px 20px;
            text-align: center;
        }

        .content h1 {
            font-size: 36px;
            margin-bottom: 20px;
        }

        .card {
            margin: 20px 0;
        }

        .card img {
            width: 100%;
            border-radius: 8px;
        }

        .card-title {
            font-size: 24px;
            font-weight: bold;
        }

        .footer {
            background-color: #003366;
            color: #fff;
            padding: 10px 0;
            text-align: center;
            font-size: 14px;
            margin-top: 60px;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <div class="navbar">
        <div class="logo">BookNow.com</div>
        <div>
            <a href="/explore">Explore</a>
            <a href="/hotels">Hotels</a>
            <a href="#">Transport</a>
            <a href="#">Tourist Guides</a>
        </div>
    </div>

    <!-- Main Content -->
    <div class="content">
        <h1>Available Homestays</h1>

        <!-- Example of Homestay Card List -->
        <div class="container">
            <div class="row">
                <!-- Repeat this card for each homestay -->
                <div class="col-md-4">
                    <div class="card">
                        <img src="path-to-image.jpg" alt="Homestay Image">
                        <div class="card-body">
                            <h5 class="card-title">Homestay Name</h5>
                            <p class="card-text">Short description of the homestay, its features, location, etc.</p>
                            <a href="/book-homestay?id=1" class="btn btn-primary">Book Now</a> <!-- Link to book page -->
                        </div>
                    </div>
                </div>
                <!-- Repeat the card as needed for other homestays -->
            </div>
        </div>
    </div>

    <!-- Footer -->
    <div class="footer">
        &copy; 2024 BookNow.com | All Rights Reserved
    </div>

    <!-- Bootstrap JS (optional) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
