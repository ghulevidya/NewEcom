package ProductServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import JDBC.productJDBC;
import entity.Product;


@WebServlet("/addProduct")
public class addProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	productJDBC jdbc=new productJDBC();
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println(1);
		Product product = new Product();
		System.out.println("Enter product Id");
		int id = Integer.parseInt(req.getParameter("ProductId"));
		System.out.println(id);
		System.out.println("Enter user Product Name");
		String name = req.getParameter("ProductName");
		System.out.println(name);
		System.out.println("Enter Product Description");
		String desc =req.getParameter("ProductDescription");
		System.out.println(desc);
		System.out.println("Enter Product Price");
		double price =Double.parseDouble(req.getParameter("ProductPrice"));
		System.out.println(price);
		System.out.println("Enter Product Status");
		String status = req.getParameter("status");
		System.out.println(status);
		product = new Product(id, name, desc, price, status);
		jdbc.addProduct(product);
		System.out.println("Product added");
		String message = "Product added successfully!";
		req.setAttribute("message", message);
		req.getRequestDispatcher("welcome.jsp").include(req, resp);

	}

}
