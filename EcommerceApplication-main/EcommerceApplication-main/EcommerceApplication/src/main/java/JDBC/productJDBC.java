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

public class productJDBC {
	private Driver driver;
	private Connection connection;
	private PreparedStatement preparedStatement;
	private ResultSet resultSet;
	private String query;
	private Product product;

	public void addProduct(Product product) {
		openConection();
		query = "INSERT INTO PRODUCT VALUES(?,?,?,?,?)";
		try {

			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, product.getProductId());
			preparedStatement.setString(2, product.getProductName());
			preparedStatement.setString(3, product.getProductDescription());
			preparedStatement.setDouble(4, product.getProductPrice());
			preparedStatement.setString(5, product.isSold());
			preparedStatement.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConnection();
		}
	}

	public List<Product> showProduct() {
		openConection();
		List<Product> products = new ArrayList<Product>();
		query = "Select * from Product";
		System.out.println(2);
		try {
			preparedStatement = connection.prepareStatement(query);
			int count = 0;
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Product product = new Product();
				product.setProductId(resultSet.getInt("ProductId"));
				product.setProductName(resultSet.getString("ProductName"));
				product.setProductDescription(resultSet.getString("ProductDescription"));
				product.setProductPrice(resultSet.getDouble("ProductPrice"));
				product.setSold(resultSet.getString("status"));
				System.out.println(resultSet.getInt("ProductId") + "|" + resultSet.getString("ProductName") + "|"
						+ resultSet.getString("ProductDescription") + "|" + resultSet.getDouble("ProductPrice") + "|"
						+ resultSet.getString("status"));
				products.add(product);
				count++;
			}
			if (count != 0) {
				System.out.println("Products Found");
			} else {
				System.err.println("Products Not Found");
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			closeConnection();
		}
		return products;

	}

	public String removeProduct(int id) {
		openConection();
		query = "Delete from Product where ProductID=?";
		String message = null;
		try {
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, id);
			int res = preparedStatement.executeUpdate();
			if (res != 0) {
				message="Product is Deleted!";
			} else {
				message="Product Not Found!";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return message;
	}
	
	
	public Product findProductById(int id) {
		openConection();
		query = "Select * from product where ProductId=?";
		Product product = new Product();
		try {
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, id);
			resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				product.setProductId(resultSet.getInt("ProductId"));
				product.setProductName(resultSet.getString("ProductName"));
				product.setProductDescription(resultSet.getString("ProductDescription"));
				product.setProductPrice(resultSet.getDouble("ProductPrice"));
				product.setSold(resultSet.getString("status"));
			} else {
				product = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConnection();
		}
		return product;
	}

	public String updateProduct(int id, String name, String desc, double price, String status) {
		openConection();
		query = "UPDATE Product set ProductId=?,ProductName=?,ProductDescription=?,ProductPrice=?,status=? where ProductID=?";
		int res = 0;
		try {
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(6, id);
			System.out.println("Enter New Product id");
			int id1 = id;
			preparedStatement.setInt(1, id1);
			System.out.println("Enter New Product Name");
			String pname = name;
			preparedStatement.setString(2, pname);
			System.out.println("Enter New Product Description");
			String pdesc = desc;
			preparedStatement.setString(3, pdesc);
			System.out.println("Enter New Product Price");
			double price1 = price;
			preparedStatement.setDouble(4, price);
			System.out.println("Enter New Product Status");

			String pstatus = status;
			preparedStatement.setString(5, status);

			res = preparedStatement.executeUpdate();
			product = new Product(id1, pname, pdesc, price1, pstatus);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConnection();
		}
		if (res != 0) {

			String message = product.getProductName() + " is Updated";
			return message;
		} else {
			String message = "Invalid input please enter valid input";
			return message;
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
