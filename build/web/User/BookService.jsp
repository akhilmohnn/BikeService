<%@ include file="NavBar.jsp" %>
<%@ page import="java.sql.*, DB.ConnectionClass" %>
<%
    ConnectionClass db = new ConnectionClass();

    if (request.getParameter("book") != null) {
        String userId = request.getParameter("user_id");
        String serviceType = request.getParameter("service_type");
        String description = request.getParameter("description");

        String insertQuery = "INSERT INTO tbl_booking (user_id, service_type, description, status, created_at) VALUES ('" + userId + "', '" + serviceType + "', '" + description + "', 'Pending', NOW())";
        boolean inserted = db.executeCommand(insertQuery);

        response.sendRedirect(inserted ? "BookService.jsp?success=1" : "BookService.jsp?error=1");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Book Water Service</title>
    <style>
        /* ? Card Styling */
        .booking-card {
            width: 40%;
            margin: 50px auto;
            padding: 20px;
            background: white;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            font-family: Arial, sans-serif;
            text-align: center;
        }
        .booking-card h2 {
            color: #1e3c72;
        }
        .booking-card label {
            display: block;
            margin: 10px 0 5px;
            font-weight: bold;
            text-align: left;
        }
        .booking-card select, 
        .booking-card textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            margin-bottom: 15px;
        }
        .booking-card textarea {
            height: 80px;
        }
        .booking-card button {
            width: 100%;
            padding: 10px;
            background: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: 0.3s;
        }
        .booking-card button:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>

    <%-- Success/Error Messages --%>
    <% if (request.getParameter("success") != null) { %>
        <script>alert("Booking successful! Admin will confirm soon.");</script>
    <% } else if (request.getParameter("error") != null) { %>
        <script>alert("Booking failed. Please try again!");</script>
    <% } %>

    <!-- ? Booking Card -->
    <div class="booking-card">
        <h2>Book a Water Service or Part Change</h2>
        <form method="POST">
            <input type="hidden" name="user_id" value="1"> <%-- Change this based on logged-in user --%>

            <label>Service Type:</label>
            <select name="service_type" required>
                <option value="Water Service">Water Service</option>
                <option value="Part Change">Part Change</option>
            </select>

            <label>Description (Optional):</label>
            <textarea name="description"></textarea>

            <button type="submit" name="book">Book Now</button>
        </form>
    </div>

</body>
</html>
