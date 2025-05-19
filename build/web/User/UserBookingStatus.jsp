<%@ include file="NavBar.jsp" %>
<%@ page import="java.sql.*, DB.ConnectionClass" %>
<%
    // Retrieve session attribute safely
    String userIdStr = (String) session.getAttribute("uid");  
    Integer userId = (userIdStr != null) ? Integer.parseInt(userIdStr) : null;

    if (userId == null) {
        response.sendRedirect("../Guest/Login.jsp"); // Redirect to login if session is null
        return;
    }

    ConnectionClass db = new ConnectionClass();
    ResultSet rs = db.selectCommand("SELECT service_type, description, status, created_at FROM tbl_booking WHERE user_id=" + userId);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title align="center">My Bookings</title>
    <style>
        .confirmed { color: green; font-weight: bold; }
        .rejected { color: red; font-weight: bold; }
        .pending { color: orange; font-weight: bold; }
        table { width: 100%; border-collapse: collapse; }
        th, td { padding: 10px; border: 1px solid black; text-align: left; }
    </style>
</head>
<body>


    <h2>My Bookings</h2>

    <table>
        <tr>
            <th>Service</th>
            <th>Description</th>
            <th>Status</th>
            <th>Booking Date</th>
        </tr>
        <% while (rs.next()) { %>
        <tr>
            <td><%= rs.getString("service_type") %></td>
            <td><%= rs.getString("description") %></td>
            <td>
                <% 
                    String status = rs.getString("status");
                    String statusClass = status.equals("Confirmed") ? "confirmed" : 
                                        status.equals("Rejected") ? "rejected" : "pending";
                %>
                <span class="<%= statusClass %>"><%= status %></span>
            </td>
            <td><%= rs.getTimestamp("created_at") %></td>
        </tr>
        <% } %>
    </table>

    <br>
  
</body>
</html>
