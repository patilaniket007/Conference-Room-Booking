package controller;

import java.io.IOException;

import dao.UserDAO;
import model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final UserDAO userDAO = new UserDAO();

	// Redirect to registration form on GET
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    response.sendRedirect("register.jsp");
	}

	// Handle form submission
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String username = request.getParameter("username").trim();
		String password = request.getParameter("password").trim();
		String role = request.getParameter("role").trim();

		System.out.println("Registering user with role: " + role);

		try {
			// Check if username already exists
			if (userDAO.usernameExists(username)) {
				request.setAttribute("error", "Username already taken.");
				request.getRequestDispatcher("register.jsp").forward(request, response);
				return;
			}

			// Create new user object
			User newUser = new User();
			newUser.setUsername(username);
			newUser.setPassword(password); // NOTE: Use password hashing in real apps
			newUser.setRole(role);

			// Insert user in DB
			boolean success = userDAO.registerUser(newUser);

			if (success) {
				request.setAttribute("success", "✅ Registration successful. Please login.");
			} else {
				request.setAttribute("error", "❌ Something went wrong. Please try again.");
			}

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "❌ Error: " + e.getMessage());
		}

		// Return to register page with message
		request.getRequestDispatcher("register.jsp").forward(request, response);
	}
}
