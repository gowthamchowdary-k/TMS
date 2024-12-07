<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Booking</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
    body {
        font-family: Arial, sans-serif;
        background-image: url('https://www.hdwallpapers.in/download/boeing_c_17_globemaster_iii_military_transport_aircraft_4k-2560x1440.jpg'); /* Add the URL of your background image */
        background-size: cover; /* Ensures the image covers the entire body */
        background-position: center; /* Centers the image */
        background-attachment: fixed; /* Keeps the background fixed while scrolling */
        color: #495057;
    }

    .container {
        max-width: 800px;
        margin-top: 50px;
        background-color: rgba(255, 255, 255, 0.8); /* Optional: Adds a white background with transparency to the container */
        padding: 20px; /* Optional: Adds padding inside the container */
        border-radius: 10px; /* Optional: Rounds the container's corners */
    }

    .card-header {
        background-color: #007bff;
        color: white;
        font-size: 1.25rem;
    }

    .card-body {
        background-color: #ffffff;
        padding: 2rem;
    }

    .btn-primary {
        background-color: #007bff;
        border-color: #007bff;
    }

    .btn-primary:hover {
        background-color: #0056b3;
        border-color: #0056b3;
    }

    .form-label {
        font-weight: bold;
    }

    .card {
        border-radius: 10px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }

    .card-body input,
    .card-body select {
        border-radius: 8px;
    }
</style>

</head>
<body>

<div class="container">
    <h1 class="text-center mb-4">Transport Booking</h1>

    <div class="card">
        <div class="card-header">
            <strong>Book Your Transport: ${placeName}</strong>
        </div>
        <div class="card-body">
            <form action="/api/bookings/confirmBooking" method="post">

                <div class="mb-3">
                    <label for="fullName" class="form-label">Full Name</label>
                    <input type="text" class="form-control" id="fullName" name="fullName" required>
                </div>

                <div class="mb-3">
                    <label for="email" class="form-label">Email Address</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
                
                <div class="mb-3">
                    <label for="phone" class="form-label">Phone Number</label>
                    <input type="text" class="form-control" id="phone" name="phone" required>
                </div>

                <!-- Country Selection -->
                <div class="mb-3">
                    <label for="country" class="form-label">Country</label>
                    <select class="form-select" id="country" name="country" onchange="updatePlaces()" required>
                        <option value="" disabled selected>Select a country</option>
                        <option value="India">India</option>
                        <option value="France">France</option>
                        <option value="Japan">Japan</option>
                        <option value="USA">USA</option>
                        <option value="Italy">Italy</option>
                        <option value="Australia">Australia</option>
                        <option value="Brazil">Brazil</option>
                    </select>
                </div>

                <!-- Place Selection -->
                <div class="mb-3">
                    <label for="place" class="form-label">Place to Visit</label>
                    <select class="form-select" id="place" name="place" required>
                        <option value="" disabled selected>Select a place</option>
                    </select>
                </div>

                <!-- Travel Date -->
                <div class="mb-3">
                    <label for="travelDate" class="form-label">Travel Date</label>
                    <input type="date" class="form-control" id="travelDate" name="travelDate" required>
                </div>

                <!-- Transport Options -->
                <div class="mb-3">
                    <label for="transport" class="form-label">Transport Type</label>
                    <select class="form-select" id="transport" name="transport" required>
                        <option value="" disabled selected>Select transport type</option>
                        <option value="Car">Car</option>
                        <option value="Bus">Bus</option>
                        <option value="Train">Train</option>
                        <option value="Flight">Flight</option>
                    </select>
                </div>

                <!-- Submit and Close Buttons -->
                <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-primary btn-lg">Confirm Booking</button>
                    <button type="button" class="btn btn-secondary btn-lg" onclick="redirectToPreviousPage()">Close</button>
                </div>

            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script>
    const placesByCountry = {
        "India": [
            { name: "Taj Mahal", value: "taj_mahal" },
            { name: "Jaipur City Palace", value: "jaipur_city_palace" },
            { name: "Kerala Backwaters", value: "kerala_backwaters" },
            { name: "Goa Beaches", value: "goa_beaches" },
            { name: "Himalayas", value: "himalayas" }
        ],
        "France": [
            { name: "Eiffel Tower", value: "eiffel_tower" },
            { name: "Louvre Museum", value: "louvre_museum" },
            { name: "Mont Saint-Michel", value: "mont_saint_michel" },
            { name: "French Riviera", value: "french_riviera" },
            { name: "Palace of Versailles", value: "palace_of_versailles" }
        ],
        "Japan": [
            { name: "Mount Fuji", value: "mount_fuji" },
            { name: "Kyoto Temples", value: "kyoto_temples" },
            { name: "Tokyo Tower", value: "tokyo_tower" },
            { name: "Arashiyama Bamboo Forest", value: "arashiyama_bamboo_forest" },
            { name: "Osaka Castle", value: "osaka_castle" }
        ],
        "USA": [
            { name: "Grand Canyon", value: "grand_canyon" },
            { name: "Statue of Liberty", value: "statue_of_liberty" },
            { name: "Yellowstone National Park", value: "yellowstone_national_park" },
            { name: "Times Square", value: "times_square" },
            { name: "Golden Gate Bridge", value: "golden_gate_bridge" }
        ],
        "Italy": [
            { name: "Colosseum", value: "colosseum" },
            { name: "Venice Canals", value: "venice_canals" },
            { name: "Leaning Tower of Pisa", value: "leaning_tower_of_pisa" },
            { name: "Amalfi Coast", value: "amalfi_coast" },
            { name: "Vatican City", value: "vatican_city" }
        ],
        "Australia": [
            { name: "Sydney Opera House", value: "sydney_opera_house" },
            { name: "Great Barrier Reef", value: "great_barrier_reef" },
            { name: "Uluru", value: "uluru" },
            { name: "Bondi Beach", value: "bondi_beach" },
            { name: "Kakadu National Park", value: "kakadu_national_park" }
        ],
        "Brazil": [
            { name: "Christ the Redeemer", value: "christ_the_redeemer" },
            { name: "Amazon Rainforest", value: "amazon_rainforest" },
            { name: "Iguazu Falls", value: "iguazu_falls" },
            { name: "Copacabana Beach", value: "copacabana_beach" },
            { name: "Sugarloaf Mountain", value: "sugarloaf_mountain" }
        ]
    };

    function updatePlaces() {
        const country = document.getElementById("country").value;
        const placeSelect = document.getElementById("place");
        placeSelect.innerHTML = '<option value="" disabled selected>Select a place</option>'; // Reset places

        if (country in placesByCountry) {
            placesByCountry[country].forEach(place => {
                const option = document.createElement("option");
                option.value = place.value;
                option.textContent = place.name;
                placeSelect.appendChild(option);
            });
        }
    }

    function redirectToPreviousPage() {
        const referrer = document.referrer;
        if (referrer) {
            window.location.href = referrer;
        } else {
            window.location.href = '/'; // Fallback to homepage or any default page
        }
    }

</script>
</body>
</html>
