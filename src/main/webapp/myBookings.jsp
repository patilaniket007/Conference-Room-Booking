<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List, model.Booking, dao.BookingDAO, java.time.format.DateTimeFormatter" %>
<%@ page session="true" %>
<%
    if (session.getAttribute("role") == null || !"user".equals(session.getAttribute("role"))) {
        response.sendRedirect("login.jsp");
        return;
    }

    int userId = (Integer) session.getAttribute("userId");
    BookingDAO dao = new BookingDAO();
    List<Booking> bookings = dao.getBookingsByUserId(userId);
%>

<html>
<head>
    <title>My Bookings</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f4f6f9;
            padding: 30px;
        }
        .container {
            max-width: 1000px;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 25px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 14px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }
        th {
            background: #007bff;
            color: white;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .no-data {
            text-align: center;
            color: #888;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>My Bookings</h2>

    <% if (bookings != null && !bookings.isEmpty()) { %>
        <table>
            <tr>
                <th>Booking ID</th>
                <th>Room ID</th>
                <th>Date</th>
                <th>Start Time</th>
                <th>End Time</th>
            </tr>
            <% for (Booking b : bookings) { %>
                <tr>
                    <td><%= b.getId() %></td>
                    <td><%= b.getRoomId() %></td>
                    <td><%= b.getBookingDate().toString() %></td>
                    <td><%= b.getStartTime().toString() %></td>
                    <td><%= b.getEndTime().toString() %></td>
                </tr>
            <% } %>
        </table>
    <% } else { %>
        <p class="no-data">You have no bookings at the moment.</p>
    <% } %>
</div>

<div style="position: fixed; top: 20px; right: 30px;">
    <form action="userDashboard.jsp" method="get">
        <button type="submit" style="background-color: #007bff; color: white; padding: 10px 18px; border: none; border-radius: 6px; cursor: pointer;">
            🏠 Go to Homepage
        </button>
    </form>
</div>


</body>
</html>