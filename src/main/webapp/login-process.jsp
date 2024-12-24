<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Process</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<%
    String dbUrl = "jdbc:mysql://localhost:3306/ticket"; // Update with your database name
    String dbUser = "root"; // Your DB username
    String dbPass = ""; // Your DB password
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String role = request.getParameter("role");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);

        String query = "SELECT * FROM users WHERE email = ? AND password = ? AND role = ?";
        pstmt = conn.prepareStatement(query);
        pstmt.setString(1, email);
        pstmt.setString(2, password); // In a real app, hash the password
        pstmt.setString(3, role);

        rs = pstmt.executeQuery();
        if (rs.next()) {
            session.setAttribute("userEmail", email);
            session.setAttribute("userRole", role);
            // Check the role and redirect to the appropriate dashboard
            if ("admin".equals(role)) {
                response.sendRedirect("admin-dashboard.jsp"); // Redirect to admin dashboard
            } else if ("user".equals(role)) {
                response.sendRedirect("user-dashboard.jsp"); // Redirect to user dashboard
            } else {
                out.println("<div class='alert alert-danger'>Invalid role. Access denied.</div>");
            }
        } else {
            out.println("<div class='alert alert-danger'>Invalid credentials. Please try again.</div>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>

<a href="login.jsp" class="btn btn-primary">Go Back to Login</a>
</body>
</html>
