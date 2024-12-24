<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book a Ticket</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            background-color: #f0f4f8;
        }
        .container {
            max-width: 500px;
            margin-top: 50px;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 1.8rem;
            color: #343a40;
        }
        .form-label {
            font-weight: bold;
            font-size: 0.9rem;
            color: #495057;
        }
        .form-control {
            font-size: 0.9rem;
            padding: 0.5rem;
        }
        .btn-primary {
            background-color: #28a745;
            border: none;
            padding: 0.5rem;
        }
        .btn-primary:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <div class="container col-md-6">
        <h2><i class="fas fa-bus"></i> Book Your Bus Ticket</h2>
        <form action="book-process.jsp" method="POST">
            <div class="mb-3">
                <label for="customerName" class="form-label"><i class="fas fa-user"></i> Full Name</label>
                <input type="text" class="form-control" id="customerName" name="customerName" placeholder="Enter your name" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label"><i class="fas fa-envelope"></i> Email Address</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
            </div>
            <div class="mb-3">
                <label for="departure" class="form-label"><i class="fas fa-map-marker-alt"></i> Departure Location</label>
                <select class="form-control" id="departure" name="departure" onchange="fetchCompanies()" required>
                    <option value="">Select Departure</option>
                    <%
                        String url = "jdbc:mysql://localhost:3306/your_database";
                        String dbUser = "root";
                        String dbPass = "";
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection conn = DriverManager.getConnection(url, dbUser, dbPass);
                            String query = "SELECT * FROM locations";
                            PreparedStatement stmt = conn.prepareStatement(query);
                            ResultSet rs = stmt.executeQuery();
                            while (rs.next()) {
                                String location = rs.getString("location_name");
                                out.println("<option value='" + rs.getInt("location_id") + "'>" + location + "</option>");
                            }
                            rs.close();
                            stmt.close();
                            conn.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                            out.println("<option value=''>Error loading locations</option>");
                        }
                    %>
                </select>
            </div>
            <div class="mb-3">
                <label for="destination" class="form-label"><i class="fas fa-map-marker-alt"></i> Destination Location</label>
                <select class="form-control" id="destination" name="destination" required>
                    <option value="">Select Destination</option>
                    <%
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection conn = DriverManager.getConnection(url, dbUser, dbPass);
                            String query = "SELECT * FROM locations";
                            PreparedStatement stmt = conn.prepareStatement(query);
                            ResultSet rs = stmt.executeQuery();
                            while (rs.next()) {
                                String location = rs.getString("location_name");
                                out.println("<option value='" + rs.getInt("location_id") + "'>" + location + "</option>");
                            }
                            rs.close();
                            stmt.close();
                            conn.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                            out.println("<option value=''>Error loading locations</option>");
                        }
                    %>
                </select>
            </div>
            <button type="submit" class="btn btn-primary w-100"><i class="fas fa-bus"></i> Book Ticket</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
