package UserServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import JDBC.USERjdbc;
import JDBC.cartJDBC;

@WebServlet("/deleteUser")
public class deleteUser extends HttpServlet {
	USERjdbc userjdbc = new USERjdbc();
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Enter User id");
		int id = Integer.parseInt(req.getParameter("id"));
		cartJDBC cart=new cartJDBC();
		cart.removeCarts(id);
		String message =userjdbc.deleteUser(id);
		System.out.println(id);
		
		req.setAttribute("message", message);
		req.setAttribute("col","red");
		System.out.println(message);
		req.getRequestDispatcher("home.jsp").include(req, resp);
	}
}
