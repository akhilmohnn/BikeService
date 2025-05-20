<%@ include file="SideBar.jsp" %>
<%@ page import="java.sql.*, DB.ConnectionClass" %>
<%
    ConnectionClass db = new ConnectionClass();
    ResultSet rs = db.selectCommand("SELECT * FROM tbl_user");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>User List</title>
</head>
<body>
    <h2>User List</h2>
    <table border="1">
        <tr>
            <th>User ID</th>
            <th>User Name</th>
            <th>Email</th>
            <th>Bike Registration</th>
            <th>Password</th>
            <th>Phone</th>
            <th>Address</th>
        </tr>
        <% while (rs.next()) { %>
        <tr>
            <td><%= rs.getInt("user_id") %></td>
            <td><%= rs.getString("user_name") %></td>
            <td><%= rs.getString("email") %></td>
            <td><%= rs.getString("bike_registration") %></td>
            <td><%= rs.getString("user_password") %></td>
            <td><%= rs.getString("phone") %></td>
            <td><%= rs.getString("address") %></td>
        </tr>
        <% } %>
    </table>
</body>
</html>
