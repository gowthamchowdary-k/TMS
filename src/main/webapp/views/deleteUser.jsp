<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete User</title>
    <style>
        /* Basic styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            text-align: center;
            padding: 50px;
        }
        .message {
            font-size: 18px;
            color: green;
            margin-bottom: 20px;
        }
        .error {
            font-size: 18px;
            color: red;
            margin-bottom: 20px;
        }
        .button {
            background-color: #2c3e50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
        }
        .button:hover {
            background-color: #34495e;
        }
    </style>
</head>
<body>

    <c:choose>
        <c:when test="${not empty user}">
            <!-- Success message if the user is deleted -->
            <div class="message">User with ID ${user.id} has been successfully deleted.</div>
            <a href="${pageContext.request.contextPath}/manageUsers" class="button">Go Back to Manage Users</a>
        </c:when>
        <c:otherwise>
            <!-- Error message if the user does not exist -->
            <div class="error">Error: User not found!</div>
            <a href="${pageContext.request.contextPath}/manageUsers" class="button">Go Back to Manage Users</a>
        </c:otherwise>
    </c:choose>

</body>
</html>
