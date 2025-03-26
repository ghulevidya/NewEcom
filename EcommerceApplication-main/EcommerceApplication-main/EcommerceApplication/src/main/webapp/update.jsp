<%@page import="entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update User</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(to right, #74ebd5, #ACB6E5);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            width: 100%;
            animation: fadeIn 1s ease-in-out;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
            font-size: 24px;
            font-weight: bold;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #666;
            font-size: 14px;
            font-weight: 500;
        }

        input[type="text"], 
        input[type="email"], 
        input[type="password"], 
        input[type="number"], 
        select {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 14px;
            color: #333;
            background-color: #f9f9f9;
            transition: all 0.3s ease;
        }

        input[type="text"]:focus, 
        input[type="email"]:focus, 
        input[type="password"]:focus, 
        input[type="number"]:focus, 
        select:focus {
            border-color: #74ebd5;
            background-color: #fff;
        }

        .btn-group {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .btn {
            width: 48%;
            padding: 12px;
            background-color: #74ebd5;
            color: white;
            font-size: 16px;
            font-weight: bold;
            text-align: center;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            text-decoration: none;
            display: inline-block;
        }

        .btn:hover {
            background-color: #56c9ca;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
    </style>
</head>
<body>
<%
User user = (User) request.getAttribute("user");
%>
    <div class="container">
        <h2>Update User</h2>
        <form action="./updateNewUser" method="post">
            <label for="id">User ID:</label>
            <input type="number" id="id" name="id" value="<%= user.getId()%>" readonly>

            <label for="name">User Name:</label>
            <input type="text" id="name" name="name" placeholder="<%= user.getName() %>" required>

            <label for="email">User Email:</label>
            <input type="email" id="email" name="email" placeholder="<%= user.getEmail() %>" title="Please enter a valid email address" required>

            <label for="mobile">User Mobile:</label>
            <input type="number" id="mobile" name="mobile" placeholder="<%= user.getMobile() %>" required>

            <label for="password">User Password:</label>
            <input type="password" id="password" name="password" placeholder="Enter new password" required>

            <label for="role">User Role:</label>
            <select id="role" name="role" required>
                <option value="">Select Role</option>
                <option value="seller" <%= user.getRole().equals("seller") ? "selected" : "" %>>Seller</option>
                <option value="buyer" <%= user.getRole().equals("buyer") ? "selected" : "" %>>Buyer</option>
            </select>

            <div class="btn-group">
                <a href="home.jsp" class="btn">Back to Home</a>
                <button type="submit" class="btn">Update User</button>
            </div>
        </form>
    </div>
</body>
</html>
