package ProductServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import JDBC.cartJDBC;
import entity.myCart;

@WebServlet("/removeFromCart")
public class removeFromCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	cartJDBC cart = new cartJDBC();
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int pid = Integer.parseInt(req.getParameter("productId"));
		int uid = Integer.parseInt(req.getParameter("userId"));
		myCart my_cart = new myCart(uid, pid);
		cart.removeProduct(my_cart);
		req.getRequestDispatcher("myCart.jsp").forward(req, resp);;
	}

}
