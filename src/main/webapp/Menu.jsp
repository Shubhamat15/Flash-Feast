<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page
	import="java.util.List , com.tap.models.Menu , com.tap.models.Cart, com.tap.models.CartItem"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Menu page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="menu.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<style>

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



footer a {
	text-decoration: none;
}

html, body {
	overflow-x: hidden; /* Prevents horizontal scroll */
	margin: 0;
	padding: 0;
}

body{
 font-family: "Roboto", sans-serif;
 background-color: rgb(242, 239, 231);
}

}
</style>
</head>
<body>


	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
		
		<nav class="navbar bg-body-tertiary" style="padding: 0px; margin: 0px;">
    <a class="navbar-brand" href="Resturant" style="padding: 0px; margin: 0px;">
      <img src="ImageResturant/logo2.png" alt="Bootstrap" width="70" height="60" >
    </a>
</nav>
	
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<li class="nav-item">
            <a class="nav-link active"
						aria-current="page" href="Resturant">Home</a></li>
					
						<li class="nav-item"><a class="nav-link" href="#">Restaurants</a>
					</li>
					
					<li class="nav-item"><a class="nav-link" href="/Tap_foods/Resturant#pop">Specials</a>
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
				<div class="d-flex align-items-center">
					<a href="Login.jsp" class="me-3 text-dark"><i
						class="fa-solid fa-user fa-lg"></i></a> 
            <a href="Cart.jsp" class="text-dark"><i
						class="fa-solid fa-cart-shopping fa-lg"></i> <span
						class="position-absolute top-2 end-1 translate-middle badge rounded-pill bg-danger px-2 py-1"
						style="font-size: 10px; transform: translate(50%, -50%);">
							<%
    Cart cart = (Cart) session.getAttribute("cart");
    Integer resturantId = (Integer) session.getAttribute("resturantId");
    float tax = 0.0f;
    if (cart != null && cart.getItems() != null && !cart.getItems().isEmpty()) {
        tax = (5.0f / 100.0f) * cart.getTotalPrice();
        out.print(cart.getTotalItems()); // Properly output the count in JSP
    } else { 
        out.print("0"); // Output 0 when the cart is empty
    }
    %>
					</span> </a>
				</div>
			</div>
		</div>
	</nav>


	<div class="container">
		<div class="row">
			<%
    List<Menu> allMenus = (List<Menu>) request.getAttribute("menus");

    if (allMenus == null || allMenus.isEmpty()) { 
%>
			<div class="col-12 text-center mt-4">
				<h4 class="text-danger">No menus available, please come after
					some time.</h4>
			</div>
			<%
    } else {
        for (Menu r : allMenus) {
%>

			<div class="col-md-4 col-lg-3 mb-4 mt-3">
				<div class="card food-card h-100">
					<div class="position-relative">
						<img src="<%= r.getImagePath() %>" class="card-img-top"
							alt="Food Image">
					</div>
					<div class="card-body">
						<h5
							class="card-title mb-0 d-flex justify-content-between align-items-center">
							<span class="text-truncate"
								style="max-width: 60%; font-size: 1.2rem;"> <%= r.getItemName() %>
							</span> <span
								class="text-light d-flex align-items-center justify-content-center px-2 py-1"
								style="font-size: 0.9rem; background-color: green; border-radius: 8px; min-width: 45px;">
								<%= r.getRatings() %> ★
							</span>
						</h5>

						<p class="card-text description mt-2"><%= r.getDescription() %></p>

						<!-- Price Section -->
						<div
							class="d-flex justify-content-between align-items-center mb-2">
							<span class="" style="font-size: 15px; font-weight: 400;">
								₹<%= r.getPrice() %> for one
							</span>
						</div>

						<!-- Add to Cart Form -->
						<form action="Cart" method="post"
							class="d-flex flex-column align-items-center">
							<input type="hidden" name="resturantId"
								value="<%= request.getParameter("resturantId") %>"> <input
								type="hidden" name="itemId" value="<%= r.getMenuId() %>">
							<input type="number" name="quantity" class="form-control me-2"
								value="1" min="1" required> <input type="hidden"
								name="action" value="add">
							<button type="submit" class="btn btn-primary add-to-cart mt-3">
								<i class="bi bi-cart-plus me-2"></i> Add to Cart
							</button>
						</form>
					</div>
				</div>
			</div>

			<%
        } // End of for loop
    } // End of if-else condition
