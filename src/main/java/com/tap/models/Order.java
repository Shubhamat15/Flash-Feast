package com.tap.models;

import java.time.LocalDateTime;

public class Order {

	private int orderId;
	private int resturantId;
    private int userId;
    private LocalDateTime orderDate;
    private double totalAmount;
    private String status;
    private String paymentMode;
    
	public Order() {
		// TODO Auto-generated constructor stub
	}

	public Order(int orderId, int resturantId, int userId, LocalDateTime orderDate, double totalAmount, String status,
			String paymentMode) {
		super();
		this.orderId = orderId;
		this.resturantId = resturantId;
		this.userId = userId;
		this.orderDate = orderDate;
		this.totalAmount = totalAmount;
		this.status = status;
		this.paymentMode = paymentMode;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getResturantId() {
		return resturantId;
	}

	public void setResturantId(int resturantId) {
		this.resturantId = resturantId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public LocalDateTime getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(LocalDateTime orderDate) {
		this.orderDate = orderDate;
	}

	public double getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPaymentMode() {
		return paymentMode;
	}

	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}

	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", resturantId=" + resturantId + ", userId=" + userId + ", orderDate="
				+ orderDate + ", totalAmount=" + totalAmount + ", status=" + status + ", paymentMode=" + paymentMode
				+ "]";
	}
	
	
}
