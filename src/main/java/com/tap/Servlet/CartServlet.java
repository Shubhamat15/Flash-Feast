package com.tap.Servlet;

import com.mysql.cj.xdevapi.JsonParser;
import com.tap.DAO.MenuDAO;
import com.tap.DAOImpl.MenuDAOImpl;
import com.tap.models.Cart;
import com.tap.models.CartItem;
import com.tap.models.Menu;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.StringReader;

@WebServlet("/Cart")
public class CartServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	

        System.out.println("Cart servlet called");

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        try {
        	int newResturantId = Integer.parseInt(request.getParameter("resturantId"));   
            Integer currentResturantId = (Integer) session.getAttribute("resturantId");

            if (cart == null || newResturantId != currentResturantId) {
                cart = new Cart();
                session.setAttribute("cart", cart); // Set the new cart in session
                session.setAttribute("resturantId", newResturantId); // Update the restaurant ID
            }
        }catch(Exception e) {
        	e.printStackTrace();
        }

        String action = request.getParameter("action");
         

        if (action != null) {
                    addItemToCart(request, cart);   
                    session.setAttribute("cart", cart);
                    }
        
        response.sendRedirect("Cart.jsp");
    }

    private void addItemToCart(HttpServletRequest request, Cart cart) {
        int itemId = Integer.parseInt(request.getParameter("itemId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

         MenuDAO menuDAO = new MenuDAOImpl();
         Menu menuItem = menuDAO.getMenu(itemId);
        System.out.println("the menu in the Cart Servlet " + menuItem);
        
        if(menuItem != null) {
        	 CartItem item = new CartItem(
        	            menuItem.getMenuId(),  
        	            menuItem.getItemName(),
        	            menuItem.getPrice(),
        	            quantity
        	        );
        	cart.addCartItem(item);
        }
    }


    
    
}
