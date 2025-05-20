<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    
    <style>
        /* Background with gradient */
        body {
            background: linear-gradient(135deg, #0f0c29, #302b63, #24243e);
            color: white;
            font-family: 'Poppins', sans-serif;
        }
        
        /* Dashboard Card Styling */
        .dashboard-card {
            background: rgba(20, 20, 20, 0.9);
            border-radius: 15px;
            padding: 20px;
            text-align: center;
            transition: 0.3s;
            box-shadow: 0px 0px 10px rgba(0, 255, 255, 0.2);
        }
        
        .dashboard-card:hover {
            transform: translateY(-5px);
            box-shadow: 0px 0px 20px rgba(0, 255, 255, 0.7);
        }
        
        .dashboard-card i {
            font-size: 40px;
            margin-bottom: 10px;
            color: #4dabf7;
            transition: 0.3s;
        }
        
        .dashboard-card:hover i {
            color: cyan;
        }
        
        /* Logout Button */
        .logout-btn {
            position: absolute;
            top: 20px;
            right: 20px;
            background: #ff4d4d;
            color: white;
            padding: 10px 20px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
            transition: 0.3s;
            box-shadow: 0px 0px 10px rgba(255, 77, 77, 0.5);
        }
        
        .logout-btn:hover {
            background: #cc0000;
            box-shadow: 0px 0px 20px rgba(255, 77, 77, 1);
        }

        /* Smooth fade-in animation */
        .fade-in {
            animation: fadeIn 1s ease-in-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

    </style>
</head>
<body>

    <a href="logout.jsp" class="logout-btn fade-in"><i class="fas fa-sign-out-alt"></i> Logout</a>

    <div class="container text-center mt-5 fade-in">
        <h1 class="mb-3">Welcome, <span style="color: cyan;">Admin</span></h1>
        <p>Manage your platform efficiently</p>

        <div class="row mt-4">
            <div class="col-md-4 mb-3 mx-auto">
                <a href="UserList.jsp" class="text-decoration-none">
                    <div class="dashboard-card">
                        <i class="fas fa-users"></i>
                        <h5>View detailed info</h5>
                    </div>
                </a>
            </div>
            <!-- <div class="col-md-4 mb-3">
                <a href="manage_bikes.jsp" class="text-decoration-none">
                    <div class="dashboard-card">
                        <i class="fas fa-motorcycle"></i>
                        <h5>Manage Bikes</h5>
                    </div>
                </a>
            </div>
            <div class="col-md-4 mb-3">
                <a href="view_reports.jsp" class="text-decoration-none">
                    <div class="dashboard-card">
                        <i class="fas fa-chart-line"></i>
                        <h5>View Reports</h5>
                    </div>
                </a>
            </div>
            <div class="col-md-4 mb-3">
                <a href="settings.jsp" class="text-decoration-none">
                    <div class="dashboard-card">
                        <i class="fas fa-cogs"></i>
                        <h5>Settings</h5>
                    </div>
                </a>
            </div>
            <div class="col-md-4 mb-3">
                <a href="messages.jsp" class="text-decoration-none">
                    <div class="dashboard-card">
                        <i class="fas fa-envelope"></i>
                        <h5>Messages</h5>
                    </div>
                </a>
            </div>
            <div class="col-md-4 mb-3">
                <a href="profile.jsp" class="text-decoration-none">
                    <div class="dashboard-card">
                        <i class="fas fa-user"></i>
                        <h5>Profile</h5>
                    </div>
                </a>
            </div> -->
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

