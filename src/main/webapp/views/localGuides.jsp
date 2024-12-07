<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Local Guide</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }
        .card img {
            border-radius: 3px;
            width: 100%;
            height: 250px;
            object-fit: cover;
        }
        .hero-section {
            text-align: center;
            padding: 30px 20px;
            background-color: #343a40;
            color: white;
        }
        .rating {
            color: #ffc107;
        }
        /* Close Button Style */
        .close-btn {
            position: absolute;
            top: 15px;
            right: 20px;
            background-color: transparent;
            border: none;
            font-size: 25px;
            color: white;
            cursor: pointer;
        }

        .close-btn:hover {
            color: #007bff;
        }
    </style>
</head>
<body>

<div class="hero-section">
	<button class="close-btn" onclick="window.location.href='/home2';">Back</button>
    <h1>Local Guide: Discover Hidden Gems</h1>
    <p>Explore your destination with curated tours by experienced local guides.</p>
</div>

<!-- Featured Tours Section -->
<div class="container my-5">
    <h2 class="text-center">Featured Tours</h2>
    <div class="row mt-4">
        <!-- Tour 1 -->
        <div class="col-md-4">
            <div class="card">
                <img src="images/guide2.jpg" class="card-img-top" alt="Tour Image 1">
                <div class="card-body">
                    <h5 class="card-title">Vintage Sidecar Night Tour</h5>
                    <p class="card-text">Experience the city's nightlife with a vintage sidecar and a local guide.</p>
                    <p><strong>Place:</strong> City Center</p>
                    <p><strong>Country:</strong> USA</p>
                    <p class="rating">⭐⭐⭐⭐⭐</p>
                    <a href="/tourDetails" class="btn btn-primary">View Details</a>
                </div>
            </div>
        </div>
        <!-- Tour 2 -->
        <div class="col-md-4">
            <div class="card">
                <img src="images/guide5.jpg" class="card-img-top" alt="Tour Image 2">
                <div class="card-body">
                    <h5 class="card-title">Wine Tasting Adventure</h5>
                    <p class="card-text">Savor the best wines with a professional sommelier in a stunning location.</p>
                    <p><strong>Place:</strong> Napa Valley</p>
                    <p><strong>Country:</strong> USA</p>
                    <p class="rating">⭐⭐⭐⭐⭐</p>
                    <a href="/tourDetails2" class="btn btn-primary">View Details</a>
                </div>
            </div>
        </div>
        <!-- Tour 3 -->
        <div class="col-md-4">
            <div class="card">
                <img src="images/guide1.jpg" class="card-img-top" alt="Tour Image 3">
                <div class="card-body">
                    <h5 class="card-title">Cultural Heritage Walk</h5>
                    <p class="card-text">Dive deep into the culture and history of the city with an expert guide.</p>
                    <p><strong>Place:</strong> Old Town</p>
                    <p><strong>Country:</strong> Italy</p>
                    <p class="rating">⭐⭐⭐⭐⭐</p>
                    <a href="/tourDetails3" class="btn btn-primary">View Details</a>
                </div>
            </div>
        </div>
        <!-- Tour 4 -->
        <div class="col-md-4">
            <div class="card">
                <img src="images/trekking.jpeg" class="card-img-top" alt="Tour Image 4">
                <div class="card-body">
                    <h5 class="card-title">Mountain Trekking Expedition</h5>
                    <p class="card-text">Embark on an exciting trekking journey through scenic mountain trails with a knowledgeable guide.</p>
                    <p><strong>Place:</strong> Everest Base Camp</p>
                    <p><strong>Country:</strong> Nepal</p>
                    <p class="rating">⭐⭐⭐⭐⭐</p>
                    <a href="/tourDetails4" class="btn btn-primary">View Details</a>
                </div>
            </div>
        </div>
        <!-- Tour 5 -->
        <div class="col-md-4">
            <div class="card">
                <img src="images/egypt.jpeg" class="card-img-top" alt="Tour Image 5">
                <div class="card-body">
                    <h5 class="card-title">Historical City Tour</h5>
                    <p class="card-text">Discover the rich history and landmarks of the city with an expert guide.</p>
                    <p><strong>Place:</strong> Ancient Ruins</p>
                    <p><strong>Country:</strong> Egypt</p>
                    <p class="rating">⭐⭐⭐⭐⭐</p>
                    <a href="/tourDetails5" class="btn btn-primary">View Details</a>
                </div>
            </div>
        </div>
        <!-- Tour 6 -->
        <div class="col-md-4">
            <div class="card">
                <img src="images/monaco.jpeg" class="card-img-top" alt="Tour Image 6">
                <div class="card-body">
                    <h5 class="card-title">Private Yacht Experience</h5>
                    <p class="card-text">Relax and enjoy the sights from a luxurious private yacht with a personal guide.</p>
                    <p><strong>Place:</strong> Monaco Bay</p>
                    <p><strong>Country:</strong> Monaco</p>
                    <p class="rating">⭐⭐⭐⭐⭐</p>
                    <a href="/tourDetails6" class="btn btn-primary">View Details</a>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- Include Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
