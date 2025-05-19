<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
    
    <style>
        /* Smooth Gradient Background */
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #0f0c29, #302b63, #24243e);
            color: white;
        }

        /* Navbar Styles */
        .navbar {
            width: 100%;
            background: rgba(20, 20, 20, 0.9);
            padding: 15px 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-shadow: 0px 0px 10px rgba(0, 255, 255, 0.2);
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
        }

        .logo {
            color: cyan;
            font-size: 22px;
            font-weight: bold;
        }

        .navbar ul {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
        }

        .navbar ul li {
            padding: 10px 15px;
        }

        .navbar ul li a {
            color: white;
            text-decoration: none;
            display: flex;
            align-items: center;
            transition: 0.3s;
            font-size: 16px;
        }

        .navbar ul li a i {
            margin-right: 8px;
            font-size: 18px;
            transition: 0.3s;
        }

        .navbar ul li:hover {
            background: rgba(0, 255, 255, 0.2);
            border-radius: 8px;
            box-shadow: 0px 0px 8px rgba(0, 255, 255, 0.5);
        }

        .navbar ul li:hover a i {
            color: cyan;
        }

        /* Logout Button */
        .logout {
            background: #ff4d4d;
            padding: 10px 15px;
            border-radius: 8px;
            transition: 0.3s;
            font-weight: bold;
        }

        .logout:hover {
            background: #cc0000;
            box-shadow: 0px 0px 15px rgba(255, 77, 77, 0.7);
        }

        /* Content Wrapper */
        .content {
            padding: 80px 20px;
            text-align: center;
        }
         
         /* Table Styling */
        .table-container {
            margin: 50px auto;
            width: 90%;
            background: rgba(255, 255, 255, 0.1);
            padding: 20px;
            border-radius: 10px;
            backdrop-filter: blur(10px);
            box-shadow: 0px 0px 15px rgba(0, 255, 255, 0.3);
        }
        
        
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
        }

        th {
            background: rgba(0, 255, 255, 0.3);
            font-weight: bold;
            color: white;
        }

        tr:hover {
            background: rgba(0, 255, 255, 0.2);
            transition: 0.3s;
        }

        /* Buttons Styling */
        .btn {
            padding: 10px 15px;
            font-size: 14px;
            font-weight: bold;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s;
        }

        .edit-btn {
            background: #1e90ff;
        }

        .edit-btn:hover {
            background: #0073e6;
            box-shadow: 0px 0px 10px rgba(30, 144, 255, 0.7);
        }

        .delete-btn {
            background: #ff4d4d;
        }

        .delete-btn:hover {
            background: #cc0000;
            box-shadow: 0px 0px 10px rgba(255, 77, 77, 0.7);
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar">
        <div class="logo">Admin Panel</div>
        <ul>
            <li><a href="HomePage.jsp"><i class="fas fa-home"></i> Dashboard</a></li>
            <li><a href="UserRegistration.jsp"><i class="fas fa-users"></i>UserRegistration</a></li>
            <li><a href="AdminManageBooking.jsp"><i class="fas fa-motorcycle"></i> AdminServiceDetails</a></li>
            <li><a href="ScheduleService.jsp"><i class="fas fa-chart-line"></i> ScheduleService</a></li>
            <li><a href="UserList.jsp"><i class="fas fa-cogs"></i> UserList</a></li>
            <li><a href="AdminManageBooking.jsp"><i class="fas fa-envelope"></i> AdminManageBooking</a></li>
            <li><a href="LogOut.jsp" class="logout"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
        </ul>
    </nav>

    <!-- Content Wrapper -->
    <div class="content">
        <h1>Welcome to Admin Dashboard</h1>
    </div>

</body>
</html>
