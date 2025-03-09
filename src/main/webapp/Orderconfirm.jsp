<%@ page
	import="java.util.List, com.tap.models.Resturant, com.tap.models.Cart, com.tap.models.CartItem"%>
<!doctype html>
<html lang="en">
<head>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<link rel="icon" type="image/svg+xml" href="/vite.svg" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Order Confirmed</title>
<link rel="stylesheet" href="Orderconfirm.css">
</head>
<body>
	<div id="root">
		<div class="order-confirmation">
			<div class="header">
				<div class="header-content">
					<h1>Order Confirmed!</h1>
					<p>Your delicious food is on the way</p>
				</div>
				<div class="check-icon">
					<svg xmlns="http://www.w3.org/2000/svg" width="48" height="48"
						viewBox="0 0 24 24" fill="none" stroke="currentColor"
						stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
						class="lucide lucide-check-circle">
						<path d="M22 11.08V12a10 10 0 1 1-5.93-9.14" />
						<polyline points="22 4 12 14.01 9 11.01" /></svg>
				</div>
			</div>

			<div class="status-container">
				<div class="status-image">
					<img
						src="https://images.unsplash.com/photo-1594212699903-ec8a3eca50f5?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80"
						alt="Food Delivery" />
				</div>
				<div class="status-message">
					<h2>Your food is being prepared!</h2>
					<p>Our chef is cooking your delicious meal. A delivery partner
						will pick it up soon.</p>
					<div class="countdown-container">
						<h3>Estimated Delivery In:</h3>
						<div class="countdown">
							<div class="countdown-item">
								<span id="countdown-minutes">30</span> <span
									class="countdown-label">min</span>
							</div>
							<div class="countdown-separator">:</div>
							<div class="countdown-item">
								<span id="countdown-seconds">00</span> <span
									class="countdown-label">sec</span>
							</div>
						</div>
					</div>

					<div class="delivery-status" id="order-steps">

						<div class="status-step active">
							<div class="status-icon">
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
									viewBox="0 0 24 24" fill="none" stroke="currentColor"
									stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
									class="lucide lucide-utensils">
									<path d="M3 2v7c0 1.1.9 2 2 2h4a2 2 0 0 0 2-2V2" />
									<path d="M7 2v20" />
									<path d="M21 15V2v0a5 5 0 0 0-5 5v6c0 1.1.9 2 2 2h3Zm0 0v7" /></svg>
							</div>
							<span>Preparing</span>
						</div>
						<div class="status-step">
							<div class="status-icon">
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
									viewBox="0 0 24 24" fill="none" stroke="currentColor"
									stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
									class="lucide lucide-package">
									<path d="m7.5 4.27 9 5.15" />
									<path
										d="M21 8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16Z" />
									<path d="m3.3 7 8.7 5 8.7-5" />
									<path d="M12 22V12" /></svg>
							</div>
							<span>Packed</span>
						</div>
						<div class="status-step">
							<div class="status-icon">
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
									viewBox="0 0 24 24" fill="none" stroke="currentColor"
									stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
									class="lucide lucide-bike">
									<circle cx="18.5" cy="17.5" r="3.5" />
									<circle cx="5.5" cy="17.5" r="3.5" />
									<circle cx="15" cy="5" r="1" />
									<path d="M12 17.5V14l-3-3 4-3 2 3h2" /></svg>
							</div>
							<span>On the way</span>
						</div>
						<div class="status-step">
							<div class="status-icon">
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
									viewBox="0 0 24 24" fill="none" stroke="currentColor"
									stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
									class="lucide lucide-home">
									<path d="m3 9 9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z" />
									<polyline points="9 22 9 12 15 12 15 22" /></svg>
							</div>
							<span>Delivered</span>
						</div>
					</div>
				</div>
			</div>

			<div class="order-details">
				<h2>Order Details</h2>
				<div class="order-number">
					<span>Order Number:</span> <span id="order-number">ORD-56</span>
				</div>

				<%
    Cart cart = (Cart) session.getAttribute("cart");

    float tax = 0.0f; 
    double total = 0.0;
    float last = 0;

    if (cart != null && cart.getItems() != null && !cart.getItems().isEmpty()) {
        tax = (18.0f / 100.0f) * cart.getTotalPrice();
%>

				<div class="order-items">
					<h3>Your Meal</h3>

					<%
        for (CartItem item : cart.getItems().values()) {
            total += item.getPrice() * item.getQuantity();
    %>

					<div class="item">
						<div class="item-details">
							<span class="item-name"><%= item.getName() %></span> <span
								class="item-quantity">x<%= item.getQuantity() %></span>
						</div>
						<span class="item-price">₹<%= item.getPrice() * item.getQuantity() %></span>
					</div>

					<% 
        } // End of loop
        last = (float) total + tax + 50;
    %>
				</div>

				<div class="order-summary">
					<h3>Order Summary</h3>
					<div class="summary-item">
						<span>Subtotal:</span> <span>₹<%= total %></span>
					</div>
					<div class="summary-item">
						<span>Tax (18%):</span> <span>₹<%= tax %></span>
					</div>
					<div class="summary-item">
						<span>Shipping:</span> <span>₹50.00</span>
					</div>
					<div class="summary-item total">
						<span><strong>Total:</strong></span> <span><strong>₹<%= last %></strong></span>
					</div>
				</div>

				<%
    } else {
%>
				<p class="text-center">Your cart is empty.</p>
				<%
    }
%>

				<div class="order-total">
					<span>Total:</span> <span id="order-total">₹ <%= last %></span>
				</div>

				<!-- Delivery Address Section - Now positioned below order details and summary -->
				

				<div class="actions">
					<form action="">
						<button class="primary-button">Track Order</button>
					</form>
					<form action="Resturant">
						<button class="secondary-button">Order Again</button>
					</form>
				</div>
			</div>

			<div class="footer">
				<p>
					Need help? Contact our <a href="#">support team</a>
				</p>
			</div>
		</div>
	</div> 
	<script src="main.js"></script>
</body>
</html>