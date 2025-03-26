package UserServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/userController")
public class userController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Integer choice = Integer.parseInt(req.getParameter("action"));
		System.out.println(
				"****************************************************************************************************************************************************************************");
		System.out.println();
		System.out.println(
				"Enter 1 for Sign In.\nEnter 2 for Log In.\nEnter 3 for Show All Users.\nEnter 4 to Delete User.\nEnter 5 for Update User\nEnter 6 for Exit.");
		System.out.println(
				"\n****************************************************************************************************************************************************************************");
		
		try {

			switch (choice) {
			case 1:
//				ob.addUser(User user);
				System.out.println(choice);
				req.getRequestDispatcher("signup.jsp").forward(req, resp);

				break;
			case 2:
//				ob.loginUser();
				System.out.println(choice);
				req.getRequestDispatcher("login.jsp").forward(req, resp);

				break;
			case 3:
//				ob.showUser();
				System.out.println(choice);
				req.getRequestDispatcher("users.jsp").forward(req, resp);

				break;
			case 4:
//				ob.deleteUser();
				System.out.println(choice);
				String url="./deleteUser";
				req.setAttribute("url", url);
				req.getRequestDispatcher("edit.jsp").forward(req, resp);
				break;
			case 5:
//				ob.updateUser();
				System.out.println(choice);
				url="./updateUser";
				req.setAttribute("url", url);
				req.getRequestDispatcher("edit.jsp").forward(req, resp);
				break;
			case 6:
				System.err.println("Thank You...");
				req.getRequestDispatcher("Thank.jsp").forward(req, resp);
//				flag = false;
				break;
			}
		} catch (Exception e) {
			System.out.println("Invalid input please enter valid Input");
//			if (flag) {
//				doPost(req, resp);
//			}
//			flag = false;
			req.getRequestDispatcher("home.jsp").forward(req, resp);
		}
	}
}
