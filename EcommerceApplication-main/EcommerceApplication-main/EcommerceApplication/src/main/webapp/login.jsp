<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login Page</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
    rel="stylesheet">
<style>
/* Body Styling */
body {
    background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
    font-family: 'Roboto', sans-serif;
    color: #fff;
    height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0;
}

/* Login Card */
.card {
    background: #ffffff;
    border-radius: 15px;
    padding: 40px 30px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
    color: #333;
    width: 100%;
    max-width: 450px; /* Increased width */
    transition: all 0.3s ease;
}

.card:hover {
    transform: translateY(-10px);
    box-shadow: 0 15px 25px rgba(0, 0, 0, 0.4);
}

/* Heading */
h3 {
    font-size: 28px;
    font-weight: bold;
    margin-bottom: 20px;
    color: #007bff;
    text-transform: uppercase;
}

/* Input Fields */
.form-control {
    border-radius: 12px;
    height: 50px;
    border: 1px solid #ddd;
    box-shadow: inset 0 2px 5px rgba(0, 0, 0, 0.1);
    font-size: 14px;
    transition: border-color 0.3s ease, box-shadow 0.3s ease;
}

.form-control:focus {
    border-color: #6a11cb;
    box-shadow: 0 0 8px rgba(106, 17, 203, 0.2);
}

/* Buttons */
.btn-login {
    background: linear-gradient(135deg, #6a11cb, #2575fc);
    border: none;
    border-radius: 12px;
    padding: 14px 25px;
    color: #fff;
    font-weight: bold;
    font-size: 16px;
    text-transform: uppercase;
    transition: all 0.3s ease;
    width: 48%; /* Adjusted width */
}

.btn-login:hover {
    background-color: #2575fc;
    color: white;
    box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
}

/* Hyperlink Styling */
a.text-secondary {
    color: #6a11cb;
    text-decoration: none;
    font-weight: 500;
    transition: color 0.3s ease;
}

a.text-secondary:hover {
    color: #2575fc;
    text-decoration: underline;
}

/* Centering */
.login-container {
    width: 100%;
    max-width: 450px;
    margin: auto;
}
.message{
color: red;
 font-weight: 500;
 text-align:center;
  transition: color 0.3s ease;
}
/* Spacing for Forgot Password Link */
.text-center.mt-3 {
    margin-top: 15px;
}

/* Flexbox for button alignment */
.d-flex.justify-content-between {
    gap: 4%; /* Add spacing between buttons */
}
</style>
</head>
<body>

    <div class="login-container">
        <div class="card">
        <% 
        String message = (String) request.getAttribute("message");
        if (message != null) {
            out.println("<p class='message'>" + message + "</p>");
        } %>
            <h3 class="text-center mb-4">Login</h3>
            <form action="loginUser" method="post">
                <div class="mb-3">
                    <label for="email" class="form-label">Email Address</label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
                </div>
                <div class="d-flex justify-content-between mt-4">
                    <a href="home.jsp" class="btn btn-login">Back to Home</a>
                    <button type="submit" class="btn btn-login">Login</button>
                </div>
                <div class="text-center mt-3">
                    <a href="./editPass.jsp" class="text-secondary">Forgot Password?</a>
                </div>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS (optional) -->
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
