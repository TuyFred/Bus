<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String departureId = request.getParameter("departure");
    String destinationId = request.getParameter("destination");

    String url = "jdbc:mysql://localhost:3306/your_database"; // Replace with your DB name
    String dbUser = "root"; // Your DB username
    String dbPass = ""; // Your DB password

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, dbUser, dbPass);
        String query = "SELECT * FROM companies WHERE departure_location_id = ? AND destination_location_id = ?";
        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setInt(1, Integer.parseInt(departureId));
        stmt.setInt(2, Integer.parseInt(destinationId));
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            String companyName = rs.getString("company_name");
            int companyId = rs.getInt("company_id");
            Time duration = rs.getTime("route_duration");
            out.println("<option value='" + companyId + "'>" + companyName + " (Duration: " + duration + ")</option>");
        }
        
        rs.close();
        stmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
