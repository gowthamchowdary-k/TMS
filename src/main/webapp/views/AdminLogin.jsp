<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <style>
        /* Body styles */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background: pink; /* Beautiful gradient background */
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            background-attachment: fixed;
        }

        /* Login container styles */
        .login-section {
            width: 380px;
            padding: 40px;
            background-color: rgba(0, 0, 0, 0.8); /* Darker background for form */
            border-radius: 12px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        /* Hover effect for form */
        .login-section:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.3);
        }

        /* Heading styles */
        .login-section h2 {
            font-size: 30px;
            margin-bottom: 20px;
            color: #ffffff;
            font-weight: 600;
            text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.5);
        }

        /* Label styles */
        .login-section label {
            display: block;
            text-align: left;
            margin: 15px 0 5px;
            font-size: 14px;
            color: #ddd;
        }

        /* Input fields styling */
        .login-section input {
            width: 100%;
            padding: 14px;
            margin-bottom: 20px;
            border: 2px solid #f06292; /* Pink border */
            border-radius: 10px;
            font-size: 14px;
            background-color: rgba(255, 255, 255, 0.2);
            color: white;
            box-sizing: border-box;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        /* Focus effect on inputs */
        .login-section input:focus {
            border-color: #ff4081; /* Focus border color */
            outline: none;
            box-shadow: 0 0 10px rgba(255, 64, 129, 0.7); /* Focus shadow */
        }

        /* Button styling */
        .login-section button {
            width: 100%;
            padding: 16px;
            background-color: #ff4081; /* Vibrant pink */
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        /* Button hover effect */
        .login-section button:hover {
            background-color: #d81b60; /* Darker pink on hover */
            transform: scale(1.05); /* Slight scale on hover */
        }

        /* Error and success message styling */
        .error-message {
            color: #ff1744; /* Red color for errors */
            font-size: 14px;
            margin-top: 15px;
        }

        .success-message {
            color: #00e676; /* Green color for success */
            font-size: 14px;
            margin-top: 15px;
        }

        /* Footer and additional text styling */
        .login-section p {
            margin-top: 20px;
            font-size: 14px;
            color: #ddd;
        }

        .login-section a {
            color: #ff4081;
            text-decoration: none;
            font-weight: bold;
            transition: text-decoration 0.3s ease;
        }

        .login-section a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="login-section">
        <h2>Admin Login</h2>

        <!-- Error or success message display -->
        <c:if test="${not empty message}">
            <p class="success-message">${message}</p>
        </c:if>
        <c:if test="${not empty error}">
            <p class="error-message">${error}</p> <!-- Display error message -->
        </c:if>

        <!-- Login Form -->
        <form action="${pageContext.request.contextPath}/adminLogin" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" placeholder="Enter your username" required />

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="Enter your password" required />

            <button type="submit">Login</button>
        </form>
        
        <p>Not an admin? <a href="${pageContext.request.contextPath}/login">Return to User Login</a></p>

        
    </div>
</body>
</html>
