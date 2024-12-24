<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Select Company</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 50px;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 30px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2><i class="fas fa-bus"></i> Select Bus Company</h2>
        <form action="payment.jsp" method="POST">
            <input type="hidden" name="departure" value="<%= request.getParameter("departure") %>">
            <input type="hidden" name="destination" value="<%= request.getParameter("destination") %>">
            <div class="mb-3">
                <label for="company" class="form-label"><i class="fas fa-bus"></i> Choose Company</label>
                <select class="form-control" id="company" name="company" required>
                    <option value="">Select Company</option>
                    <%
                        String departureId = request.getParameter("departure");
                        String destinationId = request.getParameter("destination");
                        String url = "jdbc:mysql://localhost:3306/ticket"; // Replace with your DB name
                        String dbUser = "root"; // Your DB username
                        String dbPass = ""; // Your DB password
                        boolean companiesFound = false; // Flag to check if any companies were found
                        
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection conn = DriverManager.getConnection(url, dbUser, dbPass);
                            String query = "SELECT * FROM companies WHERE departure_location_id = ? AND destination_location_id = ?";
                            PreparedStatement stmt = conn.prepareStatement(query);
                            stmt.setString(1, departureId);
                            stmt.setString(2, destinationId);
                            ResultSet rs = stmt.executeQuery();
                            
                            while (rs.next()) {
                                companiesFound = true; // Companies found
                                String companyName = rs.getString("company_name");
                                out.println("<option value='" + rs.getInt("company_id") + "'>" + companyName + "</option>");
                            }
                            
                            if (!companiesFound) {
                                out.println("<option value=''>No companies available for the selected route</option>");
                            }
                            
                            rs.close();
                            stmt.close();
                            conn.close();
                        } catch (Exception e) {
                            out.println("<option value=''>Error retrieving companies</option>");
                            e.printStackTrace();
                        }
                    %>
                </select>
            </div>
            <button type="submit" class="btn btn-primary w-100"><i class="fas fa-credit-card"></i> Proceed to Payment</button>
        </form>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
