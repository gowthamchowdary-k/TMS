<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Discover the World - BookNow.com</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
        }

        .header {
            text-align: center;
            background-color: #003366;
            color: white;
            padding: 20px;
            margin-bottom: 20px;
        }

        .category-card {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.3s ease;
            cursor: pointer;
        }

        .category-card:hover {
            transform: scale(1.05);
        }

        .category-card .icon {
            font-size: 50px;
            color: #003366;
            margin-bottom: 15px;
        }

        .category-card h3 {
            font-size: 22px;
            color: #003366;
            margin-bottom: 10px;
        }

        .category-card p {
            color: #555;
        }

        .new-title {
            text-align: center;
            margin: 40px 0 20px 0;
            font-size: 36px;
            font-weight: bold;
            color: #003366;
        }

        .new-title span {
            color: #ffd700; /* Golden color */
        }
    </style>
</head>
<body>
    <!-- New Title Section -->
    <div class="new-title">
        Discover the <span>World</span>
    </div>

    <div class="container">
        <div class="row g-4">
            <div class="col-md-4">
                <div class="category-card">
                    <i class="bi bi-building icon"></i>
                    <h3>Urban Wonders</h3>
                    <p>Explore iconic cities and modern architecture.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="category-card">
                    <i class="bi bi-tree icon"></i>
                    <h3>Nature Escapes</h3>
                    <p>Discover breathtaking landscapes and natural wonders.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="category-card">
                    <i class="bi bi-bank icon"></i>
                    <h3>Historical Sites</h3>
                    <p>Dive into the rich history and culture of ancient landmarks.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="category-card">
                    <i class="bi bi-sun icon"></i>
                    <h3>Tropical Paradises</h3>
                    <p>Relax on pristine beaches and enjoy sunny getaways.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="category-card">
                    <i class="bi bi-map icon"></i>
                    <h3>Adventure Trails</h3>
                    <p>Embark on thrilling adventures in the great outdoors.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="category-card">
                    <i class="bi bi-heart icon"></i>
                    <h3>Romantic Getaways</h3>
                    <p>Experience the most romantic destinations worldwide.</p>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
