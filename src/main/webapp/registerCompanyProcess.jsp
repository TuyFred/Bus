<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String companyName = request.getParameter("companyName");
    int departureLocationId = Integer.parseInt(request.getParameter("departureLocation"));
    int destinationLocationId = Integer.parseInt(request.getParameter("destinationLocation"));

    String url = "jdbc:mysql://localhost:3306/ticket"; // Replace with your DB name
    String dbUser = "root"; // Your DB username
    String dbPass = ""; // Your DB password

    Connection conn = null;
    PreparedStatement stmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, dbUser, dbPass);
        
        String query = "INSERT INTO companies (company_name, departure_location_id, destination_location_id) VALUES (?, ?, ?)";
        stmt = conn.prepareStatement(query);
        stmt.setString(1, companyName);
        stmt.setInt(2, departureLocationId);
        stmt.setInt(3, destinationLocationId);
        
        int rowsInserted = stmt.executeUpdate();
        if (rowsInserted > 0) {
            // Redirect to the admin dashboard page on success
            response.sendRedirect("admin-dashboard.jsp");
        } else {
            out.println("<h3>Error registering company.</h3>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<h3>Error: " + e.getMessage() + "</h3>");
    } finally {
        if (stmt != null) {
            stmt.close();
        }
        if (conn != null) {
            conn.close();
        }
    }
%>
