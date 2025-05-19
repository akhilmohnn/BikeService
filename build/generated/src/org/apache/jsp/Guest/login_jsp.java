package org.apache.jsp.Guest;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write('\r');
      out.write('\n');
      DB.ConnectionClass con = null;
      synchronized (_jspx_page_context) {
        con = (DB.ConnectionClass) _jspx_page_context.getAttribute("con", PageContext.PAGE_SCOPE);
        if (con == null){
          con = new DB.ConnectionClass();
          _jspx_page_context.setAttribute("con", con, PageContext.PAGE_SCOPE);
        }
      }
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"UTF-8\">\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("    <title>Login</title>\r\n");
      out.write("\r\n");
      out.write("    <style>\r\n");
      out.write("        /* Preloader */\r\n");
      out.write("        #preloader {\r\n");
      out.write("            position: fixed;\r\n");
      out.write("            width: 100%;\r\n");
      out.write("            height: 100%;\r\n");
      out.write("            background: white;\r\n");
      out.write("            display: flex;\r\n");
      out.write("            align-items: center;\r\n");
      out.write("            justify-content: center;\r\n");
      out.write("            z-index: 9999;\r\n");
      out.write("        }\r\n");
      out.write("        .loader {\r\n");
      out.write("            width: 50px;\r\n");
      out.write("            height: 50px;\r\n");
      out.write("            border: 5px solid #fff;\r\n");
      out.write("            border-top: 5px solid transparent;\r\n");
      out.write("            border-radius: 50%;\r\n");
      out.write("            animation: spin 1s linear infinite;\r\n");
      out.write("        }\r\n");
      out.write("        @keyframes spin {\r\n");
      out.write("            0% { transform: rotate(0deg); }\r\n");
      out.write("            100% { transform: rotate(360deg); }\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        /* Background Styling */\r\n");
      out.write("        body {\r\n");
      out.write("            font-family: 'Poppins', sans-serif;\r\n");
      out.write("            background: linear-gradient(to right, #4A00E0, #8E2DE2);\r\n");
      out.write("            display: flex;\r\n");
      out.write("            justify-content: center;\r\n");
      out.write("            align-items: center;\r\n");
      out.write("            height: 100vh;\r\n");
      out.write("            margin: 0;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        /* Login Container - Glassmorphism */\r\n");
      out.write("        .login-container {\r\n");
      out.write("            background: rgba(255, 255, 255, 0.1);\r\n");
      out.write("            backdrop-filter: blur(10px);\r\n");
      out.write("            padding: 30px;\r\n");
      out.write("            border-radius: 12px;\r\n");
      out.write("            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);\r\n");
      out.write("            text-align: center;\r\n");
      out.write("            width: 350px;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        h1 {\r\n");
      out.write("            color: #fff;\r\n");
      out.write("            font-size: 28px;\r\n");
      out.write("            margin-bottom: 20px;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        /* Input Fields */\r\n");
      out.write("        input[type=\"text\"], input[type=\"password\"] {\r\n");
      out.write("            width: 100%;\r\n");
      out.write("            padding: 12px;\r\n");
      out.write("            margin: 10px 0;\r\n");
      out.write("            border: 1px solid rgba(255, 255, 255, 0.3);\r\n");
      out.write("            border-radius: 6px;\r\n");
      out.write("            font-size: 16px;\r\n");
      out.write("            background: rgba(255, 255, 255, 0.2);\r\n");
      out.write("            color: #fff;\r\n");
      out.write("            outline: none;\r\n");
      out.write("            transition: 0.3s ease-in-out;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        input[type=\"text\"]:focus, input[type=\"password\"]:focus {\r\n");
      out.write("            background: rgba(255, 255, 255, 0.3);\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        /* Login Button */\r\n");
      out.write("        input[type=\"submit\"] {\r\n");
      out.write("            width: 100%;\r\n");
      out.write("            padding: 12px;\r\n");
      out.write("            background: #ff6b6b;\r\n");
      out.write("            border: none;\r\n");
      out.write("            color: white;\r\n");
      out.write("            font-size: 18px;\r\n");
      out.write("            font-weight: bold;\r\n");
      out.write("            cursor: pointer;\r\n");
      out.write("            border-radius: 6px;\r\n");
      out.write("            transition: 0.3s ease-in-out;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        input[type=\"submit\"]:hover {\r\n");
      out.write("            background: #ff4757;\r\n");
      out.write("            box-shadow: 0px 0px 10px rgba(255, 99, 99, 0.8);\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        a {\r\n");
      out.write("            text-decoration: none;\r\n");
      out.write("            color: #fff;\r\n");
      out.write("            font-size: 14px;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        a:hover {\r\n");
      out.write("            text-decoration: underline;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("    </style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("    <!-- Loader -->\r\n");
      out.write("    <div id=\"preloader\">\r\n");
      out.write("        <div class=\"loader\"></div>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <!-- Login Form -->\r\n");
      out.write("    <div class=\"login-container\">\r\n");
      out.write("        <h1>Login</h1>\r\n");
      out.write("\r\n");
      out.write("        ");

            if (request.getParameter("btnlogin") != null) {
                String username = request.getParameter("txtusername");
                String password = request.getParameter("txtpassword");

                if (username.equals("admin@gmail.com") && password.equals("admin123")) {
                    session.setAttribute("aid", "1");
                    session.setAttribute("aname", "Admin");
                    response.sendRedirect("../Admin/HomePage.jsp");
                } else {
                    String selQryUser = "SELECT * FROM tbl_user WHERE bike_registration='" + username + "' AND user_password='" + password + "'";
                    ResultSet user = con.selectCommand(selQryUser);

                    if (user.next()) {
                        session.setAttribute("uid", user.getString("user_id"));
                        session.setAttribute("uname", user.getString("user_name"));
                     
                        session.setAttribute("bike_reg", user.getString("bike_registration")); 
                        response.sendRedirect("../User/UserHome.jsp");
                    } else {
                        out.print("<script>alert('Invalid Credentials')</script>");
                    }
                }
            }
        
      out.write("\r\n");
      out.write("\r\n");
      out.write("        <form method=\"post\">\r\n");
      out.write("            <input type=\"text\" name=\"txtusername\" placeholder=\"Email / Bike Registration No.\" required>\r\n");
      out.write("            <input type=\"password\" name=\"txtpassword\" placeholder=\"Password\" required>\r\n");
      out.write("            <input type=\"submit\" name=\"btnlogin\" value=\"Login\">\r\n");
      out.write("        </form>\r\n");
      out.write("        <p><a href=\"NewUserRegistration.jsp\">New User? Register Here</a></p>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <script>\r\n");
      out.write("        // Remove preloader after page load\r\n");
      out.write("        window.onload = function() {\r\n");
      out.write("            document.getElementById(\"preloader\").style.display = \"none\";\r\n");
      out.write("        };\r\n");
      out.write("    </script>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
