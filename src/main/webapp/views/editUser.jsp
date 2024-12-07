<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit User</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            background: white;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #343a40;
        }
        form label {
            display: block;
            margin: 10px 0 5px;
            font-weight: bold;
        }
        form input, form button {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        form button {
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
        }
        form button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Edit User</h1>
    <form action="${pageContext.request.contextPath}/updateUser" method="POST">
        <input type="hidden" name="userId" value="${user.id}">
        <label for="username">Username:</label>
        <input type="text" name="username" id="username" value="${user.username}" required>

        <label for="email">Email:</label>
        <input type="email" name="email" id="email" value="${user.email}" required>

        <label for="fullName">Full Name:</label>
        <input type="text" name="fullName" id="fullName" value="${user.fullName}" required>

        <label for="phoneNumber">Phone Number:</label>
        <input type="text" name="phoneNumber" id="phoneNumber" value="${user.phoneNumber}" required>

        <button type="submit">Update</button>
    </form>
</div>
</body>
</html>
