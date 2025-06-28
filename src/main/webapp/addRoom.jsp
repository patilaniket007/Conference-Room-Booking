<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add New Room</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 40px;
            background: #f4f4f4;
        }
        .addroom {
            width: 400px;
            margin: auto;
            padding: 20px;
            border-radius: 12px;
           
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
        }
        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
        }
        label {
            font-weight: bold;
        }
        input[type="submit"] {
            background: #2b5876;
            color: white;
            border: none;
            padding: 10px;
            width: 100%;
            border-radius: 5px;
        }
    </style>
</head>
<body>

<h2 align="center">Add New Conference Room</h2>

<form class="addroom" action="AddRoomServlet" method="post">
    <label>Room Name:</label>
    <input type="text" name="name" required />

    <label>Capacity:</label>
    <input type="number" name="capacity" min="1" required />

    <label>
        <input type="checkbox" name="projector" /> Projector
    </label><br/>
    
    <label>
        <input type="checkbox" name="whiteboard" /> Whiteboard
    </label><br/><br/>

    <input type="submit" value="Add Room" />
</form>

<div style="position: fixed; top: 20px; right: 30px;">
    <form action="adminDashboard.jsp" method="get">
        <button type="submit" style="background-color: #007bff; color: white; padding: 10px 18px; border: none; border-radius: 6px; cursor: pointer;">
            🏠 Go to Homepage
        </button>
    </form>
</div>

</body>
</html>
