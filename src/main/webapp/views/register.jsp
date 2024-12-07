<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Signup</title>
    <link rel="stylesheet" href="styles.css"> 
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            color: #333;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 100%;
            max-width: 400px;
            background: #ffffff;
            margin: 50px auto;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            animation: fadeIn 1s ease-in-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }
        h1 {
            text-align: center;
            color: #6e8efb;
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #444;
        }
        input[type="text"], input[type="email"], input[type="password"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 14px;
        }
        input[type="text"]:focus, input[type="email"]:focus, input[type="password"]:focus {
            border-color: #6e8efb;
            outline: none;
            box-shadow: 0 0 5px rgba(110, 142, 251, 0.5);
        }
        button {
            width: 100%;
            padding: 12px;
            background: #6e8efb;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s ease;
        }
        button:hover {
            background: #a777e3;
        }
        .message {
            text-align: center;
            margin-top: 15px;
            font-size: 14px;
        }
        .message a {
            color: #6e8efb;
            text-decoration: none;
        }
        .message a:hover {
            text-decoration: underline;
        }
        @media (max-width: 500px) {
            .container {
                margin: 20px;
                padding: 20px;
            }
        }
    </style>
    <script>
        // JavaScript function for client-side validation
        function validateForm() {
            let fullName = document.getElementById("fullName").value;
            let email = document.getElementById("email").value;
            let username = document.getElementById("username").value;
            let password = document.getElementById("password").value;
            let phoneNumber = document.getElementById("phoneNumber").value;
            
            // Full Name validation
            if (fullName.length < 2) {
                alert("Full Name should be at least 2 characters long.");
                return false;
            }

            // Email validation (only allow @gmail.com or @kluniversity.in)
            let emailPattern = /^[a-zA-Z0-9._%+-]+@(?:gmail\.com|kluniversity\.in)$/;
            if (!emailPattern.test(email)) {
                alert("Please enter a valid email: either @gmail.com or @kluniversity.in.");
                return false;
            }

            // Username validation
            if (username.length < 3) {
                alert("Username should be at least 3 characters long.");
                return false;
            }

            // Password validation (at least one special character and minimum length)
            let passwordPattern = /.[\W_]./;
            if (password.length < 6 || !passwordPattern.test(password)) {
                alert("Password must be at least 6 characters long and contain at least one special character (e.g., !, @, #, $).");
                return false;
            }

            // Phone Number validation (must be exactly 10 digits)
            let phonePattern = /^\d{10}$/;
            if (!phonePattern.test(phoneNumber)) {
                alert("Phone number must be exactly 10 digits long.");
                return false;
            }

            // If all validations pass, submit the form
            return true;
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>Sign Up</h1>
        <form:form action="${pageContext.request.contextPath}/register" method="post" modelAttribute="user" onsubmit="return validateForm()">
            
            <label>Full Name:</label>
            <form:input path="fullName" id="fullName" required="true" />
            
            <label>Email:</label>
            <form:input path="email" type="email" id="email" required="true" />
            
            <label>Username:</label>
            <form:input path="username" id="username" required="true" />
            
            <label>Password:</label>
            <form:password path="password" id="password" required="true" />
            
            <label>Phone Number:</label>
            <form:input path="phoneNumber" id="phoneNumber" required="true" />
            
            <button type="submit">Sign Up</button>
            <div class="message">
                <p>Already have an account? <a href="${pageContext.request.contextPath}/login">Login</a></p>
            </div>
        </form:form>
    </div>
</body>
</html>