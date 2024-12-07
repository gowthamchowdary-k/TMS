<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tour Details</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .details-section {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
        }

        .counter-container {
            display: flex;
            align-items: center;
            margin-top: 15px;
        }

        .counter-button {
            width: 40px;
            height: 40px;
            border: none;
            background-color: #007bff;
            color: white;
            font-size: 20px;
            border-radius: 50%;
        }

        .counter-button:hover {
            background-color: #0056b3;
        }

        .total-cost {
            margin-top: 15px;
        }

        .map-button {
            margin-top: 15px;
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
                            <img src="images/guide3.jpg" class="d-block w-100" alt="Tour Image 1">
                        </div>
                        <div class="carousel-item">
                            <img src="images/guide4.jpg" class="d-block w-100" alt="Tour Image 2">
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
                <h2>Vintage Sidecar Night Tour</h2>
                <p>Take an unusual and authentic tour in a sidecar along the Loire and the vineyards. You'll discover the most emblematic parts of Tours.</p>
                <ul class="list-unstyled">
                    <li><strong>Free cancellation:</strong> Cancel up to 24 hours in advance for a full refund.</li>
                    <li><strong>Reserve now & pay later:</strong> Book your spot and pay nothing today.</li>
                    <li><strong>Duration:</strong> 2 hours</li>
                    <li><strong>Live tour guide:</strong> English, French</li>
                    <li><strong>Accessibility:</strong> Wheelchair accessible</li>
                    <li><strong>Type:</strong> Private group</li>
                </ul>
                <p><strong>Price:</strong> ₹17,897 per group (up to 2)</p>

                <!-- Number of Candidates and Total Cost Section -->
                <div class="counter-container">
                    <button class="counter-button" id="decrementBtn" onclick="adjustCandidates('decrement')">-</button>
                    <input type="text" id="numCandidates" value="1" readonly class="form-control text-center" style="width: 60px; margin: 0 10px;">
                    <button class="counter-button" id="incrementBtn" onclick="adjustCandidates('increment')">+</button>
                </div>

                <p class="total-cost">
                    <strong>Total Cost: ₹<span id="totalCost">17897</span> (for <span id="displayCandidates">1</span> candidate)</strong>
                </p>

               
            </div>
        </div>

        <!-- Additional Details Section -->
        <div class="row mt-4">
            <div class="col-12 details-section">
                <h3>Experience Highlights</h3>
                <ul>
                    <li>Discover the architectural heritage of Vieux-Tours at nightfall</li>
                    <li>See the Place Châteauneuf, Place Plumereau, and the Clock Tower</li>
                    <li>Admire the Saint-Martin Basilica and the Charlemagne Tower</li>
                    <li>Take a break near the Wilson Bridge and enjoy a glass of local wine</li>
                    <li>Travel in a vintage sidecar and see the city in a unique way</li>
                </ul>
                <h3>Includes</h3>
                <ul>
                    <li>Vintage sidecar ride</li>
                    <li>Local wine tasting</li>
                    <li>Professional driver-guide</li>
                    <li>Mandatory equipment</li>
                </ul>
                <p><strong>Meeting Point:</strong> In front of the Tourist Office</p>
                <a href="https://maps.google.com" target="_blank" class="btn btn-secondary">Open in Google Maps</a>
            </div>
        </div>
    </div>

    <!-- JavaScript for Counter -->
    <script>
        function adjustCandidates(action) {
            const numCandidatesField = document.getElementById("numCandidates");
            const totalCostField = document.getElementById("totalCost");
            const displayCandidatesField = document.getElementById("displayCandidates");

            let numCandidates = parseInt(numCandidatesField.value);
            const pricePerGroup = 17897;

            if (action === "increment") {
                numCandidates += 1;
            } else if (action === "decrement" && numCandidates > 1) {
                numCandidates -= 1;
            }

            numCandidatesField.value = numCandidates;
            totalCostField.textContent = pricePerGroup * numCandidates;
            displayCandidatesField.textContent = numCandidates;
        }

        function viewMap() {
            window.open("https://maps.google.com", "_blank");
        }
    </script>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
