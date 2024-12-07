<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thank You</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
        }

        .thankyou-container {
            text-align: center;
            padding: 50px;
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            width: 100%;
        }

        .thankyou-container h1 {
            font-size: 3em;
            color: #28a745;
            margin-bottom: 20px;
        }

        .thankyou-container p {
            font-size: 1.2em;
            color: #555;
            margin-bottom: 30px;
        }

        .cta-button {
            background-color: #039be5;
            color: white;
            padding: 15px 30px;
            border-radius: 50px;
            font-size: 1.2em;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .cta-button:hover {
            background-color: #0288d1;
        }

        footer {
            margin-top: 40px;
            text-align: center;
            color: #777;
        }

        footer a {
            color: #039be5;
            text-decoration: none;
            font-weight: bold;
        }

    </style>
</head>
<body>

    <!-- Thank You Section -->
    <div class="thankyou-container">
        <h1>Thank You!</h1>
        
        <a href="/" class="cta-button">Back to Home</a>
    </div>

    
    

</body>
</html>