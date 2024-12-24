<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: #f0f0f0;
        }
        .dashboard-container {
            display: grid;
            grid-template-columns: 250px auto;
            height: 100vh;
        }
        .sidebar {
            background-color: #007bff;
            padding: 20px;
            color: #fff;
            min-height: 100vh;
        }
        .sidebar a {
            color: #fff;
            text-decoration: none;
            display: block;
            margin: 15px 0;
        }
        .sidebar a:hover {
            background-color: #0056b3;
            border-radius: 5px;
        }
        .content {
            padding: 20px;
            background-color: #fff;
        }
        .content h2 {
            color: #007bff;
        }
        .card {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

    <div class="dashboard-container">
        <!-- Sidebar / Navigation -->
        <div class="sidebar">
            <h2><i class="fas fa-cogs"></i> Admin Panel</h2>
            <a href="dashboard.jsp"><i class="fas fa-home"></i> Dashboard Home</a>
            <a href="manage-routes.jsp"><i class="fas fa-route"></i> Manage Routes</a>
            <a href="manage-buses.jsp"><i class="fas fa-bus"></i> Manage Buses</a>
            <a href="manage-companies.jsp"><i class="fas fa-building"></i> Manage Companies</a> 
            <a href="add-company.jsp"><i class="fas fa-plus-circle"></i> Add New Company</a> 
            <a href="view-bookings.jsp"><i class="fas fa-ticket-alt"></i> View Bookings</a>
            <a href="reports.jsp"><i class="fas fa-chart-line"></i> View Reports</a>
            <a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>

        <!-- Content Area -->
        <div class="content">
            <h2>Welcome to Admin Dashboard</h2>
            <div class="row">
                <!-- Overview cards -->
                <div class="col-md-3">
                    <div class="card text-white bg-primary">
                        <div class="card-body">
                            <h5 class="card-title"><i class="fas fa-route"></i> Total Routes</h5>
                            <p class="card-text">
                                <%
                                    // Fetch total routes from the database
                                    try {
                                        String url = "jdbc:mysql://localhost:3306/ticket"; 
                                        String dbUser = "root"; 
                                        String dbPass = ""; 

                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                        Connection conn = DriverManager.getConnection(url, dbUser, dbPass);
                                        String query = "SELECT COUNT(*) AS route_count FROM routes";
                                        PreparedStatement stmt = conn.prepareStatement(query);
                                        ResultSet rs = stmt.executeQuery();
                                        if (rs.next()) {
                                            out.println(rs.getInt("route_count"));
                                        }
                                        rs.close();
                                        stmt.close();
                                        conn.close();
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                %> Routes
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card text-white bg-success">
                        <div class="card-body">
                            <h5 class="card-title"><i class="fas fa-bus"></i> Total Buses</h5>
                            <p class="card-text">
                                <%
                                    // Fetch total buses from the database
                                    try {
                                        String url = "jdbc:mysql://localhost:3306/ticket"; 
                                        String dbUser = "root"; 
                                        String dbPass = ""; 

                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                        Connection conn = DriverManager.getConnection(url, dbUser, dbPass);
                                        String query = "SELECT COUNT(*) AS bus_count FROM buses";
                                        PreparedStatement stmt = conn.prepareStatement(query);
                                        ResultSet rs = stmt.executeQuery();
                                        if (rs.next()) {
                                            out.println(rs.getInt("bus_count"));
                                        }
                                        rs.close();
                                        stmt.close();
                                        conn.close();
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                %> Buses
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card text-white bg-warning">
                        <div class="card-body">
                            <h5 class="card-title"><i class="fas fa-ticket-alt"></i> Total Bookings</h5>
                            <p class="card-text">
                                <%
                                    // Fetch total bookings from the database
                                    try {
                                        String url = "jdbc:mysql://localhost:3306/ticket"; 
                                        String dbUser = "root"; 
                                        String dbPass = ""; 

                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                        Connection conn = DriverManager.getConnection(url, dbUser, dbPass);
                                        String query = "SELECT COUNT(*) AS booking_count FROM bookings";
                                        PreparedStatement stmt = conn.prepareStatement(query);
                                        ResultSet rs = stmt.executeQuery();
                                        if (rs.next()) {
                                            out.println(rs.getInt("booking_count"));
                                        }
                                        rs.close();
                                        stmt.close();
                                        conn.close();
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                %> Bookings
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card text-white bg-danger">
                        <div class="card-body">
                            <h5 class="card-title"><i class="fas fa-chart-line"></i> Reports</h5>
                            <p class="card-text">View Reports and Analytics</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Main dashboard content -->
            <div class="row mt-4">
                <div class="col-md-12">
                    <h3>Latest Bookings</h3>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Booking ID</th>
                                <th>Customer Name</th>
                                <th>Route</th>
                                <th>Bus</th>
                                <th>Date</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                // Fetch latest bookings from the database
                                try {
                                    String url = "jdbc:mysql://localhost:3306/ticket"; 
                                    String dbUser = "root"; 
                                    String dbPass = ""; 

                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                    Connection conn = DriverManager.getConnection(url, dbUser, dbPass);
                                    String query = "SELECT * FROM bookings ORDER BY booking_date DESC LIMIT 5";
                                    PreparedStatement stmt = conn.prepareStatement(query);
                                    ResultSet rs = stmt.executeQuery();
                                    while (rs.next()) {
                                        out.println("<tr>");
                                        out.println("<td>" + rs.getInt("booking_id") + "</td>");
                                        out.println("<td>" + rs.getString("customer_name") + "</td>");
                                        out.println("<td>" + rs.getString("route_name") + "</td>");
                                        out.println("<td>" + rs.getString("bus_name") + "</td>");
                                        out.println("<td>" + rs.getDate("booking_date") + "</td>");
                                        out.println("<td>" + rs.getString("status") + "</td>");
                                        out.println("</tr>");
                                    }
                                    rs.close();
                                    stmt.close();
                                    conn.close();
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

