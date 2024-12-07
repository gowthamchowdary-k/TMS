<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tour Details</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Body Background Color */
        body {
            background-color: #f0f8ff; /* Light blue background */
        }

        .details-section {
            padding: 20px;
            background-color: #ffffff; /* White background for the details section */
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Light shadow for a card effect */
        }

        .carousel img {
            height: 300px;
            object-fit: cover;
        }

        .map-button {
            margin-top: 20px;
        }

        .counter-button {
            width: 35px;
            height: 35px;
            text-align: center;
            font-size: 18px;
            cursor: pointer;
        }

        .counter-container {
            display: flex;
            align-items: center;
            margin-top: 20px;
        }

        .total-cost {
            font-weight: bold;
            margin-top: 20px;
        }
        /* Add styles for the X button */
        .close-btn {
            position: absolute;
            top: 15px;
            right: 20px;
            background-color: transparent;
            border: none;
            font-size: 30px;
            color: #333;
            cursor: pointer;
        }

        .close-btn:hover {
            color: #007bff;
        }
    </style>
</head>

<body>

<div class="container my-5">
<button class="close-btn" onclick="window.location.href='/localGuides'">&times;</button>
    <div class="row">
        <!-- Images Section -->
        <div class="col-md-6">
            <div id="tourImages" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="images/guide7.jpg" class="d-block w-100" alt="Tour Image 1">
                    </div>
                    <div class="carousel-item">
                        <img src="images/guide6.jpg" class="d-block w-100" alt="Tour Image 2">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#tourImages" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#tourImages" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>

        <!-- Details Section -->
        <div class="col-md-6 details-section">
            <h2>Wine Tasting Adventure</h2>
            <p>Savor the best wines with a professional sommelier in a stunning location. Discover hidden vineyards and taste wines from across the region.</p>
            <ul class="list-unstyled">
                <li><strong>Free cancellation:</strong> Cancel up to 24 hours in advance for a full refund.</li>
                <li><strong>Reserve now & pay later:</strong> Book your spot and pay nothing today.</li>
                <li><strong>Duration:</strong> 3 hours</li>
                <li><strong>Live tour guide:</strong> English, French</li>
                <li><strong>Accessibility:</strong> Not wheelchair accessible</li>
                <li><strong>Type:</strong> Group tour</li>
            </ul>
            <p><strong>Price:</strong> ₹9,499 per person</p>

            <!-- Number of Candidates and Total Cost Section -->
            <div class="counter-container">
                <button class="counter-button" id="decrementBtn" onclick="adjustCandidates('decrement')">-</button>
                <input type="text" id="numCandidates" value="1" readonly class="form-control text-center" style="width: 60px; margin: 0 10px;">
                <button class="counter-button" id="incrementBtn" onclick="adjustCandidates('increment')">+</button>
            </div>

            <p class="total-cost">
                <strong>Total Cost: ₹<span id="totalCost">9499</span> (for <span id="displayCandidates">1</span> candidate)</strong>
            </p>

           
        </div>
    </div>

    <!-- Additional Details Section -->
    <div class="row mt-4">
        <div class="col-12 details-section">
            <h3>Experience Highlights</h3>
            <ul>
                <li>Savor the best wines with a professional sommelier in a stunning location.</li>
                <li>Explore hidden vineyards and unique wine regions.</li>
                <li>Learn about the winemaking process from vineyard to glass.</li>
                <li>Enjoy a guided tasting of local wines and food pairings.</li>
            </ul>
            <h3>Includes</h3>
            <ul>
                <li>Expert sommelier guide</li>
                <li>Wine tastings from various vineyards</li>
                <li>Food pairings with wines</li>
            </ul>
            <p><strong>Meeting Point:</strong> In front of the main vineyard entrance</p>
            <a href="https://maps.google.com" target="_blank" class="btn btn-secondary">Open in Google Maps</a>
        </div>
    </div>
</div>

<!-- Include Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script>
    const pricePerPerson = 9499; // Price per person

    // Adjust candidates and calculate total cost
    function adjustCandidates(action) {
        let numCandidates = parseInt(document.getElementById('numCandidates').value);
        if (action === 'increment') {
            numCandidates++;
        } else if (action === 'decrement' && numCandidates > 1) {
            numCandidates--;
        }

        document.getElementById('numCandidates').value = numCandidates;

        // Update display of candidates and total cost
        document.getElementById('displayCandidates').textContent = numCandidates;
        let totalCost = pricePerPerson * numCandidates; // Price per person for each candidate
        document.getElementById('totalCost').textContent = totalCost;
    }

    function viewMap() {
        window.location.href = "map.jsp"; // Redirect to a map.jsp page
    }
</script>
</body>

</html>
