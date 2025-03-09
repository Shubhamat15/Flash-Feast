package com.tap.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tap.models.Cart;
import com.tap.models.CartItem;

@WebServlet("/CartServlet")
public class TestServlet extends HttpServlet {

		@Override
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		        
		       System.out.println("jhj hjkf hskdjfhk");
	        HttpSession session = request.getSession();
	        Cart cart = (Cart) session.getAttribute("cart");
	        
		        String action = request.getParameter("action");
		        if(action.equals("removeAll")) {
		        	cart.removeAllItem();
		        }else {
		        	 int itemId = Integer.parseInt(request.getParameter("itemId"));
			         int quantity = Integer.parseInt(request.getParameter("quantity"));
			         System.out.println("Item updated: Item ID = " + itemId + ", New Quantity = " + quantity);
			         if(action.equals("update")) {
			        	cart.updateItem(itemId, quantity);
			        }else if(action.equals("remove")) {
			        	cart.removeItem(itemId);
			        }
		        }

		        
		        response.sendRedirect("Cart.jsp"); // Send response back to AJAX
		}
		
		
		
	}
	

