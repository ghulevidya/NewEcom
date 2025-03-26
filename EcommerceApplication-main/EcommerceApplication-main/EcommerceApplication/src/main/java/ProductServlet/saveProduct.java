package ProductServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import JDBC.productJDBC;


@WebServlet("/saveProduct")
public class saveProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	productJDBC productJDBC=new productJDBC();
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("Enter product Id");
		int id = Integer.parseInt(req.getParameter("productId"));
		System.out.println(id);
		System.out.println("Enter user Product Name");
		String name = req.getParameter("productName");
		System.out.println(name);
		System.out.println("Enter Product Description");
		String desc =req.getParameter("productDescription");
		System.out.println(desc);
		System.out.println("Enter Product Price");
		double price =Double.parseDouble(req.getParameter("productPrice"));
		System.out.println(price);
		System.out.println("Enter Product Status");
		String status = req.getParameter("status");
		System.out.println(status);
		productJDBC.updateProduct(id, name, desc, price, status);
		System.out.println("Product Updated!");
		String message = "Product Updated successfully!";
		req.setAttribute("message", message);
		req.getRequestDispatcher("welcome.jsp").include(req, resp);	
	}

}
