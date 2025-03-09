<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.List, com.tap.models.Resturant, com.tap.models.Cart, com.tap.models.CartItem"%>


<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<link rel="icon" type="image/svg+xml" href="/vite.svg" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Food Order Cart</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="Cart.css">
<style>

.lee{
background-color: #ff6b35;
color: white;
padding: 18px  !important;
padding-bottom: 18px !important; 
}
html, body {
	overflow-x: hidden;
	/* Prevents horizontal scroll */
	margin: 0;
	padding: 0;
}

.le{
text-decoration: none;
}

/* Style for the navbar links */
.navbar-nav .nav-item .nav-link {
  position: relative;
  padding-bottom: 5px; /* Space for the underline */
  color: black; /* Set the text color */
  text-decoration: none; /* Remove default underline */
}

/* Create the underline effect using the ::after pseudo-element */
.navbar-nav .nav-item .nav-link::after {
  content: '';
  position: absolute;
  bottom: 0;
  left: 0;
  width: 0;
  height: 2px; /* Set the underline thickness */
  background-color: black; /* Set the underline color */
  transition: width 0.3s ease; /* Smooth transition for the underline */
}

/* On hover, expand the underline */
.navbar-nav .nav-item .nav-link:hover::after {
  width: 100%;
}

/* Ensure the dropdown items also have the same underline effect */
.navbar-nav .nav-item .dropdown-menu a {
  position: relative;
  padding-bottom: 5px;
  color: black;
  text-decoration: none;
}

/* Create the underline effect for dropdown links */
.navbar-nav .nav-item .dropdown-menu a::after {
  content: '';
  position: absolute;
  bottom: 0;
  left: 0;
  width: 0;
  height: 2px;
  background-color: black;
  transition: width 0.3s ease;
}

/* On hover, expand the underline for dropdown links */
.navbar-nav .nav-item .dropdown-menu a:hover::after {
  width: 100%;
}

/* Dropdown button (Cuisine) specific styling */
.navbar-nav .nav-item .dropdown-toggle {
  color: black; /* Set color for the dropdown button */
  padding-bottom: 5px; /* Space for underline */
  position: relative;
  text-decoration: none; /* Ensure no default underline */
  display: inline-block; /* Keeps the text and arrow in a line */
  padding-right: 20px; /* Ensure space for the arrow */
}

/* For "Cuisine" dropdown, apply a different hover effect */
.navbar-nav .nav-item .dropdown-toggle:hover {
  background-color: #f0f0f0; /* Light background color */
  color: #333; /* Darker text color */
}

/* Add a thicker, different colored underline for the Cuisine dropdown */
.navbar-nav .nav-item .dropdown-toggle:hover::after {
  width: 100%;
  height: 3px; /* Thicker underline */
  background-color: #ff6347; /* Tomato red color for the underline */
}

/* Prevent the underline from appearing for the dropdown button in the normal state */
.navbar-nav .nav-item .dropdown-toggle::after {
  content: none; /* No underline in the normal state */
}

/* Ensure the dropdown arrow is positioned correctly */
.navbar-nav .nav-item .dropdown-toggle::before {
  content: '\f107'; /* Unicode for dropdown arrow */
  font-family: 'Font Awesome 5 Free'; /* Font Awesome for dropdown arrow */
  font-weight: 900; /* Bold the arrow */
  margin-left: 10px; /* Space between text and arrow */
  color: black; /* Dropdown arrow color */
  position: absolute;
  right: 0; /* Position the arrow to the right */
  top: 50%; /* Center the arrow vertically */
  transform: translateY(-50%); /* Adjust the vertical alignment */
}

</style>

</head>
<body>

   
   	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
		
		<nav class="navbar bg-body-tertiary" style="padding: 0px; margin: 0px;">
    <a class="navbar-brand" href="#" style="padding: 0px; margin: 0px;">
      <img src="ImageResturant/logo2.png" alt="Bootstrap" width="70" height="60" >
    </a>
