<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard - Bike Service Management</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #1e3c72, #2a5298);
            margin: 0;
            padding: 0;
            display: flex;
        }
        
        .wrapper {
            display: flex;
            width: 100%;
            height: 100vh;
        }

        /* Sidebar */
        .sidebar {
            width: 260px;
            background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
            color: white;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            position: fixed;
            height: 100%;
            box-shadow: 3px 0px 15px rgba(0, 0, 0, 0.3);
            transition: 0.3s;
        }

        .sidebar h2 {
            text-align: center;
            font-size: 22px;
            font-weight: bold;
            margin-bottom: 30px;
            border-bottom: 2px solid white;
            padding-bottom: 10px;
        }

        .sidebar a {
            width: 100%;
            padding: 12px;
            margin: 8px 0;
            color: white;
            font-size: 18px;
            font-weight: bold;
            text-decoration: none;
            border-radius: 5px;
            display: flex;
            align-items: center;
            gap: 10px;
            transition: all 0.3s;
        }

        .sidebar a:hover {
            background: rgba(255, 255, 255, 0.2);
            transform: scale(1.05);
        }

        .main-content {
            margin-left: 280px;
            padding: 40px;
            width: 100%;
            text-align: center;
            color: white;
        }

        .dashboard-header {
            font-size: 30px;
            font-weight: bold;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
            margin-bottom: 20px;
        }

        /* Cards */
        .card-box {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
            margin-top: 30px;
        }

        .card {
            width: 270px;
            height: 170px;
            background: rgba(255, 255, 255, 0.1);
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            border-radius: 12px;
            text-decoration: none;
            color: white;
            font-size: 18px;
            font-weight: bold;
            transition: 0.3s;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        .card i {
            font-size: 40px;
            margin-bottom: 10px;
            color: #ffcc00;
        }

        .card:hover {
            transform: scale(1.08);
            box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.5);
        }

    </style>
</head>
<body>

<div class="wrapper">
    <!-- Sidebar -->
    <div class="sidebar">
        <h2>🚀 Bike Service</h2>
        <a href="UserHome.jsp"><i class="fas fa-home"></i> Home</a>
        <a href="UserRegistration.jsp"><i class="fas fa-motorcycle"></i> Register Bike</a>
        <a href="ScheduleService.jsp"><i class="fas fa-tools"></i> Schedule Service</a>
        <a href="ViewScheduledService.jsp"><i class="fas fa-calendar-check"></i> View Scheduled Services</a>
        <a href="ServiceHistory.jsp"><i class="fas fa-history"></i> Service History</a>
        <a href="Logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="dashboard-header">Welcome to <span style="color:#ffcc00;">Bike Service Management</span> 🚲</div>
        <p>Manage your bike service bookings efficiently and keep your ride in top condition.</p>

        <!-- Cards Section -->
        <div class="card-box">
            <a href="UserBookingStatus.jsp" class="card">
                <i class="fas fa-motorcycle"></i>
                User booking Status
            </a>
            <a href="ViewScheduledService.jsp" class="card">
                <i class="fas fa-tools"></i>
                Schedule Service
            </a>
            <a href="ViewScheduledService.jsp" class="card">
                <i class="fas fa-calendar-check"></i>
                View Scheduled Services
            </a>
            <a href="ServiceHistory.jsp" class="card">
                <i class="fas fa-history"></i>
                Service History
            </a>
        </div>
    </div>
</div>

</body>
</html>
