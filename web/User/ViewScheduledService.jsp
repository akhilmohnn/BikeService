<%@ include file="NavBar.jsp" %>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>


<!DOCTYPE html>
<html lang="en">
<head>
    <title>My Scheduled Services</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">

<%
    // Debugging: Check if session contains bike registration number
    String bikeReg = (String) session.getAttribute("bike_reg");
    out.println("Bike Registration in session: " + bikeReg); // Debugging Output

//    if (bikeReg == null) {
//        response.sendRedirect("Login.jsp"); // Redirect if user is not logged in
//        return;
//    }

    String query = "SELECT * FROM tbl_service WHERE bike_registration='" + bikeReg + "'";
    ResultSet rs = con.selectCommand(query);
%>

<div class="container mt-5">
    <h2 class="text-center text-primary">My Scheduled Services</h2>
    
    <table class="table table-bordered table-striped mt-4">
        <thead class="table-dark">
            <tr>
                <th>Service Date</th>
                <th>Service Type</th>
                <th>Status</th>
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
                <td><span class="badge bg-info"><%= rs.getString("status") %></span></td>
            </tr>
            <%
                }
                if (!hasRecords) {
            %>
            <tr>
                <td colspan="3" class="text-center text-danger">No scheduled services found!</td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>

</body>
</html>
