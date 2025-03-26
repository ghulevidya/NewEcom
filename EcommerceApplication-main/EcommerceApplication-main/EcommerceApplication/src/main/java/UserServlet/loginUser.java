package UserServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import JDBC.USERjdbc;
import entity.User;

@WebServlet("/loginUser")
public class loginUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private USERjdbc userjdbc = new USERjdbc();

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Enter user Email");
		String email = req.getParameter("email");
		System.out.println(email);
		System.out.println("Enter user Password");
		String password = req.getParameter("password");
		System.out.println(password);

		User user = userjdbc.loginUser(email, password);
		if (user != null) {
			String role = user.getRole();
			
			getServletContext().setAttribute("user", user);
			if (role.equalsIgnoreCase("seller")) {
				System.out.println(
						"****************************************************************************************************************************************************************************");
				System.out.println();
				System.out.println(
						"Enter 1 for Add Product.\nEnter 2 for Show All Product.\nEnter 3 to Remove Product.\nEnter 4 for Update Product\nEnter 5 for Exit.");
				System.out.println(
						"\n****************************************************************************************************************************************************************************");
				req.getRequestDispatcher("welcome.jsp").forward(req, resp);
			} else if (role.equalsIgnoreCase("buyer")) {
				System.out.println(
						"****************************************************************************************************************************************************************************");
				System.out.println();
				System.out.println("Enter 1 for Show All Product.\nEnter 2 for Exit.");
				System.out.println(
						"\n****************************************************************************************************************************************************************************");

				req.getRequestDispatcher("welcome.jsp").forward(req, resp);

			}
		} else {
			req.setAttribute("message", "User Not Found");
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		}
	}

}
