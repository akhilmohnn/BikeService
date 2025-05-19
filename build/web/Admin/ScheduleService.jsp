<%@ include file="SideBar.jsp" %>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Schedule Bike Service</title>
</head>
<body>

<%
    if (request.getParameter("btnsubmit") != null) {
        String bikeReg = request.getParameter("txtbikereg");
        String serviceDate = request.getParameter("txtdate");
        String serviceType = request.getParameter("txtservice");

        // Check if the bike registration number exists
        String checkQry = "SELECT * FROM tbl_user WHERE bike_registration='" + bikeReg + "'";
        ResultSet rs = con.selectCommand(checkQry);

        if (rs.next()) {
            // Insert service request
            String insQry = "INSERT INTO tbl_service (bike_registration, service_date, service_type, status) VALUES ('" + bikeReg + "', '" + serviceDate + "', '" + serviceType + "', 'Pending')";
            if (con.executeCommand(insQry)) {
%>
            <script>
                alert("Service Scheduled Successfully");
                window.location = "ScheduleService.jsp";
            </script>
<%
            } else {
                out.println("<p style='color:red;'>Failed to schedule service!</p>");
            }
        } else {
            out.println("<p style='color:red;'>Bike registration number not found!</p>");
        }
    }
%>

<h1 align="center">Schedule Bike Service</h1>
<form>
    <table align="center">
        <tr>
            <td>Bike Registration</td>
            <td><input type="text" name="txtbikereg" placeholder="Enter Bike Registration" required></td>
        </tr>
        <tr>
            <td>Service Date</td>
            <td><input type="date" name="txtdate" required></td>
        </tr>
        <tr>
            <td>Service Type</td>
            <td>
                <select name="txtservice" required>
                    <option value="General Service">General Service</option>
                    <option value="Oil Change">Oil Change</option>
                    <option value="Brake Service">Brake Service</option>
                    <option value="Full Inspection">Full Inspection</option>
                </select>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center"><input type="submit" name="btnsubmit" value="Schedule Service"></td>
        </tr>
    </table>
</form>

</body>
</html>
