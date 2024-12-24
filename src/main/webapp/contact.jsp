<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            background-color: #f8f9fa;
            margin: 0;
        }
        .container {
            width: 100%;
            max-width: 600px;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .form-container h2 {
            text-align: center;
            margin-bottom: 15px;
            font-size: 1.5rem;
        }
        .form-label {
            font-weight: bold;
            font-size: 0.9rem;
        }
        .form-control {
            font-size: 0.9rem;
            padding: 8px;
        }
        .btn {
            font-size: 1rem;
            padding: 10px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="form-container">
            <h2><i class="fas fa-envelope"></i> Contact Us</h2>
            
            <div class="mb-2">
                <label for="contactName" class="form-label"><i class="fas fa-user"></i> Full Name</label>
                <input type="text" class="form-control" id="contactName" name="contactName" placeholder="Your Name" required>
            </div>
            
            <div class="mb-2">
                <label for="contactEmail" class="form-label"><i class="fas fa-envelope"></i> Email</label>
                <input type="email" class="form-control" id="contactEmail" name="contactEmail" placeholder="Your Email" required>
            </div>
            
            <div class="mb-2">
                <label for="contactSubject" class="form-label"><i class="fas fa-tag"></i> Subject</label>
                <input type="text" class="form-control" id="contactSubject" name="contactSubject" placeholder="Subject" required>
            </div>
            
            <div class="mb-2">
                <label for="contactMessage" class="form-label"><i class="fas fa-comment"></i> Message</label>
                <textarea class="form-control" id="contactMessage" name="contactMessage" rows="3" placeholder="Your Message" required></textarea>
            </div>
            
            <button type="submit" class="btn btn-primary w-100"><i class="fas fa-paper-plane"></i> Send Message</button>
            <a href="index.html" class="btn btn-secondary w-100 mt-2"><i class="fas fa-home"></i> Back to Home</a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