</nav>
		
		
			<a class="navbar-brand" href="#">Navbar</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">Home</a></li>
					
					<li class="nav-item"><a class="nav-link" href="#">Restaurants</a>
					</li>
					
					<li class="nav-item"><a class="nav-link" href="#">Specials</a>
					</li>
					
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle me-4" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Cuisine </a>
						<ul class="dropdown-menu">
							 <li><a class="dropdown-item" href="#">Italian</a></li>
        <li><a class="dropdown-item" href="#">Chinese</a></li>
        <li><a class="dropdown-item" href="#">Indian</a></li>
        <li><a class="dropdown-item" href="#">Mexican</a></li>
        <li><a class="dropdown-item" href="#">Japanese</a></li>
							<li><a class="dropdown-item" href="#">Explore by Restaurant
									</a></li>
						</ul></li>
					
				</ul>
				<form class="d-flex me-3" role="search">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
				<div class="d-flex align-items-center ">
					<a href="#" class="me-3 text-dark"><i
						class="fa-solid fa-user fa-lg"></i></a> <a href="#"
						class="text-dark position-relative"> <i
						class="fa-solid fa-cart-shopping fa-lg"></i> <span
						class="position-absolute top-2 end-1 translate-middle badge rounded-pill bg-danger px-2 py-1"
						style="font-size: 10px; transform: translate(50%, -50%);">
							<%
    Cart cart = (Cart) session.getAttribute("cart");
    Integer resturantId = (Integer) session.getAttribute("resturantId");
    float tax = 0.0f;
    if (cart != null && cart.getItems() != null && !cart.getItems().isEmpty()) {
        tax = (18.0f / 100.0f) * cart.getTotalPrice();
%> <%= cart.getTotalItems() %> <% } else { %> 0 <% } %>

					</span>
					</a>
				</div>
			</div>
		</div>
	</nav>
   




	<div class="container py-5">
		<h1 class="text-center mb-5 main-title">Your Food Cart</h1>

		<div class="row g-4">
			<!-- Cart Items Section -->
			<div class="col-lg-8">
				<div class="card mb-4 cart-card">
					<div class="card-header bg-primary text-white py-3">
						<h5 class="mb-0 fw-bold">
							<i class="bi bi-bag me-2"></i>Order Items (<%=cart.getTotalItems() %>)
						</h5>
					</div>
					<div class="card-body p-4">
						<!-- Cart Item 1 -->

						<% if (cart != null && cart.getItems() != null && !cart.getItems().isEmpty()) { %>
						<% for (CartItem item : cart.getItems().values()) { %>


						<div class="row mb-4 border-bottom pb-4 cart-item">
							<div class="col-md-4">
								<h5 class="product-name"><%=item.getName()%></h5>

							</div>



							<div class="col-md-4">
								<div class="d-flex align-items-center quantity-control">


									<!-- Decrease Quantity Form -->
									<form action="CartServlet" method="post"
										style="display: inline;">

										<input type="hidden" name="itemId"
											value="<%=item.getItemId()%>"> <input type="hidden"
											name="quantity" value="<%=item.getQuantity() - 1%>">
										<input type="hidden" name="action" value="update">

										<button type="submit"
											class="btn btn-sm btn-outline-secondary rounded-circle mb-2">
											<i class="bi bi-dash"></i>
										</button>
									</form>

									<!-- Quantity Display -->
									<p
										class="form-control form-control-sm mx-2 text-center quantity-input">
										<%=item.getQuantity()%></p>

									<!-- Increase Quantity Form -->
									<form action="CartServlet" method="post"
										style="display: inline;">
										<input type="hidden" name="itemId"
											value="<%=item.getItemId()%>"> <input type="hidden"
											name="action" value="update"> <input type="hidden"
											name="quantity" value="<%=item.getQuantity() + 1%>">
										<button type="submit"
											class="btn btn-sm btn-outline-secondary rounded-circle mb-2">
											<i class="bi bi-plus"></i>
										</button>
									</form>
								</div>
							</div>




							<div class="col-md-2">
								<h6 class="mb-0 price"><%=item.getPrice() * item.getQuantity()%></h6>

							</div>
							<div class="col-md-2 text-end">

								<form action="CartServlet" method="post"
									style="display: inline;">
									<input type="hidden" name="itemId"
										value="<%=item.getItemId()%>"> <input type="hidden"
										name="action" value="remove"> <input type="hidden"
										name="quantity" value="<%=item.getQuantity() + 1%>">
									<button type="submit"
										class="btn btn-sm btn-outline-danger rounded-circle">
										<i class="bi bi-trash"></i>
									</button>
								</form>

							</div>
						</div>

						<%
						} // End of loop
						} else {
						%>
						<p class="text-center">Your cart is empty.</p>
						<%
						}
						%>




					</div>
				</div>

				<!-- Continue Shopping Button -->
				<div class="d-flex justify-content-between action-buttons mt-3">
					<form action="Resturant" method="post">
						<button type="submit" class="btn btn-outline-danger">
							<i class="bi bi-bag-check me-2"></i>Continue Ordering
						</button>
					</form>

					<form action="CartServlet" method="post" style="display: inline;">
						<input type="hidden" name="action" value="removeAll">
						<button type="submit" class="btn btn-outline-danger">
							<i class="bi bi-trash me-2"></i>Clear Cart
						</button>
					</form>

				</div>
			</div>

			<!-- Bill Details Section -->
			<div class="col-lg-4">
				<div class="card bill-card">
					<div class="card-header bg-primary text-white py-3">
						<h5 class="mb-0 fw-bold">
							<i class="bi bi-receipt me-2"></i>Order Summary
						</h5>
					</div>
					<div class="card-body p-4">
						<div class="d-flex justify-content-between mb-3 bill-item">
							<h6>Subtotal:</h6>
							<h6 class="bill-amount">
								₹
								<%=cart.getTotalPrice()%></h6>
						</div>
						<div class="d-flex justify-content-between mb-3 bill-item">
							<h6>Delivery Fee:</h6>
							<h6 class="bill-amount">₹ 50</h6>
						</div>
						<div class="d-flex justify-content-between mb-3 bill-item">
							<h6>Tax (18%):</h6>
							<h6 class="bill-amount">
								₹
								<%=tax%></h6>
						</div>
						<hr class="my-4">
						<div class="d-flex justify-content-between mb-4 total-section">
							<h5 class="fw-bold">Total:</h5>
							<h5 class="fw-bold total-amount">
								₹
								<%=cart.getTotalPrice() + tax + 50%></h5>
						</div>

						<!-- Delivery Options -->
						<div class="mb-4 delivery-options">
							<h6 class="fw-medium mb-3">Delivery Options</h6>
							<div class="form-check mb-2">
								<input class="form-check-input" type="radio"
									name="deliveryOption" id="deliveryOption1" checked> <label
									class="form-check-label" for="deliveryOption1"> Home
									Delivery </label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="radio"
									name="deliveryOption" id="deliveryOption2"> <label
									class="form-check-label" for="deliveryOption2"> Pickup
									from Restaurant </label>
							</div>
						</div>

						<!-- Coupon Code -->
						<div class="mb-4 coupon-section">
							<label for="couponCode" class="form-label fw-medium">Apply
								Promo Code</label>
							<div class="input-group">
								<input type="text" class="form-control" id="couponCode"
									placeholder="Enter promo code">
								<button class="btn btn-outline-primary" type="button">Apply</button>
							</div>
						</div>

						<!-- Checkout Button -->
						<form action="Checkout.jsp" method="post">
							<button type="submit"
								class="btn btn-success w-100 py-3 checkout-btn">
								<i class="bi bi-bag-check me-2"></i>Proceed to Checkout
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

 <div class="text-center p-4 mt-5 lee">
    © 2025 Copyright:
    <a class="text-reset fw-bold le" href="https://www.linkedin.com/in/shubhverma2000/">FlashFeast.com</a>
  </div>
  
  
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <script type="text/javascript">
	    const userInfo =  JSON.parse(localStorage.getItem("user"));
	    if(!userInfo){
	    	window.location = "/Tap_foods/Login.jsp";
	    }
	    
    </script>
</body>
</html>