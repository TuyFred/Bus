<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .dashboard-header {
            background-color: #007bff;
            color: white;
            padding: 20px;
            text-align: center;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        .dashboard-content {
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .btn-custom {
            background-color: #007bff;
            color: white;
        }
        .btn-custom:hover {
            background-color: #0056b3;
        }
        .icon {
            font-size: 24px;
            margin-right: 10px;
        }
        .logout-btn {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <div class="dashboard-header">
            <h1><i class="fas fa-user-circle"></i> User Dashboard</h1>
            <p>Welcome, <strong><%= session.getAttribute("userEmail") %></strong></p>
        </div>
        <div class="dashboard-content">
            <h4><i class="fas fa-info-circle icon"></i> Account Information</h4>
            <p><strong>User Role:</strong> <%= session.getAttribute("userRole") %></p>
            <p><strong>Email:</strong> <%= session.getAttribute("userEmail") %></p>

            <hr>

            <h4><i class="fas fa-ticket-alt icon"></i> Your Bookings</h4>
            <p>You have no bookings at the moment.</p>
            <!-- You can add a table here to list bookings -->
            <a href="book-ticket.jsp" class="btn btn-custom"><i class="fas fa-plane-departure"></i> Book a Ticket</a>
            <a href="view-bookings.jsp" class="btn btn-custom"><i class="fas fa-list-alt"></i> View Bookings</a>

            <div class="logout-btn">
                <a href="logout.jsp" class="btn btn-danger"><i class="fas fa-sign-out-alt"></i> Logout</a>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
