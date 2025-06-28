<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List, model.Room, dao.RoomDAO" %>
<%@ page session="true" %>
<%
    if (session.getAttribute("role") == null || !"user".equals(session.getAttribute("role"))) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Room> availableRooms = (List<Room>) request.getAttribute("availableRooms");
    String date = (String) request.getAttribute("date");
    String startTime = (String) request.getAttribute("startTime");
    String endTime = (String) request.getAttribute("endTime");
    String error = (String) request.getAttribute("error");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Search Available Rooms</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f2f2f2;
            padding: 20px;
        }
        .container {
            max-width: 900px;
            background: white;
            padding: 30px;
            margin: auto;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            color: #333;
        }
        form {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            margin-bottom: 30px;
        }
        label {
            flex: 1 0 100%;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input, select {
            padding: 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
            flex: 1;
        }
        button {
            padding: 12px 20px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }
        th {
            background: #f0f0f0;
        }
        .error {
            color: red;
            text-align: center;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Search Conference Room Availability</h2>

    <% if (error != null) { %>
        <div class="error"><%= error %></div>
    <% } %>

    <form action="AvailableRoomsServlet" method="get">
        <label>Select Date:</label>
        <input type="date" name="date" required min="<%= java.time.LocalDate.now() %>"/>

        <label>Start Time:</label>
        <input type="time" name="startTime" required />

        <label>End Time:</label>
        <input type="time" name="endTime" required />

        <button type="submit">Search Rooms</button>
    </form>

    <% if (availableRooms != null && !availableRooms.isEmpty()) { %>
        <h3>Available Rooms:</h3>
        <table>
            <tr>
                <th>Name</th>
                <th>Capacity</th>
                <th>Projector</th>
                <th>Whiteboard</th>
                <th>Action</th>
            </tr>
            <% for (Room r : availableRooms) { %>
                <tr>
                    <td><%= r.getName() %></td>
                    <td><%= r.getCapacity() %></td>
                    <td><%= r.isProjector() ? "Yes" : "No" %></td>
                    <td><%= r.isWhiteboard() ? "Yes" : "No" %></td>
                    <td>
                        <form action="BookRoomServlet" method="post">
                            <input type="hidden" name="roomId" value="<%= r.getId() %>">
                            <input type="hidden" name="date" value="<%= date %>">
                            <input type="hidden" name="startTime" value="<%= startTime %>">
                            <input type="hidden" name="endTime" value="<%= endTime %>">
                            <button type="submit">Book</button>
                        </form>
                    </td>
                </tr>
            <% } %>
        </table>
    <% } else if (availableRooms != null) { %>
        <p>No rooms are available for the selected time.</p>
    <% } %>

	<div style="position: fixed; top: 20px; right: 30px;">
    <form action="userDashboard.jsp" method="get">
        <button type="submit" style="background-color: #007bff; color: white; padding: 10px 18px; border: none; border-radius: 6px; cursor: pointer;">
            🏠 Go to Homepage
        </button>
    </form>
</div>
	
</div>

</body>
</html>
