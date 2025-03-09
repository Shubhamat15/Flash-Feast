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
    <title>Checkout Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="Checkout.css">
  </head>
  <body>
    <div class="container py-5">
      <h1 class="mb-4 text-center">Checkout</h1>
      
      <div class="row">
        <div class="col-md-8 mx-auto">
          <div class="card mb-4">
            <div class="card-header d-flex align-items-center">
              <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="me-2"><circle cx="8" cy="21" r="1"/><circle cx="19" cy="21" r="1"/><path d="M2.05 2.05h2l2.66 12.42a2 2 0 0 0 2 1.58h9.78a2 2 0 0 0 1.95-1.57l1.65-7.43H5.12"/></svg>
              <h5 class="mb-0">Your Order</h5>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-hover">
                  <thead>
                    <tr>
                      <th scope="col">Item</th>
                      <th scope="col">Unit Price</th>
                      <th scope="col">Quantity</th>
                      <th scope="col">Subtotal</th>
                    </tr>
                  </thead>
                  <tbody>
                  
               		<%
    Cart cart = (Cart) session.getAttribute("cart");

    float total = 0.0f; // Used to accumulate the total price of items
    float tax = 0.0f; // Tax amount
    float last = 0.0f; // Final total including tax and delivery fee
    float deliveryFee = 50.0f; // Fixed delivery fee

    if (cart != null && cart.getItems() != null && !cart.getItems().isEmpty()) {
        for (CartItem item : cart.getItems().values()) {
            double itemSubtotal = item.getPrice() * item.getQuantity(); // New variable to store individual item total
            total += itemSubtotal; // Accumulate total
%>
            <tr>
                <td><h6 class="mb-0"><%= item.getName() %></h6></td>
                <td>₹ <%= item.getPrice() %></td>
                <td><%= item.getQuantity() %></td>
                <td>₹ <%= itemSubtotal %></td>
            </tr>
<%
        } // End of loop

        // Correcting tax calculation (assuming 8% tax as per the footer)
        tax = (18.0f / 100.0f) * (float) total;
        last = (float) total + tax + deliveryFee; // Correct final total calculation
    }
%>
               		
                   
                  </tbody>
                  <tfoot>
    <tr>
        <td colspan="3" class="text-end"><strong>Subtotal:</strong></td>
        <td>₹ <%= total %></td> <!-- Corrected subtotal display -->
    </tr>
    <tr>
        <td colspan="3" class="text-end"><strong>Tax (18%):</strong></td>
        <td>₹ <%= tax %></td> <!-- Now correctly using 8% -->
    </tr>
    <tr>
        <td colspan="3" class="text-end"><strong>Delivery Fee:</strong></td>
        <td>₹ <%= deliveryFee %></td> <!-- Using the deliveryFee variable -->
    </tr>
    <tr>
        <td colspan="3" class="text-end"><strong>Total:</strong></td>
        <td><strong>₹ <%= last %></strong></td> <!-- Now correctly displaying final total -->
    </tr>
</tfoot>
                  
                </table>
              </div>
            </div>
          </div>

          <div class="card mb-4">
            <div class="card-header d-flex align-items-center">
              <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="me-2"><path d="m3 9 9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/><polyline points="9 22 9 12 15 12 15 22"/></svg>
              <h5 class="mb-0">Personal Information</h5>
            </div>
            <div class="card-body">
              <form>
                <div class="row mb-3">
                  <div class="col-md-6">
                    <label for="firstName" class="form-label">First Name</label>
                    <input type="text" class="form-control" id="firstName" required>
                  </div>
                  <div class="col-md-6">
                    <label for="lastName" class="form-label">Last Name</label>
                    <input type="text" class="form-control" id="lastName" required>
                  </div>
                </div>
                <div class="mb-3">
                  <label for="email" class="form-label">Email</label>
                  <input type="email" class="form-control" id="emaill" required>
                </div>
                <div class="mb-3">
                  <label for="phone" class="form-label">Phone Number</label>
                  <input type="tel" class="form-control" id="phone" required>
                </div>
              </form>
            </div>
          </div>

          <div class="card mb-4">
            <div class="card-header d-flex align-items-center">
              <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="me-2"><circle cx="8" cy="18" r="4"/><path d="M12 18h.01"/><path d="M12 6V2h4"/><path d="M16 6h2a2 2 0 0 1 2 2v8"/><path d="M22 18h.01"/><path d="M17 18h.01"/><path d="M2 9h10"/><path d="M2 13h7"/><path d="M2 5h4"/></svg>
              <h5 class="mb-0">Delivery Details</h5>
            </div>
            <div class="card-body">
              <form>
                <div class="mb-3">
                  <label for="address" class="form-label">Address</label>
                  <input type="text" class="form-control" id="address" required>
                </div>
                <div class="row mb-3">
                  <div class="col-md-6">
                    <label for="city" class="form-label">City</label>
                    <input type="text" class="form-control" id="city" required>
                  </div>
                  <div class="col-md-3">
                    <label for="state" class="form-label">State</label>
                    <select class="form-select" id="state" required>
                      <option value="">Choose...</option>
                      <option>California</option>
                      <option>New York</option>
                      <option>Texas</option>
                      <option>Florida</option>
                      <option>Illinois</option>
                    </select>
                  </div>
                  <div class="col-md-3">
                    <label for="zip" class="form-label">Zip</label>
                    <input type="text" class="form-control" id="zip" required>
                  </div>
                </div>
              </form>
            </div>
          </div>

          <div class="card mb-4">
            <div class="card-header d-flex align-items-center">
              <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="me-2"><rect width="20" height="14" x="2" y="5" rx="2"/><line x1="2" x2="22" y1="10" y2="10"/></svg>
              <h5 class="mb-0">Payment Method</h5>
            </div>
            <div class="card-body">
              <form action="Checkout" method="post">
			    <div class="mb-3">
			        <label class="form-label">Select Payment Method</label>
			        <select class="form-select" name="paymentMethod" required>
			            <option value="">Choose payment method...</option>
			            <option value="cod">Cash on Delivery (COD)</option>
			            <option value="credit">Credit Card</option>
			            <option value="debit">Debit Card</option>
			            <option value="paypal">PayPal</option>
			            <option value="upi">UPI</option>
			        </select>
			        
			  		<input type="text" name="email" id="email" class="dummyInputBox" style="display: none;">

			    </div>
			
			    <div class="d-grid">
			        <button type="submit" id="placeOrder" class="btn btn-primary py-3">Place Order</button>
			    </div>
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript">
		   const retrievedUser = JSON.parse(localStorage.getItem("user"));
		    
		   const email =  document.getElementById("email");
		   email.value = retrievedUser ;

      
    		    
		    
		    
		    
		    
		    
    </script>
    
  
  </body>
</html>