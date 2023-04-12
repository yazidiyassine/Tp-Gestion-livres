package controller_frontal;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.UserService;
import services.UserServiceImpl;

import java.io.IOException;

import domains.Role;
import domains.User;

public class RegisterServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService userService = new UserServiceImpl();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String login = request.getParameter("login");
		String password = request.getParameter("password");
		String role = "VISITEUR";
		Role r = Role.valueOf(role);

		User u = new User();
		u.setLogin(login);
		u.setPassword(password);
		u.setRole(r);

		userService.createUser(u);
		String msg = new StringBuffer().append("Merci de s'inscrire, ").append(u.getLogin().split("@")[0])
				.append(" ,vous pouvez maintenant vous authentifier!").toString();

		request.setAttribute("msg", msg);
		RequestDispatcher d = getServletContext().getRequestDispatcher("/login.jsp");
		d.forward(request, response);

	}

}
