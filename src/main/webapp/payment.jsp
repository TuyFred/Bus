<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Center the form on the page */
        .payment-container {
            max-width: 500px;
            margin: 50px auto;
            padding: 2rem;
            background-color: #f8f9fa;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .form-title {
            color: #007bff;
        }
    </style>
</head>
<body style="background-color: #e9ecef;">

    <div class="container payment-container">
        <h2 class="form-title text-center mb-4">Payment Method</h2>
        <form action="payment.jsp" method="POST">
            <input type="hidden" name="company" value="<%= request.getParameter("company") %>">
            <input type="hidden" name="departure" value="<%= request.getParameter("departure") %>">
            <input type="hidden" name="destination" value="<%= request.getParameter("destination") %>">

            <div class="mb-3">
                <label for="paymentMethod" class="form-label">Select Payment Method</label>
                <select class="form-control" id="paymentMethod" name="paymentMethod" required>
                    <option value="bank">Bank Account</option>
                    <option value="mtn">MTN Mobile Money</option>
                </select>
            </div>

            <%
                // Calculate price based on departure and destination
                String departureId = request.getParameter("departure");
                String destinationId = request.getParameter("destination");
                int price = 0;

                // Price mapping (adjust as needed)
                if ("1".equals(departureId) && "2".equals(destinationId)) { // Nyabugogo to Rwamagana
                    price = 2000;
                } else if ("2".equals(departureId) && "3".equals(destinationId)) { // Example for another route
                    price = 2500; 
                }
                // Add more routes as needed

                // Display price information
                out.println("<p class='text-center'><strong>Amount to be paid: " + price + " FRW</strong></p>");
            %>

            <button type="submit" class="btn btn-primary w-100 mt-3">Complete Payment</button>
        </form>

        <%
            // After form submission, show instructions based on payment method
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                String paymentMethod = request.getParameter("paymentMethod");

                if ("bank".equals(paymentMethod)) {
                    out.println("<div class='mt-4'><h5 class='text-success'>Payment by Bank Account</h5>");
                    out.println("<p>Please transfer " + price + " FRW to the following account:</p>");
                    out.println("<p><strong>Account Number:</strong> 1234567890</p>");
                    out.println("<p><strong>Bank:</strong> Rwanda Bank</p></div>");
                } else if ("mtn".equals(paymentMethod)) {
                    out.println("<div class='mt-4'><h5 class='text-success'>Payment by MTN Mobile Money</h5>");
                    out.println("<p>Please send " + price + " FRW to the following Mobile Money number:</p>");
                    out.println("<p><strong>MTN Number:</strong> +250 78 123 4567</p></div>");
                }

                out.println("<p class='text-center mt-3'>After payment, you may receive a confirmation via email.</p>");
            }
        %>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
