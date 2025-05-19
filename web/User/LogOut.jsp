<% 
    session.invalidate(); // Destroys the session
    response.sendRedirect("../Guest/login.jsp"); // Redirect to login page
%>
