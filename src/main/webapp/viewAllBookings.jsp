<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List, model.Booking, dao.BookingDAO" %>
<%@ page session="true" %>
<%
    if (session.getAttribute("role") == null || !"admin".equals(session.getAttribute("role"))) {
        response.sendRedirect("login.jsp");
        return;
    }

    BookingDAO bookingDAO = new BookingDAO();
    List<Booking> bookings = bookingDAO.getAllBookings();
%>
<!DOCTYPE html>
<html>
<head>
    <title>All Bookings</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f4f6f9;
            padding: 20px;
        }
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }
        .table-container {
            width: 95%;
            margin: auto;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0,0,0,0.08);
            overflow-x: auto;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 12px;
        }
        th, td {
            padding: 14px;
            text-align: center;
            border-bottom: 1px solid #eee;
        }
        th {
            background-color: #007BFF;
            color: white;
        }
        td {
            background-color: #fafafa;
        }
    </style>
</head>
<body>

<h2><i class="fas fa-calendar-check"></i> All Conference Room Bookings</h2>

<div class="table-container">
    <table>
        <thead>
        <tr>
            <th>Booking ID</th>
            <th>User</th>
            <th>Room</th>
            <th>Date</th>
            <th>Start Time</th>
            <th>End Time</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (Booking b : bookings) {
        %>
        <tr>
            <td><%= b.getId() %></td>
            <td><%= b.getUsername() %></td>
            <td><%= b.getRoomName() %></td>
            <td><%= b.getBookingDate() %></td>
            <td><%= b.getStartTime() %></td>
            <td><%= b.getEndTime() %></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

<div style="position: fixed; top: 20px; right: 30px;">
    <form action="adminDashboard.jsp" method="get">
        <button type="submit" style="background-color: #007bff; color: white; padding: 10px 18px; border: none; border-radius: 6px; cursor: pointer;">
            🏠 Go to Homepage
        </button>
    </form>
</div>


</body>
</html>
