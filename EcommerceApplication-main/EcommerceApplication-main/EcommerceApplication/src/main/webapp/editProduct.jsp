<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="entity.Product"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Product</title>
    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Body Styling */
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(to right, #74ebd5, #ACB6E5);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* Container Styling */
        .container {
            background-color: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            width: 100%;
            animation: fadeIn 1s ease-in-out;
        }

        /* Heading */
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
            font-size: 24px;
            font-weight: bold;
        }

        /* Label Styling */
        label {
            display: block;
            margin-bottom: 8px;
            color: #666;
            font-size: 14px;
            font-weight: 500;
        }

        /* Input Fields Styling */
        input[type="text"], 
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
        input[type="number"]:focus,
        select:focus {
            border-color: #74ebd5;
            background-color: #fff;
        }

        /* Submit Button Styling */
        input[type="submit"] {
            width: 48%;
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

        /* Back Button Styling */
        .back-btn {
            width: 48%;
            padding: 12px;
            background-color: #007bff;
            color: white;
            text-align: center;
            text-decoration: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .back-btn:hover {
            background-color: #0056b3;
        }

        /* Buttons Container */
        .button-container {
            display: flex;
            justify-content: space-between;
            gap: 10px;
            margin-top: 20px;
        }

        /* Fade In Animation */
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        /* Responsive Styling */
        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }

            h2 {
                font-size: 20px;
            }

            input[type="text"],
            input[type="number"],
            select,
            input[type="submit"],
            .back-btn {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <%
        Product product = (Product) request.getAttribute("product");
    %>
    <div class="container">
        <h2>Update Product</h2>
        <form action="./saveProduct" method="post">
            <label for="id">Product ID:</label>
            <input type="number" id="id" name="productId" value="<%= product.getProductId() %>" readonly>

            <label for="name">Product Name:</label>
            <input type="text" id="name" name="productName" value="<%= product.getProductName() %>" required>

            <label for="description">Product Description:</label>
            <input type="text" id="description" name="productDescription" value="<%= product.getProductDescription() %>" required>

            <label for="price">Product Price:</label>
            <input type="number" id="price" name="productPrice" value="<%= product.getProductPrice() %>" step="0.01" required>

            <label for="status">Product Status:</label>
            <select name="status" id="status" required>
                <option value="Sold" <%= product.isSold().equalsIgnoreCase("sold") ? "selected" : "" %>>Sold</option>
                <option value="Not Sold" <%= product.isSold().equalsIgnoreCase("not sold") ? "selected" : "" %>>Not Sold</option>
            </select>

            <div class="button-container">
                <a href="welcome.jsp" class="back-btn">Back to Home</a>
                <input type="submit" value="Update Product">
            </div>
        </form>
    </div>
</body>
</html>
