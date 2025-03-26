<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add User</title>
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

input[type="text"], input[type="email"], input[type="password"], input[type="number"],
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

input[type="text"]:focus, input[type="email"]:focus, input[type="password"]:focus,
input[type="number"]:focus, select:focus {
    border-color: #74ebd5;
    background-color: #fff;
}

.buttons {
    display: flex;
    gap: 15px;
    margin-top: 20px;
}

input[type="submit"] {
    flex: 1;
    padding: 12px;
    background-color: #74ebd5;
    color: white;
    font-size: 16px;
    font-weight: bold;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

input[type="submit"]:hover {
    background-color: #56c9ca;
}

a.btn {
    flex: 1;
    padding: 12px;
    background-color: #007bff;
    color: white;
    text-align: center;
    text-decoration: none;
    border-radius: 8px;
    font-size: 16px;
    transition: background-color 0.3s ease, transform 0.3s ease;
    cursor: pointer;
}

a.btn:hover {
    background-color: #0056b3;
    transform: translateY(-2px);
}

@keyframes fadeIn {
    from { opacity: 0; }
    to { opacity: 1; }
}
</style>
</head>
<body>

<div class="container">
    <h2>Add New User</h2>
    <form action="./addUser" method="post">
    
        <label for="id">User ID:</label>
        <input type="number" id="id" name="id" placeholder="Enter User ID" required>
        
        <label for="name">User Name:</label>
        <input type="text" id="name" name="name" placeholder="Enter User Name" required>
        
        <label for="email">User Email:</label>
        <input type="email" id="email" name="email" placeholder="Enter User Email" title="Please enter a valid Gmail address" required>
        <label for="mobile">User Mobile:</label>
        <input type="number" id="mobile" name="mobile" placeholder="Enter User Mobile" required>
        
        <label for="password">User Password:</label>
        <input type="password" id="password" name="password" placeholder="Enter Password" required>
        
        <label for="role">User Role:</label>
        <select id="role" name="role" required>
            <option value="">Select Role</option>
            <option value="seller">Seller</option>
            <option value="buyer">Buyer</option>
        </select>
        
        <div class="buttons">
            <a href="home.jsp" class="btn">Back to Home</a>
            <input type="submit" value="Add User">
        </div>
    </form>
</div>

</body>
</html>
