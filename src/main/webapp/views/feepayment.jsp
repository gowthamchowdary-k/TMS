<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Portal</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <!-- Add Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* General Styles */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fc;
            margin: 0;
            padding: 0;
        }

        .fee-container {
            max-width: 600px;
            margin: 40px auto;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.1);
        }

        .fee-title {
            text-align: center;
            font-size: 32px;
            font-weight: bold;
            color: #333;
            margin-bottom: 30px;
        }

        .fee-payment-card {
            padding: 25px;
            background-color: #fafafa;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
        }

        .fee-select,
        .fee-input,
        .fee-textarea {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 16px;
            transition: all 0.3s;
        }

        .fee-select:focus,
        .fee-input:focus,
        .fee-textarea:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.2);
            outline: none;
        }

        .fee-button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 15px 25px;
            font-size: 18px;
            border-radius: 6px;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s;
        }

        .fee-button:hover {
            background-color: #0056b3;
        }

        /* Error message styles */
        .fee-form-error {
            color: #e74c3c;
            font-size: 14px;
            margin-top: -10px;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .fee-container {
                padding: 20px;
            }

            .fee-title {
                font-size: 28px;
            }

            .fee-button {
                font-size: 16px;
                padding: 12px;
            }
        }
    </style>
</head>

<body>
    <div class="fee-container">
        <h2 class="fee-title"> Payment Portal</h2>
        <div class="fee-payment-card">
            <form action="payment.jsp" method="post" id="feeForm">
                <!-- Fee Type Selection -->
                <div class="mb-3">
                    <label for="feeType" class="form-label">Payment Type</label>
                    <select class="form-select fee-select" id="feeType" name="feeType" required>
                        <option value="hotel">Hotel Payment</option>
                        <option value="Tour">Tour Payment</option>
                        <option value="Local Guide">Local Guide Payment</option>
                        <option value="other">Other</option>
                        
                    </select>
                </div>

                <!-- Amount Input -->
                <div class="mb-3">
                    <label for="amount" class="form-label">Amount (₹)</label>
                    <input type="number" class="form-control fee-input" id="amount" name="amount" required>
                </div>

                <!-- Email Input -->
                <div class="mb-3">
                    <label for="email" class="form-label">Email ID</label>
                    <input type="email" class="form-control fee-input" id="email" name="email" required>
                    <div id="emailError" class="fee-form-error"></div>
                </div>

                <!-- Phone Number Input -->
                <div class="mb-3">
                    <label for="phoneNumber" class="form-label">Phone Number</label>
                    <input type="text" class="form-control fee-input" id="phoneNumber" name="phoneNumber" required>
                    <div id="phoneError" class="fee-form-error"></div>
                </div>

                <!-- Remarks Textarea -->
                <div class="mb-3">
                    <label for="remarks" class="form-label">Remarks</label>
                    <textarea class="form-control fee-textarea" id="remarks" name="remarks" rows="3"></textarea>
                </div>

                <!-- Submit Button -->
                <button type="submit" class="btn fee-button">Pay Now</button>
            </form>
        </div>
    </div>

    <!-- JavaScript -->
    <script>
        // Email and phone number validation
        document.getElementById('feeForm').addEventListener('submit', function (event) {
            event.preventDefault(); // Prevent form submission for validation

            let email = document.getElementById('email').value;
            let phoneNumber = document.getElementById('phoneNumber').value;
            let emailError = document.getElementById('emailError');
            let phoneError = document.getElementById('phoneError');
            let valid = true;

            // Validate email
            const emailPattern = /^[\w-.]+@[\w-]+\.[a-z]{2,4}$/i;
            if (!emailPattern.test(email)) {
                emailError.textContent = "Invalid email address.";
                valid = false;
            } else {
                emailError.textContent = "";
            }

            // Validate phone number
            const phonePattern = /^[0-9]{10}$/;
            if (!phonePattern.test(phoneNumber)) {
                phoneError.textContent = "Invalid phone number.";
                valid = false;
            } else {
                phoneError.textContent = "";
            }

            // If everything is valid, submit the form
            if (valid) {
                window.location.href = '/payment'; // Redirect to payment.jsp
            }
        });
    </script>

    <!-- Bootstrap JS (Optional, for any interactivity like forms, dropdowns) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
