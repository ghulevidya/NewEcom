<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thank You!</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            background-color: #f4f7f6;
            color: #333;
        }
        .container {
            text-align: center;
            padding: 50px;
            margin-top: 50px;
        }
        .thank-you-card {
            background-color: #ffffff;
            border-radius: 8px;
            padding: 40px;
            max-width: 600px;
            margin: 0 auto;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h1 {
            font-size: 2.5rem;
            margin-bottom: 20px;
            color: #4CAF50;
        }
        p {
            font-size: 1.2rem;
            color: #555;
            margin-bottom: 30px;
        }
        .btn {
            background-color: #4CAF50;
            color: white;
            padding: 15px 25px;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
            text-decoration: none;
        }
        .btn:hover {
            background-color: #45a049;
        }
        .footer {
            margin-top: 50px;
            font-size: 0.9rem;
            color: #777;
        }
        .icon {
            width: 50px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="thank-you-card">
        <img src="https://img.icons8.com/ios-filled/100/000000/thank-you.png" alt="Thank You Icon" class="icon">
        <h1>Thank You, <%= session.getAttribute("userName") != null ? session.getAttribute("userName") : "User" %>!</h1>
        <p>We truly appreciate your time with us. Your feedback helps us to serve you better in the future.</p>
        <a href="home.jsp" class="btn">Back to Home</a>
    </div>
    
    <div class="footer">
        <p>Need help? Feel free to <a href="https://github.com/siddheshbalghare">Contact Us</a></p>
    </div>
</div>

</body>
</html>
