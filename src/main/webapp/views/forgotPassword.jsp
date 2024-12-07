<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Forgot Password</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('../images/pro3.png'); /* Update the path if necessary */
            background-size: cover;
            background-position: center;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
        }
        .forgot-password-section {
            width: 350px;
            padding: 30px 20px;
            background-color: rgba(255, 255, 255, 0.95);
            border-radius: 10px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
            text-align: center;
        }
        .forgot-password-section h2 {
            margin-bottom: 20px;
            font-size: 24px;
            color: #333;
        }
        .forgot-password-section label {
            display: block;
            text-align: left;
            margin: 10px 0 5px;
            font-size: 14px;
            color: #555;
        }
        .forgot-password-section input {
            width: 90%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }
        .forgot-password-section input:focus {
            border-color: #007BFF;
            outline: none;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }
        .forgot-password-section button {
            width: 50%;
            padding: 12px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .forgot-password-section button:hover {
            background-color: #0056b3;
        }
        .error {
            color: red;
            font-size: 14px;
        }
        
        .success {
            color: green;
            font-size: 14px;
        }
    </style>
    <script>
        function validateForm() {
            const newPassword = document.getElementById("newPassword").value;
            const confirmPassword = document.getElementById("confirmPassword").value;
            const errorDiv = document.getElementById("error-message");

            if (newPassword !== confirmPassword) {
                errorDiv.textContent = "New password and confirm password are not same!";
                return false; // Prevent form submission
            }

            errorDiv.textContent = ""; // Clear the error message
            return true; // Allow form submission
        }
    </script>
</head>
<body>
    <div class="forgot-password-section">
        <h2>Forgot Password</h2>
        <form action="${pageContext.request.contextPath}/resetPassword" method="post" onsubmit="return validateForm()">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required />
            
            <label for="newPassword">New Password:</label>
            <input type="password" id="newPassword" name="newPassword" required />
            
            <label for="confirmPassword">Confirm Password:</label>
            <input type="password" id="confirmPassword" name="confirmPassword" required />
            
            <div id="error-message" class="error">
                <c:if test="${not empty error}">
                    ${error}
                </c:if>
            </div>
            
            <div class="success">
                <c:if test="${not empty message}">
                    ${message}
                </c:if>
            </div>

            <button type="submit">Reset Password</button>
        </form>
    </div>
</body>
</html>
