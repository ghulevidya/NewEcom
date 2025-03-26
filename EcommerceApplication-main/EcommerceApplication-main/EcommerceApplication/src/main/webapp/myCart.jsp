<%@page import="entity.myCart"%>
<%@page import="entity.Product"%>
<%@page import="entity.User"%>
<%@page import="JDBC.productJDBC"%>
<%@page import="JDBC.cartJDBC"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>My Cart</title>
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

	<%!productJDBC productDb = new productJDBC();%>
	<%!cartJDBC cartDb = new cartJDBC();%>
	<%
	User user = (User) application.getAttribute("user");
	String role = user.getRole();
	int userId = user.getId();
	cartJDBC cart = new cartJDBC();
	List<Product> cartProducts=null;
	List<myCart> allCartProduct=null;
	if (role.equalsIgnoreCase("buyer")) {
		 cartProducts = cart.getCartByUserId(userId);
	} else {
		 allCartProduct = cart.getAllCart();
	}
	%>

	<div class="container">
		<%
		if (role.equalsIgnoreCase("buyer")) {
		%>
		<h2>My Cart</h2>
		<%
		} else {
		%>
		<h2>All Cart</h2>
		<%
		}
		%>
		<table>
			<thead>
				<tr>
					<%
					if (role.equalsIgnoreCase("seller")) {
					%>
					<th>User ID</th>
					<th>User Name</th>

					<%
					}
					%>

					<th>Product ID</th>
					<th>Product Name</th>
					<th>Description</th>
					<th>Price</th>
					<%
					if (role.equalsIgnoreCase("buyer")) {
					%>
					<th>Actions</th>
					<%
					}
					%>
				</tr>
			</thead>
			<tbody>
				<%
				if (role.equalsIgnoreCase("buyer")) {
					if (cartProducts.size() > 0) {
						for (Product product : cartProducts) {
				%>
				<tr>
					<td><%=product.getProductId() %></td>
					<td><%=product.getProductName() %></td>
					<td><%=product.getProductDescription()%></td>
					<td><%=product.getProductPrice()%></td>
					<td>
						<form action="./removeFromCart" method="post"
							style="display: inline;">
							<input type="hidden" name="productId"
								value="<%=product.getProductId() %>"> <input
								type="hidden" name="userId" value="<%=userId %>">
							<button type="submit" class="btn">Remove</button>
						</form>
					</td>
				</tr>
				<%
				}
				} else {
				%>

				<tr>
					<td colspan="5" style="text-align: center;">Your cart is
						empty.</td>
				</tr>
				<%
				}
				} else {
				
				if (allCartProduct.size() > 0) 
				{ 
				for (myCart cartp : allCartProduct)
					{ %>
				<tr>
					<td><%=cartp.getUserId()%></td>
					<td><%=cartp.getName()%></td>
					<td><%=cartp.getProductId()%></td>
					<td><%=cartp.getProductName()%></td>
					<td><%=cartp.getProductDescroption()%></td>
					<td><%=cartp.getProductPrice()%></td>
				</tr>
				<%
				}
				} else {
				%>

				<tr>
					<td colspan="6" style="text-align: center;">Your cart is
						empty.</td>
				</tr>
				<%
				}
				}
				%>
			</tbody>
		</table>

		<div class="btn-container">
			<%
			if(role.equalsIgnoreCase("buyer"))
			{
			%>
			<a href="checkout.jsp" class="btn">Proceed to Checkout</a> <a
				href="welcome.jsp" class="btn">Home</a>
			<%
			}else
			{
			%>
			<a href="welcome.jsp" class="btn">Home</a>
			<%
			}
			%>
		</div>
	</div>
</body>
</html>
