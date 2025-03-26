package UserServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import JDBC.USERjdbc;

@WebServlet("/updateNewUser")
public class updateNewUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	USERjdbc userjdbc=new USERjdbc();
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
		System.out.println("Enter user Id");
		String id1 = req.getParameter("id");
		int id = Integer.parseInt(id1);
		System.out.println(id);
		System.out.println("Enter user Name");
		String name = req.getParameter("name");
		System.out.println(name);
		System.out.println("Enter user Email");
		String email = req.getParameter("email");
		System.out.println(email);
		System.out.println("Enter user Mobile");
		long mobile = Long.parseLong(req.getParameter("mobile"));
		System.out.println(mobile);
		System.out.println("Enter user Password");
		String password = req.getParameter("password");
		System.out.println(password);
		System.out.println("Enter user Role");
		String role = req.getParameter("role");
		System.out.println(role);  
		String message =userjdbc.updateUser(id, name, email, mobile, password, role);
		req.setAttribute("message", message);
		String col;
		if(message.equalsIgnoreCase("Invalid input please enter valid input")) {
			col="red";
		}
		else {
			col="green";
		}
		req.setAttribute("col",col);
		System.out.println("User Updated");
		req.getRequestDispatcher("home.jsp").include(req, resp);
	}

}
