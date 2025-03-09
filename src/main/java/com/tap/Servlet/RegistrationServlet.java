package com.tap.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tap.DAO.UserDAO;
import com.tap.DAOImpl.UserDAOImpl;
import com.tap.models.User;

@WebServlet("/Registration")
public class RegistrationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // ✅ Read input values
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        //  Debugging: Print received values
        System.out.println("Received Data - Name: " + name + ", Email: " + email + ", Mobile: " + mobile + ", Address: " + address );

        //  Assign default role as "Customer"
        String role = "Customer";

        // Create a new user object
        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setPhone(mobile);
        user.setPassword(password);
        user.setRole(role);  // ✅ Setting default role
        user.setAddress(address);
        
        // ✅ Save user to database
        UserDAO userDAO = new UserDAOImpl();
        boolean isUserAdded = userDAO.addUser(user);

        // ✅ Debugging: Check if user is added
        if (isUserAdded) {
            System.out.println("User registered successfully!");
            response.sendRedirect("Login.jsp"); // Redirect to login
        } else {
            System.out.println("User registration failed!");
            response.sendRedirect("Registration.jsp?error=RegistrationFailed");
        }
    }
}
