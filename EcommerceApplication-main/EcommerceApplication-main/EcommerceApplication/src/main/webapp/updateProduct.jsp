<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Product</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: #f7f7f7;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #333;
        }

        .container {
            width: 100%;
            max-width: 600px;
            margin: 20px;
            padding: 30px;
            background-color: #ffffff;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            transition: box-shadow 0.3s ease-in-out;
        }

        .container:hover {
            box-shadow: 0 6px 25px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            font-size: 24px;
            color: #333;
            margin-bottom: 30px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            font-size: 16px;
            margin-bottom: 10px;
            color: #555;
        }

        input[type="text"] {
            padding: 12px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 20px;
            width: 100%;
            background-color: #f9f9f9;
            transition: border-color 0.3s ease-in-out;
        }

        input[type="text"]:focus {
            border-color: #007bff;
            outline: none;
        }

        .button-container {
            display: flex;
            justify-content: space-between;
            gap: 15px;
            margin-top: 20px;
        }

        input[type="submit"], .btn-home {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 14px 22px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            width: 48%;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        input[type="submit"]:hover, .btn-home:hover {
            background-color: #218838;
            transform: scale(1.05);
        }

        .btn-home {
            background-color: #007bff;
            text-align: center;
            text-decoration: none;
        }

        .btn-home:hover {
            background-color: #0056b3;
        }

        .btn-home:active, input[type="submit"]:active {
            transform: scale(1);
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Update Product</h2>
        <form action="updateProduct" method="post">
            <div class="form-group">
                <label for="productId">Enter Product ID:</label>
                <input type="text" id="productId" name="productId" required>
            </div>
            <div class="form-group">
                <div class="button-container">
                    <a href="welcome.jsp" class="btn-home">Back to Home</a>
                    <input type="submit" value="Update Product">
                </div>
            </div>
        </form>
    </div>

</body>
</html>
