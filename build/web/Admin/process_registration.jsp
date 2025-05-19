<%@page import="java.sql.*"%>
<%@page import="DB.ConnectionClass"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Process Registration</title>
</head>
<body>
    <h2>Processing Registration...</h2>

    <%
        // Get database connection using the static method
        Connection con = ConnectionClass.getConnection();
        if (con != null) {
            try {
                // Get form parameters
                String username = request.getParameter("username");
                String email = request.getParameter("email");
                String password = request.getParameter("password");

                // Insert data into database
                String query = "INSERT INTO users (username, email, password) VALUES (?, ?, ?)";
                PreparedStatement pstmt = con.prepareStatement(query);
                pstmt.setString(1, username);
                pstmt.setString(2, email);
                pstmt.setString(3, password);

                int result = pstmt.executeUpdate();
                
                if (result > 0) {
                    out.println("<h3>Registration Successful!</h3>");
                } else {
                    out.println("<h3>Registration Failed!</h3>");
                }

                pstmt.close();
            } catch (Exception e) {
                out.println("<h3>Error: " + e.getMessage() + "</h3>");
                e.printStackTrace();
            }
        } else {
            out.println("<h3>Database Connection Failed!</h3>");
        }
    %>
</body>
</html>
