<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Methods</title>
    <style>
        /* Global Styles */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f7fc;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .payments-container {
            background-color: white;
            width: 100%;
            max-width: 800px;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .header h1 {
            color: #333;
            font-size: 32px;
            margin-bottom: 10px;
        }

        .header p {
            font-size: 16px;
            color: #777;
        }

        .buttons-container {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 20px;
        }

        .payment-button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 15px 25px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width: 200px;
        }

        .payment-button:hover {
            background-color: #0056b3;
        }

        /* Payment Method Forms */
        .payment-method {
            margin-top: 40px;
            display: none;
            text-align: left;
        }

        .payment-form label {
            display: block;
            margin: 10px 0 5px;
            font-size: 14px;
            font-weight: bold;
        }

        .payment-form input {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }

        .payment-form .submit-btn {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 12px 25px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .payment-form .submit-btn:hover {
            background-color: #218838;
        }

        /* UPI Section */
        .upi-scanner-container {
            margin-top: 20px;
            text-align: center;
        }

        .upi-scanner {
            max-width: 100%;
            height: auto;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Card Expiry Date Fields */
        .expiry-container {
            display: flex;
            gap: 10px;
        }

        /* Mobile Responsiveness */
        @media (max-width: 768px) {
            .payments-container {
                padding: 20px;
            }

            .buttons-container {
                flex-direction: column;
                gap: 15px;
            }

            .payment-button {
                width: 100%;
            }
        }
    </style>

    <script>
        function handlePaymentMethod(method) {
            const sections = {
                internetBanking: document.getElementById("internet-banking"),
                upi: document.getElementById("upi"),
                card: document.getElementById("card"),
            };

            Object.values(sections).forEach((section) => (section.style.display = "none"));
            if (sections[method]) sections[method].style.display = "block";
        }
    </script>
</head>

<body>
    <div class="payments-container">
        <div class="header">
            <h1>Select Payment Method</h1>
            <p>Please choose your preferred payment method below to proceed with the payment.</p>
        </div>

        <div class="buttons-container">
            <button onclick="handlePaymentMethod('internetBanking')" class="payment-button internet-banking-btn">
                Pay using Internet Banking
            </button>
            <button onclick="handlePaymentMethod('upi')" class="payment-button upi-btn">
                Pay using UPI
            </button>
            <button onclick="handlePaymentMethod('card')" class="payment-button card-btn">
                Pay using Credit/Debit Card
            </button>
        </div>

        <!-- Internet Banking Form -->
        <div id="internet-banking" class="payment-method" style="display: none;">
            <h2>Internet Banking</h2>
            <form action="/paymentprocess" method="post" class="payment-form">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" placeholder="Enter username" required />
                <label for="bankName">Bank Name:</label>
                <input type="text" id="bankName" name="bankName" placeholder="Enter bank name" required />
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" placeholder="Enter password" required />
                <button type="submit" class="submit-btn">Submit</button>
            </form>
        </div>

        <!-- UPI Section -->
        <div id="upi" class="payment-method" style="display: none;">
            <h2>UPI</h2>
            <p>Scan the QR Code below to complete the payment:</p>
            <div class="upi-scanner-container">
                <img src="images/Scanner.jpeg" alt="UPI Scanner" class="upi-scanner" />
            </div>
        </div>

        <!-- Credit/Debit Card Form -->
        <div id="card" class="payment-method" style="display: none;">
            <h2>Credit/Debit Card</h2>
            <form action="/paymentprocess" method="post" class="payment-form">
                <label for="cardNumber">Card Number:</label>
                <input type="text" id="cardNumber" name="cardNumber" placeholder="Enter card number" required />
                <label for="expiryMonth">Expiry Date:</label>
                <div class="expiry-container">
                    <input type="number" id="expiryMonth" name="expiryMonth" placeholder="MM" max="12" style="width: 60px" required />
                    <input type="number" id="expiryYear" name="expiryYear" placeholder="YYYY" style="width: 80px" required />
                </div>
                <label for="cvv">CVV:</label>
                <input type="password" id="cvv" name="cvv" placeholder="Enter CVV" required />
                <button type="submit" class="submit-btn">Submit</button>
            </form>
        </div>
    </div>
</body>

</html>
