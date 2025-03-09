package com.tap.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.OrderItemDAO;
import com.tap.Utility.DBConnection;
import com.tap.models.OrderItem;

public class OrderItemDAOImpl implements OrderItemDAO{

	@Override
	public void addOrderItem(OrderItem orderItem) {
		
		 String INSERT = "INSERT INTO `orderItem` (`orderId`, `menuId`, `quantity`, `totalAmount`) VALUES (?,?,?,?)";

	        try (Connection connection = DBConnection.getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement(INSERT)) {

	            preparedStatement.setInt(1, orderItem.getOrderId());
	            preparedStatement.setInt(2, orderItem.getMenuId());
	            preparedStatement.setInt(3, orderItem.getQuantity());
	            preparedStatement.setDouble(4, orderItem.getTotalAmount());
	           
	            int i = preparedStatement.executeUpdate();
	            System.out.println(i + " row/s affected");

	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
		
	}

	@Override
	public OrderItem getOrderItem(int orderItemId) {
		 Connection connection = DBConnection.getConnection();
		 
	        String GET_ORDERITEM_BY_ID = "SELECT * FROM `orderItem` WHERE `orderItemId` = ?";
	        OrderItem orderItem = null;

	        try (PreparedStatement preparedStatement = connection.prepareStatement(GET_ORDERITEM_BY_ID)) {
	            preparedStatement.setInt(1, orderItemId);
                
	            ResultSet res = preparedStatement.executeQuery();

	            if (res.next()) {
	              //  int id = res.getInt("orderItemId");  getting local variable is not used warning
	                int orderId = res.getInt("orderId");
	                int menuId = res.getInt("menuId");
	                int quantity = res.getInt("quantity");  
	                double totalAmount = res.getDouble("totalAmount");
	             

	                // Create an Order object
	                orderItem = new OrderItem(orderId, menuId, quantity, totalAmount);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        return orderItem;

	}

	@Override
	public void updateOrderItem(OrderItem orderItem) {
	    String UPDATE_ORDER_ITEM = "UPDATE `orderItem` SET `quantity` = ?, `totalAmount` = ? WHERE `orderItemId` = ?";

	    try (Connection connection = DBConnection.getConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_ORDER_ITEM)) {

	        preparedStatement.setInt(1, orderItem.getQuantity());
	        preparedStatement.setDouble(2, orderItem.getTotalAmount());
	        preparedStatement.setInt(3, orderItem.getOrderItemId());

	        int i = preparedStatement.executeUpdate();
	        System.out.println(i + " row/s updated");

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}


	@Override
	public void deleteOrderItem(int orderItemId) {
	    String DELETE_ORDER_ITEM = "DELETE FROM `orderItem` WHERE `orderItemId` = ?";

	    try (Connection connection = DBConnection.getConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement(DELETE_ORDER_ITEM)) {

	        preparedStatement.setInt(1, orderItemId);
	        int n = preparedStatement.executeUpdate();

	        if (n > 0) {
	            System.out.println("OrderItem with ID " + orderItemId + " deleted successfully.");
	        } else {
	            System.out.println("OrderItem with ID " + orderItemId + " not found.");
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}


	@Override
	public List<OrderItem> getOrderItemsByOrder(int orderId) {
	    String GET_ORDER_ITEMS = "SELECT * FROM `orderItem` WHERE `orderId` = ?";
	    List<OrderItem> orderItems = new ArrayList<>();

	    try (Connection connection = DBConnection.getConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement(GET_ORDER_ITEMS)) {

	        preparedStatement.setInt(1, orderId);
	        ResultSet res = preparedStatement.executeQuery();

	        while (res.next()) {
	            int orderItemId = res.getInt("orderItemId");
	            int menuId = res.getInt("menuId");
	            int quantity = res.getInt("quantity");
	            double totalAmount = res.getDouble("totalAmount");

	            OrderItem orderItem = new OrderItem(orderId, menuId, quantity, totalAmount);
	            orderItems.add(orderItem);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return orderItems;
	}

}