%>
		</div>
	</div>


	<!-- Footer -->
<footer class="text-center text-lg-start bg-body-tertiary text-muted">
  <!-- Section: Social media -->
  <section class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
    <!-- Left -->
    <div class="me-5 d-none d-lg-block">
      <span>Get connected with us on social networks:</span>
    </div>
    <!-- Left -->

    <!-- Right -->
    <div>
      <a href="" class="me-4 text-reset">
        <i class="fab fa-facebook-f"></i>
      </a>
      <a href="https://www.linkedin.com/in/shubhverma2000/" class="me-4 text-reset">
        <i class="fab fa-twitter"></i>
      </a>
      <a href="https://www.linkedin.com/in/shubhverma2000/" class="me-4 text-reset">
        <i class="fab fa-google"></i>
      </a>
      <a href="" class="me-4 text-reset">
        <i class="fab fa-instagram"></i>
      </a>
      <a href="https://www.linkedin.com/in/shubhverma2000/" class="me-4 text-reset">
        <i class="fab fa-linkedin"></i>
      </a>
      <a href="https://github.com/Shubhamat15" class="me-4 text-reset">
        <i class="fab fa-github"></i>
      </a>
    </div>
    <!-- Right -->
  </section>
  <!-- Section: Social media -->

  <!-- Section: Links  -->
  <section class="">
    <div class="container text-center text-md-start mt-5">
      <!-- Grid row -->
      <div class="row mt-3">
        <!-- Grid column -->
        <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4 ">
          <!-- Content -->
          <h4 class="text-uppercase fw-bold mb-4 text-black">
           <i class="fa-solid fa-utensils me-3"></i>Flash Feast
          </h4>
						<p>Craving something tasty? FlashFeast delivers mouthwatering meals right to your door—whether it’s 
          a quick snack or a gourmet feast, we’ve got you covered with fast, fresh service.
          </p>
        </div>
        <!-- Grid column -->

        <!-- Grid column -->
        <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
  <!-- Links -->
  <h6 class="text-uppercase fw-bold mb-4">
    About Us
  </h6>
  <p>
    <a href="#!" class="text-reset">Our Story</a>
  </p>
  <p>
    <a href="#!" class="text-reset">How It Works</a>
  </p>
  <p>
    <a href="#!" class="text-reset">Why Choose Us</a>
  </p>
  <p>
    <a href="#!" class="text-reset">Customer Reviews</a>
  </p>
</div>

        <!-- Grid column -->

        <!-- Grid column -->
        <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
          <!-- Links -->
          <h6 class="text-uppercase fw-bold mb-4">
            Useful links
          </h6>
          <p>
            <a href="#!" class="text-reset">Pricing</a>
          </p>
          <p>
            <a href="#!" class="text-reset">Settings</a>
          </p>
          <p>
            <a href="#!" class="text-reset">Orders</a>
          </p>
          <p>
            <a href="#!" class="text-reset">Help</a>
          </p>
        </div>
        <!-- Grid column -->

        <!-- Grid column -->
        <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
          <!-- Links -->
          <h6 class="text-uppercase fw-bold mb-4">Contact</h6>
          <p><i class="fas fa-home me-3"></i> BTM Stage-2, Banglore</p>
          <p>
            <i class="fas fa-envelope me-3"></i>
            hello.vshubham@gmail.com
          </p>
          <p><i class="fas fa-phone me-3"></i> + 62 61 23 5698</p>
          <p><i class="fas fa-print me-3"></i> + 81 09 59 3249</p>
        </div>
        <!-- Grid column -->
      </div>
      <!-- Grid row -->
    </div>
  </section>
  <!-- Section: Links  -->

  <!-- Copyright -->
  <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.05);">
    © 2025 Copyright:
    <a class="text-reset fw-bold" href="https://www.linkedin.com/in/shubhverma2000/">FlashFeast.com</a>
  </div>
  <!-- Copyright -->
</footer>
<!-- Footer -->

	<script>
		function addToCart(menuId) {
			var quantity = document.getElementById("quantity_" + menuId).value;
			window.location.href = "Cart?menuId=" + menuId + "&quantity="
					+ quantity;
		}
	</script>
	
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
</body>
</html>
