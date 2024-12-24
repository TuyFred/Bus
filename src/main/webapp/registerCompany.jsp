<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Company</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h2>Register Company</h2>
        <form action="registerCompanyProcess.jsp" method="POST">
            <div class="mb-3">
                <label for="companyName" class="form-label">Company Name</label>
                <input type="text" class="form-control" id="companyName" name="companyName" required>
            </div>
            <div class="mb-3">
                <label for="departureLocation" class="form-label">Departure Location</label>
                <select class="form-control" id="departureLocation" name="departureLocation" required>
                    <option value="">Select Departure Location</option>
                    <%
                        // Connect to the database and fetch locations
                        String url = "jdbc:mysql://localhost:3306/ticket"; // Replace with your DB name
                        String dbUser = "root"; // Your DB username
                        String dbPass = ""; // Your DB password

                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection conn = DriverManager.getConnection(url, dbUser, dbPass);
                            String query = "SELECT * FROM locations";
                            PreparedStatement stmt = conn.prepareStatement(query);
                            ResultSet rs = stmt.executeQuery();
                            while (rs.next()) {
                                String locationName = rs.getString("location_name");
                                int locationId = rs.getInt("location_id");
                                out.println("<option value='" + locationId + "'>" + locationName + "</option>");
                            }
                            rs.close();
                            stmt.close();
                            conn.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                </select>
            </div>
            <div class="mb-3">
                <label for="destinationLocation" class="form-label">Destination Location</label>
                <select class="form-control" id="destinationLocation" name="destinationLocation" required>
                    <option value="">Select Destination Location</option>
                    <%
                        // Reconnect to fetch destination locations
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection conn = DriverManager.getConnection(url, dbUser, dbPass);
                            String query = "SELECT * FROM locations";
                            PreparedStatement stmt = conn.prepareStatement(query);
                            ResultSet rs = stmt.executeQuery();
                            while (rs.next()) {
                                String locationName = rs.getString("location_name");
                                int locationId = rs.getInt("location_id");
                                out.println("<option value='" + locationId + "'>" + locationName + "</option>");
                            }
                            rs.close();
                            stmt.close();
                            conn.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Register</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
