package JDBC;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.Product;
import entity.User;
import entity.myCart;

public class cartJDBC {
	private Driver driver;
	private Connection connection;
	private PreparedStatement preparedStatement;
	private ResultSet resultSet;
	private String query;
	private productJDBC pdb = new productJDBC();
	private USERjdbc udb = new USERjdbc();

	public String addProduct(myCart cart) {
		String msg = "Something went wrong!";
		try {
			if (isProductInCart(cart)) {
				openConection();
				query = "INSERT INTO cart (product_id, user_id) VALUES (?, ?)";
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setInt(1, cart.getProductId());
				preparedStatement.setInt(2, cart.getUserId());
				preparedStatement.executeUpdate();
				msg = "Product added to your cart!";
			} else {
				msg = "Product already present in cart!";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection();
		}
		return msg;
	}

	public boolean isProductInCart(myCart cart) {
		openConection();
		query = "SELECT * FROM cart WHERE product_id = ? AND user_id = ?";
		boolean res = true;
		try {
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, cart.getProductId());
			preparedStatement.setInt(2, cart.getUserId());
			resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				res = false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConnection();
		}
		return res;
	}

	public List<Product> getCartByUserId(int userId) {
		List<Product> products = new ArrayList<Product>();
		openConection();
		query = "Select * from cart where user_id=?";
		try {
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, userId);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Product product = pdb.findProductById(resultSet.getInt("product_id"));
				products.add(product);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConnection();
		}
		System.out.println(products);
		return products;
	}

	public List<myCart> getAllCart() {
		List<myCart> carts = new ArrayList<>();
		openConection();
		query = "Select * from cart";
		try {
			preparedStatement = connection.prepareStatement(query);

			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				myCart cart = new myCart();
				User user = udb.findUserById(resultSet.getInt("user_id"));
				Product product = pdb.findProductById(resultSet.getInt("product_id"));
				cart.setUserId(user.getId());
				cart.setName(user.getName());
				cart.setProductName(product.getProductName());
				cart.setProductId(product.getProductId());
				cart.setProductDescroption(product.getProductDescription());
				cart.setSold(product.isSold());
				cart.setProductPrice(product.getProductPrice());
				carts.add(cart);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConnection();
		}
		System.out.println(carts);
		return carts;
	}

	public void removeProduct(myCart cart) {
		openConection();
		query = "Delete from CART where product_id=? and user_id=?";
		try {
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, cart.getProductId());
			preparedStatement.setInt(2, cart.getUserId());
			preparedStatement.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConnection();
		}
	}

	public void removeCarts(int id) {
		openConection();
		query = "Delete from CART where  user_id=?";
		try {
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, id);
			preparedStatement.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConnection();
		}
	}

	public void openConection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			driver = new com.mysql.cj.jdbc.Driver();
			DriverManager.registerDriver(driver);
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_app", "root", "root");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

	public void closeConnection() {
		if (preparedStatement != null) {
			try {
				preparedStatement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (connection != null) {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (driver != null) {
			try {
				DriverManager.deregisterDriver(driver);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
