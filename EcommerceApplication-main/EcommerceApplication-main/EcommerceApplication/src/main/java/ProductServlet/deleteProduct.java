package ProductServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import JDBC.productJDBC;

@WebServlet("/deleteProduct")
public class deleteProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	productJDBC productJDBC=new productJDBC();
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Enter User id");
		int id = Integer.parseInt(req.getParameter("id"));
		String message =productJDBC.removeProduct(id);
		System.out.println(id);
		req.setAttribute("message", message);
		System.out.println(message);
		req.getRequestDispatcher("welcome.jsp").include(req, resp);
		}

}
