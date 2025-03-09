package com.tap.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;

import java.util.List;

import com.tap.DAO.OrderDAO;
import com.tap.Utility.DBConnection;
import com.tap.models.Order;



public class OrderDAOImpl implements OrderDAO{

	@Override
	public int addOrder(Order order) {
		 String INSERT = "INSERT INTO `order` (`resturantId`, `userId`, `orderDate`, `totalAmount`, `status`, `paymentMode`) VALUES (?,?,?,?,?,?)";
         int orderId = 0;
	        try (Connection connection = DBConnection.getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement(INSERT , Statement.RETURN_GENERATED_KEYS)) {

	            preparedStatement.setInt(1, order.getResturantId());
	            preparedStatement.setInt(2, order.getUserId());
	            preparedStatement.setTimestamp(3, Timestamp.valueOf(order.getOrderDate()));
	            preparedStatement.setDouble(4, order.getTotalAmount());
	            preparedStatement.setString(5, order.getStatus());
	            preparedStatement.setString(6, order.getPaymentMode());
	   

	            int i = preparedStatement.executeUpdate();
	            System.out.println(i + " row/s affected");
	            
	            ResultSet res = preparedStatement.getGeneratedKeys();
	            
	            while(res.next()) {
	               orderId = res.getInt(1);
	            }

	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return orderId;
		
	}

	@Override
	public Order getOrder(int orderId) {
		  Connection connection = DBConnection.getConnection();
	        String GET_ORDER_BY_ID = "SELECT * FROM `order` WHERE `orderId` = ?";
	        Order order = null;

	        try (PreparedStatement preparedStatement = connection.prepareStatement(GET_ORDER_BY_ID)) {
	            preparedStatement.setInt(1, orderId);

	            ResultSet res = preparedStatement.executeQuery();

	            if (res.next()) {
	                int id = res.getInt("orderId");
	                int resturantId = res.getInt("resturantId");
	                int userId = res.getInt("userId");
	                LocalDateTime orderDate = res.getTimestamp("orderDate").toLocalDateTime();  
	                double totalAmount = res.getDouble("totalAmount");
	                String status = res.getString("status");
	                String paymentMode = res.getString("paymentMode");

	                // Create an Order object
	                order = new Order(id, resturantId, userId, orderDate, totalAmount, status, paymentMode);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        return order;
	}

	@Override
	public void updateOrder(Order order) {
	    String UPDATE_ORDER = "UPDATE `order` SET `paymentMode` = ? WHERE `orderId` = ?";

	    try (Connection connection = DBConnection.getConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_ORDER)) {

	        preparedStatement.setString(1, order.getPaymentMode());
	        preparedStatement.setInt(2, order.getOrderId());

	        int n = preparedStatement.executeUpdate();
	        System.out.println(n + " row/s updated");

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}


	@Override
	public void deleteOrder(int orderId) {
		
		String DELETE_ORDER = "DELETE FROM `order` WHERE `orderId` = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_ORDER)) {

            preparedStatement.setInt(1, orderId);
            int n = preparedStatement.executeUpdate();
            System.out.println(n + " row/s deleted");

        } catch (SQLException e) {
            e.printStackTrace();
        }
		
	}

	@Override
	public List<Order> getAllOrdersByUser(int userId) {
	    String GET_ALL_ORDERS = "SELECT * FROM `order` WHERE `userId` = ?";
	    List<Order> orders = new ArrayList<>();

	    try (Connection connection = DBConnection.getConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_ORDERS)) {

	        preparedStatement.setInt(1, userId);
	        ResultSet res = preparedStatement.executeQuery();

	        while (res.next()) {
	            int orderId = res.getInt("orderId");
	            int resturantId = res.getInt("resturantId");
	            LocalDateTime orderDate = res.getTimestamp("orderDate").toLocalDateTime();
	            double totalAmount = res.getDouble("totalAmount");
	            String status = res.getString("status");
	            String paymentMode = res.getString("paymentMode");

	            // Create Order object and add to list
	            Order order = new Order(orderId, resturantId, userId, orderDate, totalAmount, status, paymentMode);
	            orders.add(order);
	        }

	    } catch (SQLException e) {
	        System.err.println("Error fetching orders for user ID " + userId + ": " + e.getMessage());
	        e.printStackTrace();
	    }

	    return orders;
	}



}
