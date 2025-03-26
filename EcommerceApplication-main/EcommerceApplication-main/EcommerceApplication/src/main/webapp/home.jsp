<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Management</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        /* General Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background:  #091057;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0; 
            overflow: hidden;
        }

        /* Header Styling */
        header {
            background:black ;
            color: white;
            padding: 20px;
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            position: fixed;
            top: 0;
            left: 0;
        }

        /* Main Content Layout */
        main {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            height: 100vh;
        }
        
        .container {
            padding: 40px;
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
            animation: fadeIn 1.2s ease;
            text-align: center;
            max-width: 700px;
            width: 100%;
          
        }

        h1 {
            font-family: 'Poppins', sans-serif;
            font-weight: 600;
            font-size: 28px;
            margin-bottom: 30px;
            color: #333;
        }

        /* Form Layout */
        form {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            grid-gap: 20px;
            width: 100%;
            margin-top: 20px;
        }

        /* Button Styling */
        .btn {
            display: inline-block;
            width: 100%;
            padding: 15px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 15px;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            z-index: 1;
            overflow: hidden;
            margin: 10px 0;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2), 0 0 10px rgba(72, 239, 128, 0.4);
        }

        .btn:hover {
            background-color: #45a049;
            transform: scale(1.05);
        }

        .btn.exit {
            background-color: #f44336;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2), 0 0 10px rgba(239, 72, 72, 0.4);
        }

        .btn.exit:hover {
            background-color: #e53935;
            transform: scale(1.05);
        }

        .btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 300%;
            height: 300%;
            background: radial-gradient(circle, rgba(255, 255, 255, 0.3), transparent);
            z-index: 0;
            transition: all 0.4s ease;
            transform: translateX(-150%) translateY(-150%);
        }

        .btn:hover::before {
            transform: translateX(0) translateY(0);
        }

        .btn:after {
            content: '';
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            background: rgba(255, 255, 255, 0.4);
            opacity: 0;
            transform: scale(0);
            transition: all 0.4s ease;
        }

        .btn:active:after {
            opacity: 1;
            transform: scale(1);
        }
		 p.message {
            color: red;
            font-size: 16px;
            margin-bottom: 20px;
        }
        /* Footer Styling */
        footer {
            background:black;
            color: #fff;
            text-align: center;
            padding: 15px 20px;
            font-size: 14px;
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
        }

        footer p {
            margin: 0;
        }

        /* Keyframes for Animations */
        @keyframes fadeIn {
            0% {
                opacity: 0;
                transform: translateY(-50px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Responsive Design */
        @media screen and (max-width: 768px) {
            .container {
                width: 90%;
            }

            .btn {
                width: 100%;
            }

            header {
                font-size: 20px;
            }

            footer {
                font-size: 12px;
            }

            h1 {
                font-size: 24px;
            }
         }
    </style>
</head>
<body>

<header>
    Welcome to the User Management Panel
</header>

<main>
    <div class="container">
        <h1>User Management</h1>
 <% 
        String message = (String) request.getAttribute("message");
        if (message != null) {
            System.out.println(message);%>
            <p class="message"><%=message %><p>
            <%
        }
        String role=(String) application.getAttribute("role");
        %>
        <form action="./userController" method="post">
            <button type="submit" name="action" value="1" class="btn">1. Sign In</button>
            <button type="submit" name="action" value="2" class="btn">2. Log In</button>
            <button type="submit" name="action" value="3" class="btn">3. Show All Users</button>
            <button type="submit" name="action" value="4" class="btn">4. Delete User</button>
            <button type="submit" name="action" value="5" class="btn">5. Update User</button>
            <button type="submit" name="action" value="6" class="btn exit">6. Exit</button>
        </form>
    </div>
</main>

<footer>
    <p>Sid &copy; 2024 User Management System. All rights reserved.</p>
</footer>

</body>
</html>
