package JDBC;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.User;

public class USERjdbc {
	private Driver driver;
	private Connection connection;
	private PreparedStatement preparedStatement;
	private ResultSet resultSet;
	private String query;

	public int addUser(User user) {
		openConection();
		int res=0;
		query = "INSERT INTO USER VALUES(?,?,?,?,?,?)";
		try {
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, user.getId());
			preparedStatement.setString(2, user.getName());
			preparedStatement.setString(3, user.getEmail());
			preparedStatement.setLong(4, user.getMobile());
			preparedStatement.setString(5, user.getPassword());
			preparedStatement.setString(6, user.getRole());
			preparedStatement.execute();
		} catch (SQLException e) {
			res=1;
//			e.printStackTrace();
		} finally {
			closeConnection();
		}
		return res;

	}

	public List<User> showUser() {
		List<User> users = new ArrayList<User>();
		openConection();
		query = "SELECT * FROM USER";
		try {
			preparedStatement = connection.prepareStatement(query);
			int count = 0;
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				User user = new User();
				user.setId(resultSet.getInt("id"));
				user.setName(resultSet.getString("name"));
				user.setEmail(resultSet.getString("email"));
				user.setMobile(resultSet.getLong("mobile"));
				user.setPassword(resultSet.getString("password"));
				user.setRole(resultSet.getString("role"));
				users.add(user);
				count++;
				System.out.println(resultSet.getInt("id") + "|" + resultSet.getString("name") + "|"
						+ resultSet.getString("email") + "|" + resultSet.getLong("mobile") + "|"
						+ resultSet.getString("password") + "|" + resultSet.getString("role"));
			}
			if (count != 0) {
				System.out.println("User Found");
			} else {
				System.err.println("User Not Found");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConnection();
		}
		return users;
	}

	public User loginUser(String email, String password) {
		openConection();

		query = "SELECT * from user where email=? and password=?";
		User user=null;
		
		try {
			preparedStatement = connection.prepareStatement(query);
			int count = 0;
			preparedStatement.setString(1, email);
			preparedStatement.setString(2, password);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				count++;
				user =new User();
				user.setId(resultSet.getInt("id"));
				user.setName(resultSet.getString("name"));
				user.setEmail(resultSet.getString("email"));
				user.setMobile(resultSet.getLong("mobile"));
				user.setPassword(resultSet.getString("password"));
				user.setRole(resultSet.getString("role"));
				System.out.println(resultSet.getInt("id") + "|" + resultSet.getString("name") + "|"
						+ resultSet.getString("email") + "|" + resultSet.getLong("mobile") + "|"
						+ resultSet.getString("password") + "|" + resultSet.getString("role"));
				if (resultSet.getString("role").equalsIgnoreCase("Seller")) {
					System.out.println("Hello Seller '" + resultSet.getString("name") + "'");
//					productMain.main(r);
				} else if (resultSet.getString("role").equalsIgnoreCase("Buyer")) {
					System.out.println("Hello Buyer '" + resultSet.getString("name") + "'");
				} else {
					System.out.println("Unauthorize User...");
				}
			}
			if (count != 0) {
				System.out.println("User Found");
								
			} else {
				System.err.println("User Not Found");
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			closeConnection();
		}
		return user;

	}

	public String deleteUser(int id) {
		openConection();
		query = "DELETE from user where id=?";
		String message = null;
		try {
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, id);
			int res = preparedStatement.executeUpdate();
			if (res != 0) {
				message = "User Deleted successfully!";
			} else {
				message = "User is not Present";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConnection();
		}
		return message;
	}

	public User findUserById(int id) {
		openConection();
		query = "Select * from user where id=?";
		User user = new User();
		try {
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, id);
			resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				user.setId(resultSet.getInt("id"));
				user.setName(resultSet.getString("name"));
				user.setEmail(resultSet.getString("email"));
				user.setMobile(resultSet.getLong("mobile"));
				user.setPassword(resultSet.getString("password"));
				user.setRole(resultSet.getString("role"));
			} else {
				user = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConnection();
		}
		return user;
	}

	public String updateUser(int id, String name, String email, long mobile, String password, String role) {
		openConection();
		query = "UPDATE user set id=?,name=?,email=?,mobile=?,password=?,role=? where id=?";
		int res = 0;
		try {

			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(7, id);
			System.out.println("Enter User id");
			preparedStatement.setInt(1, id);
			System.out.println("Enter user Name");
			preparedStatement.setString(2, name);
			System.out.println("Enter user Email");
			preparedStatement.setString(3, email);
			System.out.println("Enter user Mobile");
			preparedStatement.setLong(4, mobile);
			System.out.println("Enter user Password");
			preparedStatement.setString(5, password);
			System.out.println("Enter user Role");
			preparedStatement.setString(6, role);
			res = preparedStatement.executeUpdate();
			new User(id, name, email, mobile, password, role);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConnection();
		}
		if (res != 0) {
			return name.toUpperCase() + " Updated successfully!";
		} else {
			return "Invalid input please enter valid input";
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
