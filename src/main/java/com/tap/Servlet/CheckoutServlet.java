package com.tap.Servlet;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tap.DAO.OrderDAO;
import com.tap.DAOImpl.OrderDAOImpl;
import com.tap.DAOImpl.OrderItemDAOImpl;
import com.tap.DAOImpl.UserDAOImpl;
import com.tap.models.Cart;
import com.tap.models.CartItem;
import com.tap.models.Order;
import com.tap.models.OrderItem;
import com.tap.models.User;

@WebServlet("/Checkout")
public class CheckoutServlet extends HttpServlet {

	private OrderDAO orderDAO;
	private OrderItemDAOImpl orderItemDAOImpl;
	private Cart cart ;

	@Override
	public void init() throws ServletException {
		try {
			orderDAO = new OrderDAOImpl();
			orderItemDAOImpl = new OrderItemDAOImpl();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		 cart = (Cart) session.getAttribute("cart");
		User user = (User) session.getAttribute("loggedInUser");

		if (cart != null && user != null && !cart.getItems().isEmpty()) {
			String paymentMethod = request.getParameter("paymentMethod");
			String address = request.getParameter("address");

			Order order = new Order();
			order.setUserId(user.getUserId());
			order.setResturantId((int) session.getAttribute("resturantId"));
			order.setOrderDate(LocalDateTime.now());
			order.setPaymentMode(paymentMethod);
			order.setStatus("pending");

			double totalAmount = 0.0;
			for (CartItem item : cart.getItems().values()) {
				totalAmount += item.getPrice() * item.getQuantity();
			}
			order.setTotalAmount(totalAmount);

			// Add order to database
			int orderId = orderDAO.addOrder(order);



			// Insert each cart item as an order item
			for (CartItem item : cart.getItems().values()) {
				int itemId = item.getItemId();
				double price = item.getPrice();
				int quantity = item.getQuantity();
				double totalPrice = price * quantity;

				OrderItem orderItem = new OrderItem(orderId, itemId, quantity, totalPrice);
				orderItemDAOImpl.addOrderItem(orderItem);
			}
			
			session.setAttribute("cart", cart);

			// Clear cart and redirect to order confirmation

			session.removeAttribute("cart");
			session.setAttribute("order", order);
			response.sendRedirect("Orderconfirmation.jsp");
		} else {
			response.sendRedirect("Cart.jsp");
		}
	}
	
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    HttpSession session = request.getSession();
	    Cart cart = (Cart) session.getAttribute("cart");
	    String email = request.getParameter("email");
	    
	 
	    
	    
	    System.out.println("checkout called");

	    String paymentMethod = request.getParameter("paymentMethod");
	    String method = null ;

	    if (paymentMethod != null && !paymentMethod.isEmpty()) {
	        if (paymentMethod.equals("cod")) {
	        	method = "cod";
	        } else if (paymentMethod.equals("credit")) {
	             method = "credit";
	        } else if (paymentMethod.equals("debit")) {
	        	 method = "debit";
	        } else if (paymentMethod.equals("paypal")) {
	        	 method = "paypal";
	        } else if (paymentMethod.equals("upi")) {
	        	 method = "upi";
	        }
	        
	        
//	        User user = (User) session.getAttribute("loggedInUser");
	        System.out.println(email);
	        User user =  new UserDAOImpl().getUser(email);
	        
//	        UserDAOImpl userDAO = new UserDAOImpl();
//	        User user = userDAO.getUser(1); 
	        
	        System.out.println(user + " user");
	        System.out.println(cart + " cart");
	        System.out.println(cart.getItems().isEmpty());
	        
			if (cart != null && user != null && !cart.getItems().isEmpty()) {
				
				
				
				String address = request.getParameter("address");
				Order order = new Order();
				order.setUserId(user.getUserId());
				order.setResturantId((int) session.getAttribute("resturantId"));
				order.setOrderDate(LocalDateTime.now());
				order.setPaymentMode(method);
				order.setStatus("pending");
				order.setTotalAmount(cart.getTotalPrice() + 50 + (cart.getTotalPrice()*18)/100);

				// Add order to database
				int orderId = orderDAO.addOrder(order);
				
				// Insert each cart item as an order item
				for (CartItem item : cart.getItems().values()) {
					int itemId = item.getItemId();
					double price = item.getPrice();
					int quantity = item.getQuantity();
					double totalPrice = price * quantity;

					OrderItem orderItem = new OrderItem(orderId, itemId, quantity, totalPrice);
					orderItemDAOImpl.addOrderItem(orderItem);
				}
	        		
				System.out.println(orderId);
				
		       	response.sendRedirect("Orderconfirm.jsp");
	        
	    
	    } else {
	        // Handle error (no payment method selected)
	        response.sendRedirect("Checkout.jsp?error=Select a payment method");
	    }
	}
	    
	    
	    System.out.println(method);
	}
}
