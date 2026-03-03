<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Processing</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        /* General Styles */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 900px;
            margin: 50px auto;
            padding: 30px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #007bff;
            font-size: 36px;
            font-weight: bold;
            margin-bottom: 30px;
        }

        .payment-summary {
            background-color: #f4f4f4;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 30px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .payment-summary h4 {
            margin-bottom: 20px;
        }

        .payment-summary p {
            font-size: 18px;
            margin-bottom: 10px;
        }

        .btn-primary {
            background-color: #007bff;
            color: white;
            font-size: 18px;
            padding: 12px 25px;
            border-radius: 8px;
            width: 100%;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .spinner-border {
            display: none;
            margin: 20px auto;
            color: #007bff;
        }

        .confirmation-message {
            text-align: center;
            font-size: 20px;
            color: #4CAF50;
            font-weight: bold;
            margin-top: 30px;
        }

        .error-message {
            text-align: center;
            font-size: 20px;
            color: #e74c3c;
            font-weight: bold;
            margin-top: 30px;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                padding: 15px;
            }

            h2 {
                font-size: 30px;
            }

            .payment-summary p {
                font-size: 16px;
            }

            .btn-primary {
                font-size: 16px;
                padding: 12px 20px;
            }
        }
    </style>
</head>

<body>

    <div class="container">
        <h2>Payment Processing</h2>

        <div class="payment-summary">
            <h4>Payment Details</h4>
            <p><strong>Fee Type:</strong> <span id="feeType">Hotel Fee</span></p>
            <p><strong>Amount:</strong> ₹ <span id="amount">3000</span></p>
            <p><strong>Email:</strong> <span id="email">tanu@gamil.com</span></p>
            <p><strong>Phone:</strong> <span id="phoneNumber">9876543210</span></p>
            <p><strong>Remarks:</strong> <span id="remarks">Payment for the Hotel.</span></p>
        </div>

        <!-- Payment Processing Button -->
        <button class="btn btn-primary" id="processPaymentButton">Confirm Payment</button>

        <!-- Loading Spinner -->
        <div class="spinner-border" id="loadingSpinner" role="status">
            <span class="sr-only">Processing...</span>
        </div>

        <!-- Confirmation or Error Message -->
        <div id="confirmationMessage" class="confirmation-message" style="display:none;">
            Payment processed successfully!
        </div>
        <div id="errorMessage" class="error-message" style="display:none;">
            There was an error processing the payment. Please try again.
        </div>
    </div>

    <!-- JavaScript -->
    <script>
        document.getElementById('processPaymentButton').addEventListener('click', function() {
            // Show loading spinner
            document.getElementById('loadingSpinner').style.display = 'block';
            document.getElementById('processPaymentButton').style.display = 'none';

            // Simulate payment processing (this should be replaced with real payment logic)
            setTimeout(function() {
                // On success, show confirmation message
                document.getElementById('loadingSpinner').style.display = 'none';
                document.getElementById('confirmationMessage').style.display = 'block';
            }, 3000); // Simulate a 3-second payment process

            // In case of an error
            setTimeout(function() {
                // Uncomment the following line to simulate an error
                // document.getElementById('loadingSpinner').style.display = 'none';
                // document.getElementById('errorMessage').style.display = 'block';
            }, 3000); // Simulate error after 3 seconds
        });
    </script>

</body>

</html>
    