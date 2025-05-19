<%@ include file="SideBar.jsp" %>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>
</head>
<body>

<%
    if (request.getParameter("btnsubmit") != null) {
        String name = request.getParameter("txtname");
        String email = request.getParameter("txtemail");
        String bikeReg = request.getParameter("txtbikereg");
        String password = request.getParameter("txtpassword");
        String phone = request.getParameter("txtphone");
        String address = request.getParameter("txtaddress");

        // Debugging: Print query before execution
        String insQry = "INSERT INTO tbl_user (user_name, email, bike_registration, user_password, phone, address) VALUES ('" + name + "', '" + email + "', '" + bikeReg + "', '" + password + "', '" + phone + "', '" + address + "')";
        out.println("<p>Executing Query: " + insQry + "</p>");

        if (con.executeCommand(insQry)) {
%>
        <script>
            alert("User Registered Successfully");
            window.location = "UserRegistration.jsp";
        </script>
<%
        } else {
            out.println("<p style='color:red;'>Query execution failed!</p>");
        }
    }
%>

<h1 align="center">User Registration</h1>
<form>
    <table align="center">
        <tr>
            <td>Name</td>
            <td><input type="text" name="txtname" placeholder="Enter Name" required></td>
        </tr>
        <tr>
            <td>Email</td>
            <td><input type="email" name="txtemail" placeholder="Enter Email" required></td>
        </tr>
        <tr>
            <td>Bike Registration</td>
            <td><input type="text" name="txtbikereg" placeholder="Enter Bike Registration" required></td>
        </tr>
        <tr>
            <td>Password</td>
            <td><input type="password" name="txtpassword" placeholder="Enter Password" required></td>
        </tr>
        <tr>
            <td>Phone</td>
            <td><input type="text" name="txtphone" placeholder="Enter Phone" required></td>
        </tr>
        <tr>
            <td>Address</td>
            <td><textarea name="txtaddress" placeholder="Enter Address" required></textarea></td>
        </tr>
        <tr>
            <td colspan="2" align="center"><input type="submit" name="btnsubmit" value="Register"></td>
        </tr>
    </table>
</form>

</body>
</html>
