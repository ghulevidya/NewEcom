<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Enter User ID</title>
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
	padding: 20px;
	text-align: center;
}

.form-container {
	width: 300px;
	margin: 100px auto;
	padding: 20px;
	background-color: #fff;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
}

h1 {
	color: #333;
	margin-bottom: 20px;
}

input[type="number"] {
	width: 100%;
	padding: 10px;
	margin-bottom: 20px;
	border: 1px solid #ddd;
	border-radius: 4px;
	font-size: 16px;
}

button {
	width: 100%;
	padding: 10px;
	background-color: #4CAF50;
	color: white;
	border: none;
	border-radius: 4px;
	font-size: 16px;
	cursor: pointer;
	margin-top: 10px;
}

button:hover {
	background-color: #45a049;
}

a.home-btn {
	display: block;
	width: 100%;
	padding: 10px;
	background-color: #007bff;
	color: white;
	border-radius: 4px;
	text-decoration: none;
	font-size: 16px;
	margin-top: 10px;
	cursor: pointer;
}

a.home-btn:hover {
	background-color: #0056b3;
}

.error {
	color: red;
	margin-top: 20px;
}
</style>
</head>
<body>
	<% 
	String url=(String)request.getAttribute("url");
	%>
	<div class="form-container">
		<h1>Enter User ID</h1>
		<form action="./updateUser" method="post">
			<input type="number" name="id" placeholder="Enter your User ID"
				required>
			<button type="submit">Proceed</button>
		</form>
		<a href="home.jsp" class="home-btn">Back to Home</a>
	</div>

</body>
</html>
