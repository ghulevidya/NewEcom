package UserServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import JDBC.USERjdbc;
import entity.User;

@WebServlet("/updateUser")
public class updateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	USERjdbc userjdbc = new USERjdbc();

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Enter User id");
		int id = Integer.parseInt(req.getParameter("id"));
		System.out.println(id);
		User user = null;
		user = userjdbc.findUserById(id);
		req.setAttribute("user", user);
		if (user != null) {
			req.getRequestDispatcher("update.jsp").forward(req, resp);

		} else {
			String message = "User Not Found!";
			req.setAttribute("message", message);
			System.out.println(message);
			req.getRequestDispatcher("home.jsp").forward(req, resp);

		}

	}

}
