<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Dashboard | Conference Booking</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: #f4f7fc;
            
        }

        header {
            background: linear-gradient(to right, #2b5876, #4e4376);
            color: white;
            padding: 20px 30px;
            text-align: center;
        }

        header h1 {
            margin: 0;
            font-size: 2rem;
        }

        .dashboard {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            padding: 40px;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            text-align: center;
            transition: 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card img {
            width: 60px;
            margin-bottom: 15px;
        }

        .card h3 {
            margin: 15px 0 10px;
        }

        .card p {
            color: #555;
        }

        footer {
            background-color: #2b5876;
            color: white;
            text-align: center;
            padding: 15px;
            margin-top: 40px;
        }
        
        #bodyy
        {
        	height:90vh;
        }
        
    </style>
</head>
<body>
<div id=bodyy>
<header>
    <h1>Welcome, <%= username %> 🎉</h1>
    <p>Your Room Booking Portal</p>
</header>

<section class="dashboard">

    <a href="searchRooms.jsp" class="card">
        <img src="https://cdn-icons-png.flaticon.com/512/2991/2991108.png" alt="Search Room">
        <h3>Search & Book Room</h3>
        <p>Find available rooms and book instantly.</p>
    </a>

    <a href="myBookings.jsp" class="card">
        <img src="https://cdn-icons-png.flaticon.com/512/891/891462.png" alt="My Bookings">
        <h3>My Bookings</h3>
        <p>View and manage your current bookings.</p>
    </a>

    <a href="logOut.jsp" class="card">
        <img src="https://cdn-icons-png.flaticon.com/512/1828/1828490.png" alt="Logout">
        <h3>Logout</h3>
        <p>Sign out from the system securely.</p>
    </a>

</section>
</div>
<footer>
    &copy; 2025 XYZ Corp | All rights reserved
</footer>

</body>
</html>
