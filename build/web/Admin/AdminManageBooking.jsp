<%@ include file="SideBar.jsp" %>

<%@ page import="java.sql.*, DB.ConnectionClass" %>
<%
    ConnectionClass db = new ConnectionClass();
    String query = "SELECT booking_id, service_type, description, status FROM tbl_booking";
    ResultSet rs = db.selectCommand(query);

    if (request.getMethod().equals("POST") && request.getParameter("update") != null) {
        String bookingId = request.getParameter("booking_id");
        String newStatus = request.getParameter("update");

        String updateQuery = "UPDATE tbl_booking SET status='" + newStatus + "' WHERE booking_id=" + bookingId;
        boolean updated = db.executeCommand(updateQuery);
        response.sendRedirect(updated ? "AdminManageBooking.jsp?success=1" : "AdminManageBooking.jsp?error=1");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Admin - Manage Bookings</title>
    <style>
        .confirmed { color: green; font-weight: bold; }
        .rejected { color: red; font-weight: bold; }
        table { width: 100%; border-collapse: collapse; }
        th, td { padding: 10px; border: 1px solid black; text-align: center; }
    </style>
</head>
<body>

    <% if (request.getParameter("success") != null) { %>
        <script>alert("Booking updated successfully!");</script>
    <% } else if (request.getParameter("error") != null) { %>
        <script>alert("Error updating booking. Try again!");</script>
    <% } %>

    <h2>Manage Bookings</h2>
    <table>
        <tr>
            <th>Booking ID</th><th>Service</th><th>Description</th><th>Status</th><th>Actions</th>
        </tr>
        <% 
        if (rs != null) {
            while (rs.next()) { 
                String status = rs.getString("status");
        %>
        <tr>
            <td><%= rs.getInt("booking_id") %></td>
            <td><%= rs.getString("service_type") %></td>
            <td><%= rs.getString("description") %></td>
            <td class="<%= status.toLowerCase() %>"><%= status %></td>
            <td>
                <form method="POST" style="display:inline;">
                    <input type="hidden" name="booking_id" value="<%= rs.getInt("booking_id") %>">
                    <% if (status.equals("Confirmed")) { %>
                        <button type="submit" name="update" value="Rejected">Reject</button>
                    <% } else if (status.equals("Rejected")) { %>
                        <button type="submit" name="update" value="Confirmed">Confirm</button>
                    <% } else { %>
                        <button type="submit" name="update" value="Confirmed">Confirm</button>
                        <button type="submit" name="update" value="Rejected">Reject</button>
                    <% } %>
                </form>
            </td>
        </tr>
        <% 
            }
        } else { 
        %>
            <tr><td colspan="5">No bookings found.</td></tr>
        <% } %>
    </table>

</body>
</html>
