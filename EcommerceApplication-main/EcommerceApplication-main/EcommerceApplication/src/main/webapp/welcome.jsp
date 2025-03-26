<%@page import="entity.User"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to the eCommerce Platform</title>
    <style>
        body {
            font-family: 'Roboto', Arial, sans-serif;
            background-color: #f8f9fc;
            margin: 0;
            padding: 0;
            color: #333;
            height:100vh;
            display:flex;
            
            flex-direction: column;
            justify-content: space-between;
            
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        /* Header */
        header {
            background-color: #007bff;
            color: #fff;
            padding: 20px;
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            letter-spacing: 1px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        /* Main Content */
        main {
            padding: 45px 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        h1 {
            font-size: 28px;
            text-transform: capitalize;
            margin-bottom: 20px;
            color: deeppink;
            font-weight: 700;
        }

        /* Menu Box */
        .menu {
            padding: 40px;
            background-color: #fff;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
            border-radius: 12px;
            max-width: 600px;
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .menu:hover {
            transform: scale(1.03);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }

        p.message {
            color: green;
            font-size: 16px;
            margin-bottom: 20px;
        }

        /* Grid Layout for Buttons */
        ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 15px;
            margin-top: 20px;
        }

        ul li {
            margin: 0;
        }

        /* Button Styles */
        ul li a {
            display: block;
            background-color: #007bff;
            color: white;
            padding: 15px 25px;
            border-radius: 6px;
            font-size: 16px;
            font-weight: 500;
            transition: background-color 0.3s ease, transform 0.2s ease;
            text-align: center;
        }

        ul li a:hover {
            background-color: #0056b3;
            transform: translateY(-3px);
        }

        /* Footer */
        footer {
            background-color: #343a40;
            color: #fff;
            text-align: center;
            padding: 15px 20px;
            font-size: 14px;
            margin-top: 50px;
        }

        footer p {
            margin: 0;
        }

        /* Responsive Design */
        @media screen and (max-width: 768px) {
            .menu {
                padding: 30px;
                width: 90%;
            }

            ul {
                grid-template-columns: repeat(2, 1fr);
            }

            ul li a {
                font-size: 14px;
                padding: 12px 18px;
            }

            h1 {
                font-size: 24px;
            }
        }

        @media screen and (max-width: 480px) {
            header {
                font-size: 20px;
                padding: 15px;
            }

            .menu {
                padding: 20px;
                width: 100%;
            }

            ul {
                grid-template-columns: 1fr;
            }

            h1 {
                font-size: 20px;
            }
        }
    </style>
</head>
<body>

<header>
    Welcome to the eCommerce Platform
</header>

<main>
    <div class="menu">
        <% 
        String message = (String) request.getAttribute("message");
        if (message != null) {
            System.out.println(message); %>
            <p class="message"><%=message %></p>
            <%
        }
        User user=(User) application.getAttribute("user");
    	String role = user.getRole();
        %>
        <h1>Welcome, <%=role %></h1>
       
        <ul>
        <%
        if (role.equalsIgnoreCase("seller")) {
        %>
            <li><a href="addProduct.jsp">Add Product</a></li>
            <li><a href="products.jsp">Show All Products</a></li>
            <li><a href="deleteProduct.jsp">Remove Product</a></li>
            <li><a href="updateProduct.jsp">Update Product</a></li>
             <li><a href="myCart.jsp">Cart</a></li>
            <li><a href="home.jsp">Exit</a></li>
        <%
        } else if (role.equalsIgnoreCase("buyer")) {
        %>
            <li><a href="products.jsp">Show All Products</a></li>
            <li><a href="myCart.jsp">myCart</a></li>
            <li><a href="home.jsp">Exit</a></li>
        <%
        }
        %>
        </ul>
    </div>
</main>

<footer>
    <p>Sid &copy; 2024 eCommerce Platform. All rights reserved.</p>
</footer>

</body>
</html>
