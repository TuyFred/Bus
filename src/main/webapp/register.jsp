<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - TicketMaster</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body, html {
            height: 100%;
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            background-color: #f5f5f5;
        }
        .bg-image {
            background-image: url('https://example.com/background.jpg'); /* Add your preferred image URL */
            filter: blur(8px);
            -webkit-filter: blur(8px);
            height: 100%; 
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }
        .form-container {
            max-width: 500px;
            margin: 100px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }
        .form-container h2 {
            margin-bottom: 20px;
            color: #007bff;
            text-align: center;
        }
        .form-container .form-label {
            font-weight: bold;
        }
        .form-container .form-control {
            margin-bottom: 15px;
        }
        .form-container .btn {
            font-size: 16px;
            padding: 10px;
        }
        .social-icons a {
            margin: 0 10px;
            color: #007bff;
            font-size: 1.5rem;
        }
        .social-icons a:hover {
            color: #0056b3;
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="form-container">
            <h2><i class="fas fa-user-plus"></i> Register</h2>
            <form action="register-process.jsp" method="POST">
                <div class="mb-3">
                    <label for="firstName" class="form-label"><i class="fas fa-user"></i> First Name</label>
                    <input type="text" class="form-control" id="firstName" name="firstName" placeholder="Enter your first name" required>
                </div>
                <div class="mb-3">
                    <label for="lastName" class="form-label"><i class="fas fa-user"></i> Last Name</label>
                    <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Enter your last name" required>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label"><i class="fas fa-envelope"></i> Email Address</label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label"><i class="fas fa-lock"></i> Password</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="Create a password" required>
                </div>
                <div class="mb-3">
                    <label for="confirmPassword" class="form-label"><i class="fas fa-lock"></i> Confirm Password</label>
                    <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Confirm your password" required>
                </div>
                <div class="mb-3">
                    <label for="phone_number" class="form-label"><i class="fas fa-phone"></i> Phone Number (optional)</label>
                    <input type="text" class="form-control" id="phone_number" name="phone_number" placeholder="Enter your phone number (optional)">
                </div>
                <button type="submit" class="btn btn-primary w-100"><i class="fas fa-user-plus"></i> Register</button>
                <button type="button" class="btn btn-secondary w-100 mt-2" onclick="window.location.href='home.jsp';"><i class="fas fa-home"></i> Back to Home</button>
                <p class="text-center mt-3">Already have an account? <a href="login.jsp"><i class="fas fa-sign-in-alt"></i> Login here</a></p>
            </form>
            <hr>
            <div class="text-center">
                <p>Or sign up with</p>
                <div class="social-icons">
                    <a href="#"><i class="fab fa-facebook"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-google"></i></a>
                    <a href="#"><i class="fab fa-linkedin"></i></a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
