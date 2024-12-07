<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
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
        .login-section {
            width: 350px;
            padding: 30px 20px;
            background-color: rgba(255, 255, 255, 0.95); /* Light white with transparency */
            border-radius: 10px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
            text-align: center;
        }
        .login-section h2 {
            margin-bottom: 20px;
            font-size: 24px;
            color: #333; /* Darker text for contrast */
        }
        .login-section label {
            display: block;
            text-align: left;
            margin: 10px 0 5px;
            font-size: 14px;
            color: #555;
        }
        .login-section input {
            width: 90%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            background-color: rgba(255, 255, 255, 0.9);
        }
        .login-section input:focus {
            border-color: #007BFF;
            outline: none;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }
        .login-section button {
            width: 20%;
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
        .login-section button:hover {
            background-color: #0056b3;
        }
        .login-section p {
            margin-top: 10px;
            font-size: 14px;
            color: #555;
        }
        .login-section a {
            color: #007BFF;
            text-decoration: none;
            font-weight: bold;
        }
        .login-section a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="login-section">
        <h2>Login</h2>
        <c:if test="${not empty message}">
            <p>${message}</p>
        </c:if>
        <c:if test="${not empty error}">
            <p style="color:red;">${error}</p>
        </c:if>
        
        <form action="${pageContext.request.contextPath}/login" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required />
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required />
            <button type="submit">Login</button>
            <p>Don't have an account? <a href="${pageContext.request.contextPath}/register">Sign up</a></p>
            <p>Forgot your password? <a href="${pageContext.request.contextPath}/forgotPassword">Click here</a></p>
        </form>
    </div>
</body>
</html>
