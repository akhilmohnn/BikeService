<%@ page import="java.sql.*, DB.ConnectionClass" %>
<%
    String serviceId = request.getParameter("service_id");
    String newStatus = request.getParameter("status");

    if (serviceId != null && newStatus != null) {
        // Create an instance of ConnectionClass
        ConnectionClass db = new ConnectionClass();
        Connection connection = db.getConnection(); // Get connection instance

        if (connection != null) {
            try {
                String updateQuery = "UPDATE tbl_service SET status=? WHERE service_id=?";
                PreparedStatement ps = connection.prepareStatement(updateQuery);
                ps.setString(1, newStatus);
                ps.setString(2, serviceId);

                int updatedRows = ps.executeUpdate();
                ps.close();
                connection.close(); // Close connection after execution

                if (updatedRows > 0) {
                    response.sendRedirect("AdminServiceDetails.jsp?success=1");
                } else {
                    response.sendRedirect("AdminServiceDetails.jsp?error=1");
                }
            } catch (Exception e) {
                response.sendRedirect("AdminServiceDetails.jsp?error=1&msg=" + e.getMessage());
            }
        } else {
            response.sendRedirect("AdminServiceDetails.jsp?error=1&msg=Database connection is null.");
        }
    } else {
        response.sendRedirect("AdminServiceDetails.jsp?error=1&msg=Invalid parameters.");
    }
%>
