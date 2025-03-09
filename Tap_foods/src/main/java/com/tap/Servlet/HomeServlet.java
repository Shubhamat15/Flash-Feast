package com.tap.Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tap.DAOImpl.ResturantDAOImpl;
import com.tap.models.Resturant;

@WebServlet("/Resturant")
public class HomeServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	System.out.println("home page reached");
	
	ResturantDAOImpl resImpl = new ResturantDAOImpl();
		
	List<Resturant> allResturants = resImpl.getAllResturant();
	
	for(Resturant resturant: allResturants) {
		System.out.println(resturant);
	}
	
	req.setAttribute("resturants", allResturants);
	
	RequestDispatcher rd = req.getRequestDispatcher("Resturant.jsp");
	rd.forward(req, resp);
	}

}
