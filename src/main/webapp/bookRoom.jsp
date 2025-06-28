<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="dao.RoomDAO, model.Room, java.util.List" %>
<%@ page session="true" %>
<%
    if (session.getAttribute("role") == null || !"user".equals(session.getAttribute("role"))) {
        response.sendRedirect("login.jsp");
        return;
    }

    RoomDAO roomDAO = new RoomDAO();
    List<Room> rooms = roomDAO.getAllRooms();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Book Conference Room</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f8f9fa;
            padding: 30px;
        }
        .form-container {
            max-width: 600px;
            background: #fff;
            margin: auto;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 25px;
        }
        label {
            display: block;
            margin-bottom: 6px;
            font-weight: bold;
        }
        select, input {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }
        button {
            width: 100%;
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 12px;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
        }
        .success, .error {
            text-align: center;
            margin-bottom: 20px;
            font-weight: bold;
        }
        .success { color: green; }
        .error { color: red; }
    </style>
</head>
<body>

<div class="form-container">
    <h2><i class="fas fa-calendar-plus"></i> Book a Conference Room</h2>

    <% if (request.getAttribute("message") != null) { %>
        <div class="<%= request.getAttribute("status") %>">
            <%= request.getAttribute("message") %>
        </div>
    <% } %>

    <form action="BookRoomServlet" method="post">
        <label for="roomId">Select Room</label>
        <select name="roomId" required>
            <% for (Room room : rooms) { %>
                <option value="<%= room.getId() %>"><%= room.getName() %> (Capacity: <%= room.getCapacity() %>)</option>
            <% } %>
        </select>

        <label for="date">Date</label>
        <input type="date" name="date" required min="<%= java.time.LocalDate.now() %>"/>

        <label for="startTime">Start Time</label>
        <input type="time" name="startTime" required />

        <label for="endTime">End Time</label>
        <input type="time" name="endTime" required />

        <button type="submit">Book Now</button>
    </form>
</div>

</body>
</html>
