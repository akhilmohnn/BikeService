<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>

    <style>
        /* Preloader */
        #preloader {
            position: fixed;
            width: 100%;
            height: 100%;
            background: white;
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 9999;
        }
        .loader {
            width: 50px;
            height: 50px;
            border: 5px solid #fff;
            border-top: 5px solid transparent;
            border-radius: 50%;
            animation: spin 1s linear infinite;
        }
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        /* Background Styling */
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #4A00E0, #8E2DE2);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        /* Login Container - Glassmorphism */
        .login-container {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 350px;
        }

        h1 {
            color: #fff;
            font-size: 28px;
            margin-bottom: 20px;
        }

        /* Input Fields */
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid rgba(255, 255, 255, 0.3);
            border-radius: 6px;
            font-size: 16px;
            background: rgba(255, 255, 255, 0.2);
            color: #fff;
            outline: none;
            transition: 0.3s ease-in-out;
        }

        input[type="text"]:focus, input[type="password"]:focus {
            background: rgba(255, 255, 255, 0.3);
        }

        /* Login Button */
        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background: #ff6b6b;
            border: none;
            color: white;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            border-radius: 6px;
            transition: 0.3s ease-in-out;
        }

        input[type="submit"]:hover {
            background: #ff4757;
            box-shadow: 0px 0px 10px rgba(255, 99, 99, 0.8);
        }

        a {
            text-decoration: none;
            color: #fff;
            font-size: 14px;
        }

        a:hover {
            text-decoration: underline;
        }

    </style>
</head>
<body>

    <!-- Loader -->
    <div id="preloader">
        <div class="loader"></div>
    </div>

    <!-- Login Form -->
    <div class="login-container">
        <h1>Login</h1>

        <%
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
        %>

        <form method="post">
            <input type="text" name="txtusername" placeholder="Email / Bike Registration No." required>
            <input type="password" name="txtpassword" placeholder="Password" required>
            <input type="submit" name="btnlogin" value="Login">
        </form>
        <p><a href="NewUserRegistration.jsp">New User? Register Here</a></p>
    </div>

    <script>
        // Remove preloader after page load
        window.onload = function() {
            document.getElementById("preloader").style.display = "none";
        };
    </script>

</body>
</html>
