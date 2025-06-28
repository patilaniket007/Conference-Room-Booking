<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String adminName = (String) session.getAttribute("username");
    if (adminName == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard | Conference Booking</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: #f3f5f9;
        }

        header {
            background: linear-gradient(to right, #4e4376, #2b5876);
            color: white;
            padding: 25px;
            text-align: center;
        }

        header h1 {
            margin: 0;
        }

        .dashboard {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
            gap: 30px;
            padding: 50px;
        }

        .admin-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
            padding: 30px;
            text-align: center;
            transition: 0.3s ease;
        }

        .admin-card:hover {
            transform: scale(1.02);
        }

        .admin-card i {
            font-size: 40px;
            color: #4e4376;
            margin-bottom: 20px;
        }

        .admin-card h3 {
            margin-bottom: 10px;
        }

        footer {
            background-color: #4e4376;
            color: white;
            text-align: center;
            padding: 15px;
        }
        
        #bodyy
        {
        	height: 80vh;
        }
        
    </style>
</head>
<body>

<header>
    <h1>Welcome, Admin <%= adminName %> 🛠️</h1>
    <p>Manage rooms, bookings, and reports</p>
</header>
<div id=bodyy>
<section class="dashboard">

    <a href="viewAllBookings.jsp" class="admin-card">
        <i class="fas fa-calendar-check"></i>
        <h3>All Bookings</h3>
        <p>View and manage all reservations.</p>
    </a>

    <a href="addRoom.jsp" class="admin-card">
        <i class="fas fa-plus-circle"></i>
        <h3>Add New Room</h3>
        <p>Add and configure new conference rooms.</p>
    </a>

    <a href="manageRooms.jsp" class="admin-card">
        <i class="fas fa-tools"></i>
        <h3>Manage Rooms</h3>
        <p>Edit, disable or delete room listings.</p>
    </a>

    <a href="logOut.jsp" class="admin-card">
        <i class="fas fa-sign-out-alt"></i>
        <h3>Logout</h3>
        <p>Securely exit the admin dashboard.</p>
    </a>

</section>
</div>
<footer>
    &copy; 2025 XYZ Corp | Admin Dashboard
</footer>

</body>
</html>
