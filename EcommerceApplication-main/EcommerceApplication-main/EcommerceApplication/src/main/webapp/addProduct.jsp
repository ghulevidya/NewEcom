<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Product</title>
    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Body Styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f4f7;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }

        /* Container Styling */
        .container {
            width: 100%;
            max-width: 500px;
            padding: 30px;
            background: #ffffff;
            border-radius: 15px;
            box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.1);
            text-align: center;
            animation: fadeIn 1s ease-in-out;
        }

        /* Heading */
        h2 {
            font-size: 24px;
            color: #333;
            margin-bottom: 20px;
        }

        /* Form Styling */
        form {
            width: 100%;
        }

        label {
            display: block;
            font-size: 16px;
            color: #555;
            text-align: left;
            margin-top: 15px;
        }

        input[type="text"], 
        input[type="number"],
        select {
            width: 100%;
            padding: 12px;
            margin-top: 5px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="number"]:focus,
        select:focus {
            border-color: #4CAF50;
            outline: none;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #28a745;
            color: #fff;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
            margin-top: 20px;
        }

        input[type="submit"]:hover {
            background-color: #218838;
            transform: translateY(-2px);
        }

        /* Back to Home Button */
        .btn {
            display: inline-block;
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            color: white;
            text-align: center;
            text-decoration: none;
            border-radius: 8px;
            font-size: 16px;
            margin-top: 20px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .btn:hover {
            background-color: #0056b3;
            transform: translateY(-2px);
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
            .btn {
                font-size: 14px;
            }
        }

        /* Animation */
        @keyframes fadeIn {
            0% {
                opacity: 0;
                transform: translateY(-20px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Add New Product</h2>
        <form action="addProduct" method="post">
            <label for="id">Product ID</label>
            <input type="number" name="ProductId" id="id" required placeholder="Enter product ID">

            <label for="name">Product Name</label>
            <input type="text" name="ProductName" id="name" required placeholder="Enter product name">

            <label for="description">Product Description</label>
            <input type="text" name="ProductDescription" id="description" required placeholder="Enter product description">

            <label for="price">Product Price</label>
            <input type="number" name="ProductPrice" id="price" step="0.01" required placeholder="Enter product price">

            <label for="status">Product Status</label>
            <select name="status" id="status" required>
                <option value="">-- Select Status --</option>
                <option value="Sold">Sold</option>
                <option value="Not Sold">Not Sold</option>
            </select>

            <input type="submit" value="Add Product">
        </form>

        <!-- Back to Home Button -->
        <a href="welcome.jsp" class="btn">Back to Home</a>
    </div>
</body>
</html>
