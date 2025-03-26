<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Product</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 40%;
            margin: 80px auto;
            padding: 30px;
            background-color: #fff;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 24px;
            color: #333;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
            color: #555;
        }

        input[type="number"] {
            width: 100%;
            padding: 12px;
            margin-top: 8px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 16px;
            outline: none;
            transition: border-color 0.3s ease;
        }

        input[type="number"]:focus {
            border-color: #007bff;
        }

        .button-container {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .btn {
            width: 48%;
            padding: 12px;
            font-size: 16px;
            font-weight: bold;
            text-align: center;
            text-decoration: none;
            border-radius: 6px;
            transition: background-color 0.3s ease, transform 0.2s ease;
            cursor: pointer;
        }

        .btn-delete {
            background-color: #d9534f;
            color: #fff;
            border: none;
        }

        .btn-delete:hover {
            background-color: #c9302c;
            transform: translateY(-2px);
        }

        .btn-home {
            background-color: #007bff;
            color: #fff;
            border: none;
            text-decoration: none;
        }

        .btn-home:hover {
            background-color: #0056b3;
            transform: translateY(-2px);
        }

        .btn:focus {
            outline: none;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Delete Product</h2>
        <form action="deleteProduct" method="post">
            <label for="id">Product ID</label>
            <input type="number" name="id" id="id" required>
            <div class="button-container">
                <a href="welcome.jsp" class="btn btn-home">Home</a>
                <button type="submit" class="btn btn-delete">Delete Product</button>
            </div>
        </form>
    </div>

</body>
</html>
