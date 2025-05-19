
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <style>
        /* ? Navbar Styling */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: linear-gradient(to right, #1e3c72, #2a5298);
            padding: 15px 30px;
            font-family: Arial, sans-serif;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
        }
        .navbar .logo {
            font-size: 24px;
            font-weight: bold;
            color: #fff;
        }
        .nav-links {
            list-style: none;
            display: flex;
        }
        .nav-links li {
            margin: 0 15px;
        }
        .nav-links a {
            text-decoration: none;
            color: #fff;
            font-size: 18px;
            padding: 8px 15px;
            border-radius: 5px;
            transition: 0.3s;
        }
        .nav-links a:hover {
            background: rgba(255, 255, 255, 0.2);
        }
        .logout-btn {
            background: red;
            padding: 8px 15px;
            border-radius: 5px;
        }
        .logout-btn:hover {
            background: darkred;
        }

        /* ? Table Styling */
        .table-container {
            width: 90%;
            margin: 30px auto;
            overflow-x: auto;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background: #ffffff;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            border-radius: 8px;
        }
        th, td {
            padding: 12px 15px;
            text-align: left;
        }
        th {
            background: #1e3c72;
            color: white;
            font-size: 16px;
        }
        td {
            border-bottom: 1px solid #ddd;
        }
        tr:hover {
            background: #f1f1f1;
        }

        /* ? Button Styling */
        .btn {
            padding: 8px 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            transition: 0.3s;
        }
        .btn-primary {
            background: #007bff;
            color: white;
        }
        .btn-primary:hover {
            background: #0056b3;
        }
        .btn-danger {
            background: #dc3545;
            color: white;
        }
        .btn-danger:hover {
            background: #a71d2a;
        }

        /* ? Booking Form Styling */
        .form-container {
            width: 50%;
            margin: 30px auto;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
        }
        .form-container h2 {
            text-align: center;
            color: #1e3c72;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            color: #333;
        }
        .form-group input, 
        .form-group select, 
        .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .form-group textarea {
            resize: vertical;
            height: 80px;
        }
        .form-group button {
            width: 100%;
            padding: 10px;
            background: #1e3c72;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s;
        }
        .form-group button:hover {
            background: #2a5298;
        }
    </style>
</head>
<body>

    <!-- ? Navbar -->
    <nav class="navbar">
        <div class="logo">Bike Service</div>
        <ul class="nav-links">
            <li><a href="UserHome.jsp">Home</a></li>
            <li><a href="BookService.jsp">Book Services</a></li>
            <li><a href="UserBookingStatus.jsp">User Booking Status</a></li>
            <li><a href="ViewScheduledService.jsp">View Scheduled Service</a></li>
            <li><a href="LogOut.jsp" class="logout-btn">Logout</a></li>
        </ul>
    </nav>

</body>
</html>
