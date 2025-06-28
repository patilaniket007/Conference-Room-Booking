<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List, model.Room, dao.RoomDAO" %>
<%@ page session="true" %>
<%
    if (session.getAttribute("role") == null || !"admin".equals(session.getAttribute("role"))) {
        response.sendRedirect("login.jsp");
        return;
    }

    RoomDAO dao = new RoomDAO();
    List<Room> rooms = dao.getAllRooms();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Rooms</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f0f2f5;
            margin: 0;
            padding: 20px;
        }
        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }
        .room-container {
            width: 95%;
            margin: auto;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            overflow-x: auto;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 12px;
            overflow: hidden;
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
            background-color: #fdfdfd;
        }
        input[type="text"], input[type="number"] {
            padding: 5px;
            width: 100px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }
        input[type="checkbox"] {
            transform: scale(1.2);
        }
        .actions {
            display: flex;
            gap: 5px;
            justify-content: center;
        }
        .actions input[type="submit"] {
            padding: 6px 12px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }
        .actions input[value="Update"] {
            background-color: #28a745;
            color: white;
        }
        .actions input[value="Delete"] {
            background-color: #dc3545;
            color: white;
        }
        .actions input:hover {
            opacity: 0.9;
        }
    </style>
</head>
<body>

    <h2><i class="fas fa-tools"></i> Manage Conference Rooms</h2>

    <div class="room-container">
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Capacity</th>
                <th>Projector</th>
                <th>Whiteboard</th>
                <th>Actions</th>
            </tr>

            <%
                for (Room room : rooms) {
            %>
            <tr>
                <form action="UpdateRoomServlet" method="post">
                    <td><%= room.getId() %>
                        <input type="hidden" name="id" value="<%= room.getId() %>" />
                    </td>
                    <td><input type="text" name="name" value="<%= room.getName() %>" /></td>
                    <td><input type="number" name="capacity" value="<%= room.getCapacity() %>" /></td>
                    <td><input type="checkbox" name="projector" <%= room.isProjector() ? "checked" : "" %> /></td>
                    <td><input type="checkbox" name="whiteboard" <%= room.isWhiteboard() ? "checked" : "" %> /></td>
                    <td class="actions">
                        <input type="submit" value="Update" />
                </form>
                <form action="DeleteRoomServlet" method="post" onsubmit="return confirm('Are you sure to delete this room?');">
                    <input type="hidden" name="id" value="<%= room.getId() %>" />
                    <input type="submit" value="Delete" />
                </form>
                    </td>
            </tr>
            <%
                }
            %>
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
