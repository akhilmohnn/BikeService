<%@ include file="SideBar.jsp" %>
<%@ page import="java.sql.*, DB.ConnectionClass" %>
<%
    ConnectionClass db = new ConnectionClass();
    ResultSet rs = db.selectCommand("SELECT b.booking_id, b.service_type, b.description, b.status, b.created_at, u.user_name, u.phone FROM tbl_booking b INNER JOIN tbl_user u ON b.user_id = u.user_id");

    if (request.getParameter("update") != null) {
        String bookingId = request.getParameter("booking_id");
        String newStatus = request.getParameter("status");

        String updateQuery = "UPDATE tbl_booking SET status='" + newStatus + "' WHERE booking_id=" + bookingId;
        boolean updated = db.executeCommand(updateQuery);
        response.sendRedirect(updated ? "AdminManageBookings.jsp?success=1" : "AdminManageBookings.jsp?error=1");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Admin - Manage Bookings</title>
</head>
<body>

    <% if (request.getParameter("success") != null) { %>
        <script>alert("Booking updated successfully!");</script>
    <% } else if (request.getParameter("error") != null) { %>
        <script>alert("Error updating booking. Try again!");</script>
    <% } %>

    <h2>Manage Bookings</h2>
    <table border="1">
        <tr>
            <th>Booking ID</th>
            <th>User Name</th>
            <th>Phone Number</th>
            <th>Service</th>
            <th>Description</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
        <% while (rs.next()) { %>
        <tr>
            <td><%= rs.getInt("booking_id") %></td>
            <td><%= rs.getString("user_name") %></td> <!-- Display User Name -->
            <td><%= rs.getString("phone") %></td> <!-- Display User Phone -->
            <td><%= rs.getString("service_type") %></td>
            <td><%= rs.getString("description") %></td>
            <td><%= rs.getString("status") %></td>
            <td>
                <% if (!rs.getString("status").equals("Confirmed")) { %>
                    <form method="POST" action="AdminManageBookings.jsp" style="display:inline;">
                        <input type="hidden" name="booking_id" value="<%= rs.getInt("booking_id") %>">
                        <input type="hidden" name="status" value="Confirmed">
                        <button type="submit" name="update">Confirm</button>
                    </form>
                <% } %>

                <% if (!rs.getString("status").equals("Rejected")) { %>
                    <form method="POST" action="AdminManageBookings.jsp" style="display:inline;">
                        <input type="hidden" name="booking_id" value="<%= rs.getInt("booking_id") %>">
                        <input type="hidden" name="status" value="Rejected">
                        <button type="submit" name="update">Reject</button>
                    </form>
                <% } %>
            </td>
        </tr>
        <% } %>
    </table>

</body>
</html>
