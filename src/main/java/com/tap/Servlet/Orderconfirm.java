package com.tap.Servlet;

import java.io.IOException;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tap.models.Order;
import com.tap.models.Cart;
import com.tap.models.CartItem;

@WebServlet("/OrderConfirm")
public class Orderconfirm extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Order order = (Order) session.getAttribute("order");
        Cart cart = (Cart) session.getAttribute("cart");

        if (order == null || cart == null) {
            response.sendRedirect("Cart.jsp");
            return;
        }

        // Extract the ordered items from the cart's map (Map<Integer, CartItem>)
        Map<Integer, CartItem> orderedItems = cart.getItems();

        // Pass ordered items to the request scope for JSP access
        request.setAttribute("orderedItems", orderedItems);

        // Forward to order confirmation page
        request.getRequestDispatcher("Orderconfirm.jsp").forward(request, response);
    }
}
