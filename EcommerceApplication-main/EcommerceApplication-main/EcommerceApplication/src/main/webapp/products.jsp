<%@page import="entity.Product"%>
<%@page import="entity.User"%>
<%@page import="JDBC.productJDBC"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Product List</title>
<style>
body {
	font-family: 'Arial', sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
}

.container {
	width: 80%;
	margin: 50px auto;
	background-color: #fff;
	padding: 20px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h2 {
	text-align: center;
	margin-bottom: 20px;
	color: #333;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}

th, td {
	padding: 10px;
	border: 1px solid #ddd;
	text-align: center;
}

th {
	background-color: #4CAF50;
	color: white;
}

td {
	background-color: #f9f9f9;
}

tr:nth-child(even) td {
	background-color: #f2f2f2;
}

tr:hover td {
	background-color: #d1e7dd;
}

.btn-container {
	text-align: center;
	margin-top: 20px;
}

.btn {
	display: inline-block;
	width: 150px;
	padding: 10px;
	margin: 5px;
	text-align: center;
	background-color: #4CAF50;
	color: white;
	border: none;
	border-radius: 4px;
	text-decoration: none;
	font-size: 14px;
}

.btn:hover {
	background-color: #45a049;
}

.not-found {
	text-align: center;
	margin: 20px 0;
}

.not-found p {
	color: red;
	font-size: 18px;
}
</style>
</head>
<body>

	<%!productJDBC ob = new productJDBC();%>
	<%
	User user=(User) application.getAttribute("user");
	String role = user.getRole();

	List<Product> products = ob.showProduct();
	%>
	<div class="container">
		<h2>Available Products</h2>
		<table>
			<thead>
				<tr>
					<th>Product ID</th>
					<th>Product Name</th>
					<th>Description</th>
					<th>Price</th>
					<th>Status</th>
					<%
					if (role.equalsIgnoreCase("buyer")) {
					%>
					<th>Action</th>
					<%
					}
					%>
				</tr>
			</thead>
			<tbody>
				<%
				if (products.size() > 0) {
					for (Product product : products) {
				%>
				<tr>
					<td><%=product.getProductId()%></td>
					<td><%=product.getProductName()%></td>
					<td><%=product.getProductDescription()%></td>
					<td><%=product.getProductPrice()%></td>
					<td><%=product.isSold()%></td>
					<%
					if (role.equalsIgnoreCase("buyer")) {
					%>
					<td>
						<form action="./AddToCart" method="post">
							<input type="hidden" name="productId"
								value="<%=product.getProductId()%>" />
							<input type="hidden" name="userId"
								value="<%=user.getId()%>" />
							<button type="submit" class="btn">Add to Cart</button>
						</form>
					</td>
					<%
					}
					%>
				</tr>
				<%
				}
				} else {
				%>
				<tr>
					<td colspan="5" style="text-align: center;">No products found.</td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>

		<div class="btn-container">
			<%
			if (role.equalsIgnoreCase("seller")) {
			%>
			<a href="addProduct.jsp" class="btn">Add Product</a> <a
				href="deleteProduct.jsp" class="btn">Remove Product</a> <a
				href="updateProduct.jsp" class="btn">Update Product</a> <a
				href="welcome.jsp" class="btn">Home</a>
			<%
			} else if (role.equalsIgnoreCase("buyer")) {
			%>

			<a href="welcome.jsp" class="btn">Home</a>

			<%
			}
			%>
		</div>
	</div>
</body>
</html>
