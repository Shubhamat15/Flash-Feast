<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ page import="java.util.List , com.tap.models.Resturant"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Flash Feast</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<link rel ="stylesheet" href="resturant.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
<style>
footer a {
	text-decoration: none;
}

body{
 font-family: "Roboto", sans-serif;
 background-color: rgb(242, 239, 231);
}

.custom-tooltip .tooltip-inner {
    font-size: 12px !important; /* Adjust font size */
    
    color: white !important; /* Change text color */
    background-color: #ff5200 !important; /* Dark background */
    padding: 8px 12px !important; /* Adjust padding */
    border-radius: 6px !important; /* Rounded corners */
    
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
    <a class="navbar-brand" href="/Tap_foods/Resturant" style="padding: 0px; margin: 0px;">
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
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0 me-4">
				
					<li class="nav-item"><a class="nav-link"
						aria-current="page" href="#">Home</a>
					</li>
					
					<li class="nav-item"><a class="nav-link" href="#main">Restaurants</a>
					</li>
					
					<li class="nav-item"><a class="nav-link" href="#pop">Specials</a>
					</li>
					
					
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
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
    <a href="Login.jsp" class="me-3 text-dark mitha" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Sign In / Sign Out " data-bs-custom-class="custom-tooltip">
        <i class="fa-solid fa-user fa-lg"></i>
    </a> 
    <a href="Cart.jsp" class="text-dark" data-bs-toggle="tooltip" data-bs-placement="bottom" title="View Cart" data-bs-custom-class="custom-tooltip">
        <i class="fa-solid fa-cart-shopping fa-lg"></i>
    </a>
</div>

			</div>
		</div>
	</nav>
	
	
<div class="heading">
    <p>Popular items</p>
  </div>
  
  
	  <div class="container_popular" id ="pop">

    <section class="cardsss">
      <article class="cards cards--1">
        <div class="cards__info-hover">
          <svg class="cards__like"  viewBox="0 0 24 24">
          <path fill="#000000" d="M12.1,18.55L12,18.65L11.89,18.55C7.14,14.24 4,11.39 4,8.5C4,6.5 5.5,5 7.5,5C9.04,5 10.54,6 11.07,7.36H12.93C13.46,6 14.96,5 16.5,5C18.5,5 20,6.5 20,8.5C20,11.39 16.86,14.24 12.1,18.55M16.5,3C14.76,3 13.09,3.81 12,5.08C10.91,3.81 9.24,3 7.5,3C4.42,3 2,5.41 2,8.5C2,12.27 5.4,15.36 10.55,20.03L12,21.35L13.45,20.03C18.6,15.36 22,12.27 22,8.5C22,5.41 19.58,3 16.5,3Z" />
      </svg>
            <div class="cards__clock-info">
              <svg class="cards__clock"  viewBox="0 0 24 24"><path d="M12,20A7,7 0 0,1 5,13A7,7 0 0,1 12,6A7,7 0 0,1 19,13A7,7 0 0,1 12,20M19.03,7.39L20.45,5.97C20,5.46 19.55,5 19.04,4.56L17.62,6C16.07,4.74 14.12,4 12,4A9,9 0 0,0 3,13A9,9 0 0,0 12,22C17,22 21,17.97 21,13C21,10.88 20.26,8.93 19.03,7.39M11,14H13V8H11M15,1H9V3H15V1Z" />
              </svg><span class="cards__time">15 min</span>
            </div>
          
        </div>
        <div class="cards__img"></div>
        <a href="#" class="cards_link">
           <div class="cards__img--hover"></div>
         </a>
        <div class="cards__info">
          <span class="cards__category"> Recipe</span>
          <h3 class="cards__title">Crisp Spanish tortilla Matzo brei</h3>
          <span class="cards__by">by <a href="#" class="cards__author" title="author">Celeste Mills</a></span>
        </div>
      </article>
        
        
      <article class="cards cards--1">
        <div class="cards__info-hover">
          <svg class="cards__like"  viewBox="0 0 24 24">
          <path fill="#000000" d="M12.1,18.55L12,18.65L11.89,18.55C7.14,14.24 4,11.39 4,8.5C4,6.5 5.5,5 7.5,5C9.04,5 10.54,6 11.07,7.36H12.93C13.46,6 14.96,5 16.5,5C18.5,5 20,6.5 20,8.5C20,11.39 16.86,14.24 12.1,18.55M16.5,3C14.76,3 13.09,3.81 12,5.08C10.91,3.81 9.24,3 7.5,3C4.42,3 2,5.41 2,8.5C2,12.27 5.4,15.36 10.55,20.03L12,21.35L13.45,20.03C18.6,15.36 22,12.27 22,8.5C22,5.41 19.58,3 16.5,3Z" />
      </svg>
            <div class="cards__clock-info">
              <svg class="cards__clock"  viewBox="0 0 24 24"><path d="M12,20A7,7 0 0,1 5,13A7,7 0 0,1 12,6A7,7 0 0,1 19,13A7,7 0 0,1 12,20M19.03,7.39L20.45,5.97C20,5.46 19.55,5 19.04,4.56L17.62,6C16.07,4.74 14.12,4 12,4A9,9 0 0,0 3,13A9,9 0 0,0 12,22C17,22 21,17.97 21,13C21,10.88 20.26,8.93 19.03,7.39M11,14H13V8H11M15,1H9V3H15V1Z" />
              </svg><span class="cards__time">15 min</span>
            </div>
          
        </div>
        <div class="cards__img"></div>
        <a href="#" class="cards_link">
           <div class="cards__img--hover"></div>
         </a>
        <div class="cards__info">
          <span class="cards__category"> Recipe</span>
          <h3 class="cards__title">Crisp Spanish tortilla Matzo brei</h3>
          <span class="cards__by">by <a href="#" class="cards__author" title="author">Celeste Mills</a></span>
        </div>
      </article>


      <article class="cards cards--1">
        <div class="cards__info-hover">
          <svg class="cards__like"  viewBox="0 0 24 24">
          <path fill="#000000" d="M12.1,18.55L12,18.65L11.89,18.55C7.14,14.24 4,11.39 4,8.5C4,6.5 5.5,5 7.5,5C9.04,5 10.54,6 11.07,7.36H12.93C13.46,6 14.96,5 16.5,5C18.5,5 20,6.5 20,8.5C20,11.39 16.86,14.24 12.1,18.55M16.5,3C14.76,3 13.09,3.81 12,5.08C10.91,3.81 9.24,3 7.5,3C4.42,3 2,5.41 2,8.5C2,12.27 5.4,15.36 10.55,20.03L12,21.35L13.45,20.03C18.6,15.36 22,12.27 22,8.5C22,5.41 19.58,3 16.5,3Z" />
      </svg>
            <div class="cards__clock-info">
              <svg class="cards__clock"  viewBox="0 0 24 24"><path d="M12,20A7,7 0 0,1 5,13A7,7 0 0,1 12,6A7,7 0 0,1 19,13A7,7 0 0,1 12,20M19.03,7.39L20.45,5.97C20,5.46 19.55,5 19.04,4.56L17.62,6C16.07,4.74 14.12,4 12,4A9,9 0 0,0 3,13A9,9 0 0,0 12,22C17,22 21,17.97 21,13C21,10.88 20.26,8.93 19.03,7.39M11,14H13V8H11M15,1H9V3H15V1Z" />
              </svg><span class="cards__time">15 min</span>
            </div>
          
        </div>
        <div class="cards__img"></div>
        <a href="#" class="cards_link">
           <div class="cards__img--hover"></div>
         </a>
        <div class="cards__info">
          <span class="cards__category"> Recipe</span>
          <h3 class="cards__title">Crisp Spanish tortilla Matzo brei</h3>
          <span class="cards__by">by <a href="#" class="cards__author" title="author">Celeste Mills</a></span>
        </div>
      </article>


      <article class="cards cards--1">
        <div class="cards__info-hover">
          <svg class="cards__like"  viewBox="0 0 24 24">
          <path fill="#000000" d="M12.1,18.55L12,18.65L11.89,18.55C7.14,14.24 4,11.39 4,8.5C4,6.5 5.5,5 7.5,5C9.04,5 10.54,6 11.07,7.36H12.93C13.46,6 14.96,5 16.5,5C18.5,5 20,6.5 20,8.5C20,11.39 16.86,14.24 12.1,18.55M16.5,3C14.76,3 13.09,3.81 12,5.08C10.91,3.81 9.24,3 7.5,3C4.42,3 2,5.41 2,8.5C2,12.27 5.4,15.36 10.55,20.03L12,21.35L13.45,20.03C18.6,15.36 22,12.27 22,8.5C22,5.41 19.58,3 16.5,3Z" />
      </svg>
            <div class="cards__clock-info">
              <svg class="cards__clock"  viewBox="0 0 24 24"><path d="M12,20A7,7 0 0,1 5,13A7,7 0 0,1 12,6A7,7 0 0,1 19,13A7,7 0 0,1 12,20M19.03,7.39L20.45,5.97C20,5.46 19.55,5 19.04,4.56L17.62,6C16.07,4.74 14.12,4 12,4A9,9 0 0,0 3,13A9,9 0 0,0 12,22C17,22 21,17.97 21,13C21,10.88 20.26,8.93 19.03,7.39M11,14H13V8H11M15,1H9V3H15V1Z" />
              </svg><span class="cards__time">15 min</span>
            </div>
          
        </div>
        <div class="cards__img"></div>
        <a href="#" class="cards_link">
           <div class="cards__img--hover"></div>
         </a>
        <div class="cards__info">
          <span class="cards__category"> Recipe</span>
          <h3 class="cards__title">Crisp Spanish tortilla Matzo brei</h3>
          <span class="cards__by">by <a href="#" class="cards__author" title="author">Celeste Mills</a></span>
        </div>
      </article>
        
        
        
        </section>
  </div>
	
	
	<div class="container-fluid" id="main">
	
	

		<section style="background-color: #eee;">
			<div class="container py-5">
			
			<div class="heading mb-3">
    <p>Discover the best restaurant chains in Bengaluru!</p>
  </div>
				<div class="row">
					<%-- Example Product Card (Repeat for multiple products) --%>
					
					<%
      List<Resturant> allResturants = (List<Resturant>)request.getAttribute("resturants");

     for(Resturant r : allResturants){
                     %>
                  
					<div class="col-md-4 col-lg-4 mb-4 mt-4 ">
						<!-- Adjusted the column size to have cards side by side -->
						<a href="menu?resturantId=<%= r.getResturantId() %>">
						<div class="card">
							<img src="<%= r.getImagePath() %>" class="card-img-top karna" alt="Restaurant Image">

							<div class="card-body">
								<div class="d-flex justify-content-start">
									<p class="small">
										<a href="#!" class="text-muted" style="text-decoration: none;"><%=r.getCuisineType() %></a> 
									</p>

								</div>
								<div class="d-flex justify-content-between mb-3">
									<h5 class="mb-0">  <%= r.getName()   %>  </h5>
									<h6 class="text-dark mb-0">20 Min</h6>
								</div>
								<div class="d-flex justify-content-between align-items-center mb-2">
    <p class="text-muted mb-0">
        Available <span class="fw-bold"></span>
    </p>
    <div class="text-white d-flex align-items-center justify-content-center px-2 py-1" 
     style="font-size: 0.9rem; background-color: green; border-radius: 8px; min-width: 55px; font-weight: 500;">
    <%= r.getRating() %> ★
    
</div>

</div>

							</div>
						</div>
					</a>
					</div>
					
					<%
}
%>

					
					<!-- Add more cards here as needed -->

				</div>
			</div>
		</section>

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

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
		
		<script type="text/javascript">
		  // Store it in localStorage
		  
		const params = new URLSearchParams(window.location.search);
		const user= params.get("user");
		console.log(user);
	    localStorage.setItem("user", JSON.stringify(user));
		</script>
		
		<script>
		document.addEventListener("DOMContentLoaded", function () {
		    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
		    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
		        return new bootstrap.Tooltip(tooltipTriggerEl);
		    });
		});

		</script>
</body>
</html>
