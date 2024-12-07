<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Confirmation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Link Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.0/font/bootstrap-icons.min.css" />
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            color: #495057;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            text-align: center;
        }

        .card {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            padding: 30px;
        }

        .tick-mark {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            background-color: #28a745;
            color: white;
            width: 80px;
            height: 80px;
            border-radius: 50%;
            margin: 10px auto;
            font-size: 40px;
        }

        .btn-primary {
            background-color: #28a745;
            border-color: #28a745;
            border-radius: 30px;
            padding: 10px 25px;
            font-size: 1.1rem;
            text-decoration: none;
        }

        .btn-primary:hover {
            background-color: #218838;
            border-color: #1e7e34;
        }

        
    </style>
</head>
<body>

<div class="container">
    <div class="card">
        <!-- Tick Mark -->
        <div class="tick-mark">
            <!-- Use Bootstrap Icon -->
            <i class="bi bi-check-circle-fill"></i>
        </div>
        <h2>Congratulations!</h2>
        <p>Your booking has been successfully confirmed. You will receive a confirmation email shortly.</p>
        <a href="/home2" class="btn btn-primary">Go to Homepage</a>
        
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>