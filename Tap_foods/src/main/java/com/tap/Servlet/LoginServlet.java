package com.tap.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tap.DAO.UserDAO;
import com.tap.DAOImpl.UserDAOImpl;
import com.tap.models.User;

@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO = new UserDAOImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 🔹 Get email & password (case-sensitive fix)
        String email = request.getParameter("Email");
        String password = request.getParameter("password");

        System.out.println("Login Attempt: " + email + " | " + password); // Debugging

        // 🔹 Authenticate User
        User user = userDAO.getUserByEmailAndPassword(email, password);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("loggedInUser", user); // Consistent session key

            System.out.println("Login Successful: " + user.getName());

            response.sendRedirect("Resturant?user="+ email); // ✅ Redirecting to "Resturant"
        } else {
            System.out.println("Login Failed: Invalid credentials");
            response.sendRedirect("Login.jsp?error=invalid_credentials");
        }
    }
}
