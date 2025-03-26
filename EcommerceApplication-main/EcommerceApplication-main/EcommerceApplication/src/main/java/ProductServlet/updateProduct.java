package ProductServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import JDBC.productJDBC;
import entity.Product;

@WebServlet("/updateProduct")
public class updateProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	productJDBC productJDBC=new productJDBC();
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Enter Product id");
		int id = Integer.parseInt(req.getParameter("productId"));
		System.out.println(id);
		Product product = null;
		product = productJDBC.findProductById(id);
		req.setAttribute("product", product);
		if (product != null) {
			req.getRequestDispatcher("editProduct.jsp").forward(req, resp);

		} else {
			String message = "Product Not Found!";
			req.setAttribute("message", message);	
			System.out.println(message);
			req.getRequestDispatcher("welcome.jsp").forward(req, resp);

		}	}

}
