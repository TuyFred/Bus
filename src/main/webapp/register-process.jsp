<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    // Database connection parameters
    String url = "jdbc:mysql://localhost:3306/ticket"; // Replace with your database name
    String dbUser = "root"; // Replace with your database username
    String dbPass = ""; // Replace with your database password

    // Get user input from the form
    String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String phoneNumber = request.getParameter("phone_number"); // Optional
    String role = "User"; // Default role

    Connection conn = null;
    PreparedStatement stmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver"); // Load the JDBC driver
        conn = DriverManager.getConnection(url, dbUser, dbPass); // Establish connection
        
        // SQL query to insert a new user
        String query = "INSERT INTO users (full_name, email, password, phone_number, role) VALUES (?, ?, ?, ?, ?)";
        stmt = conn.prepareStatement(query);
        
        // Set parameters
        String fullName = firstName + " " + lastName; // Combine first and last name
        stmt.setString(1, fullName);
        stmt.setString(2, email);
        stmt.setString(3, password); // Consider hashing the password for security
        stmt.setString(4, phoneNumber);
        stmt.setString(5, role);
        
        // Execute the query
        int rows = stmt.executeUpdate();
        
        if (rows > 0) {
            out.println("<h2>Registration successful!</h2>");
            out.println("<p>Welcome, " + fullName + "!</p>");
            out.println("<a href='login.jsp'>Login here</a>");
        } else {
            out.println("<h2>Registration failed!</h2>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<h2>Error: " + e.getMessage() + "</h2>");
    } finally {
        // Close resources
        try {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
