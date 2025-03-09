package com.tap.Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tap.DAOImpl.MenuDAOImpl;
import com.tap.models.Menu;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("menu servlet called");
		
		
		int  id = Integer.parseInt(req.getParameter("resturantId"));
		
		MenuDAOImpl menuDao = new MenuDAOImpl();
		
		List<Menu> menus = menuDao.getAllMenusByResturant(id);
		
		req.setAttribute("menus", menus);
		RequestDispatcher rd =  req.getRequestDispatcher("Menu.jsp");
		rd.forward(req, resp);
		
	}
}
