<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    // Process the booking and retrieve departure and destination IDs
    String departureId = request.getParameter("departure");
    String destinationId = request.getParameter("destination");
    String customerName = request.getParameter("customerName");
    String email = request.getParameter("email");
    
    // Insert booking into database (this part needs to be implemented)
    
    // Redirect to select company page
    response.sendRedirect("selectCompany.jsp?departure=" + departureId + "&destination=" + destinationId);
%>
