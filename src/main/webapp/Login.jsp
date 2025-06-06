<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | My Food App</title>
    
    <style>
        /* Global Body Styling */
        body {
            position: relative;
            background-color: #f3f3f3;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
            overflow: hidden;
        }

        /* Background Image with Blur Effect */
        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: url('https://img.freepik.com/premium-photo/fresh-vegetables-detox-diet-concept-dark-background-with-fresh-vegetables-empty-cooking-pan-symbolizing-concept-eating-healthy-food-weight-loss_1188164-3456.jpg?semt=ais_hybrid');
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;
            filter: blur(5px); /* Adjust the blur radius as needed */
            z-index: -1; /* Ensures the background stays behind the content */
        }

        /* Wrapper Container Styling */
        .wrapper {
            width: 400px;
            padding: 30px;
            text-align: center;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 8px;
            backdrop-filter: blur(8px);
            -webkit-backdrop-filter: blur(8px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Heading Style */
        h2 {
            font-size: 1.8rem;
            margin-bottom: 20px;
            color: #333;
        }

        /* Input Field Styling */
        .input-field {
            position: relative;
            margin: 15px 0;
        }

        .input-field input {
            width: 100%;
            padding: 10px;
            background: transparent;
            border: 2px solid #ccc;
            border-radius: 4px;
            outline: none;
            font-size: 16px;
            color: #333;
        }

        .input-field input:focus {
            border-color: #0066cc;
        }

        .input-field label {
            position: absolute;
            top: 0;
            left: 0;
            padding: 10px;
            font-size: 16px;
            color: #666;
            pointer-events: none;
            transition: 0.3s;
        }

        /* Label Animations */
        .input-field input:focus + label,
        .input-field input:valid + label {
            top: -25px;
            left: 0;
            font-size: 12px;
            color: #0066cc;
        }

        /* Remember Me Section Styling */
        .forget {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin: 25px 0 35px 0;
            color: #333;
        }

        #remember {
            accent-color: #fff;
        }

        .forget a {
            color: #0066cc;
            text-decoration: none;
            font-size: 14px;
        }

        .forget a:hover {
            text-decoration: underline;
        }

        /* Button Styling */
        button {
            background: #0066cc;
            color: white;
            font-weight: 600;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: 0.3s ease;
            width: 100%;
        }

        button:hover {
            background: #004d99;
        }

        /* Responsive Styles */
        @media (max-width: 600px) {
            .wrapper {
                width: 90%;
                padding: 20px;
            }
        }
    </style>
</head>
<body>

    <div class="wrapper">
        
        <form action="Login" method="POST">
        
        
            <h2>Login</h2>

            <div class="input-field">
                <input type="text" name="Email" required>
                <label for="Email">Enter your email</label>
            </div>
            
            <div class="input-field">
                <input type="password" name="password" required>
                <label for="password">Enter your password</label>
            </div>
            
            <div class="forget">
                <label for="remember">
                    <input type="checkbox" id="remember">
                    <p>Remember me</p>
                </label>
                <a href="#">Forgot password?</a>
            </div>
            
            <button type="submit">Log In</button>
            
            
            <div class="input-field">
                	<a href="Registration.jsp">Register here</a>              
              </div>
        </form>
        
       
    </div>

</body>
</html>
