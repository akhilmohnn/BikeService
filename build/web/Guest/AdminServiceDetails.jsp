<%@ include file="SideBar.jsp" %>
<%@page import="java.sql.*"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Admin - Service Details</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">

<div class="container mt-5">
    <h2 class="text-center text-primary">Search Service Details</h2>
    
    <!-- Search Form -->
    <form method="post" class="d-flex justify-content-center mt-3">
        <input type="text" name="bike_registration" class="form-control w-50" placeholder="Enter Bike Registration No." required>
        <button type="submit" class="btn btn-primary ms-2">Search</button>
    </form>

    <%
    String bikeReg = request.getParameter("bike_registration");
    if (bikeReg != null && !bikeReg.trim().isEmpty()) {
        String query = "SELECT * FROM tbl_service WHERE bike_registration='" + bikeReg + "' ORDER BY service_date DESC";
        ResultSet rs = con.selectCommand(query);

        if (rs == null) { 
%>
            <div class="mt-4 text-center text-danger">
                <h5>Error fetching service records. Please try again.</h5>
            </div>
<%
        } else {
%>
    <div class="mt-4">
        <h4 class="text-center text-success">Service Details for <%= bikeReg %></h4>
        <table class="table table-bordered table-striped mt-3">
            <thead class="table-dark">
                <tr>
                    <th>Service Date</th>
                    <th>Service Type</th>
                    <th>Status</th>
                    <th>Cost</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    boolean hasRecords = false;
                    while (rs.next()) {
                        hasRecords = true;
                %>
                <tr>
                    <td><%= rs.getString("service_date") %></td>
                    <td><%= rs.getString("service_type") %></td>
                    <td>
                        <form method="post" action="UpdateServiceStatus.jsp">
                            <input type="hidden" name="service_id" value="<%= rs.getString("service_id") %>">
                            <select name="status" class="form-select">
                                <option value="Pending" <%= "Pending".equals(rs.getString("status")) ? "selected" : "" %>>Pending</option>
                                <option value="Finished" <%= "Finished".equals(rs.getString("status")) ? "selected" : "" %>>Finished</option>
                                <option value="Cancelled" <%= "Cancelled".equals(rs.getString("status")) ? "selected" : "" %>>Cancelled</option>
                            </select>
                    </td>
                    <td>₹<%= rs.getString("cost") %></td>
                    
                    <td>
                        <button type="submit" class="btn btn-success btn-sm">Update</button>
                        </form>
                    </td>
                </tr>
                <%
                    }
                    if (!hasRecords) {
                %>
                <tr>
                    <td colspan="6" class="text-center text-danger">No service records found!</td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
<%
        } // End of if (rs != null)
    } // End of if (bikeReg != null && !bikeReg.trim().isEmpty())
%>

    <div class="text-center mt-3">
        <a href="AdminDashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
    </div>
</div>

</body>
</html>

<%
    String success = request.getParameter("success");
    String error = request.getParameter("error");
    String msg = request.getParameter("msg");
%>

<script>
    window.onload = function() {
        <% if (success != null) { %>
            alert("✅ Service status updated successfully!");
        <% } %>

        <% if (error != null) { %>
            alert("❌ Error: <%= (msg != null) ? msg : "Failed to update service status." %>");
        <% } %>
    };
</script>
