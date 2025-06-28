<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Conference Room Booking System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #2b5876, #4e4376);
            color: white;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        header {
            background-color: rgba(0, 0, 0, 0.3);
            padding: 20px;
            text-align: center;
        }

        header h1 {
            font-size: 2.5em;
            margin-bottom: 10px;
        }

        main {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 40px 20px;
        }

        main h2 {
            font-size: 1.8em;
            margin-bottom: 15px;
        }

        main p {
            font-size: 1.1em;
            max-width: 600px;
            margin-bottom: 30px;
        }

        .buttons {
            display: flex;
            gap: 20px;
        }

        .buttons a {
            padding: 12px 24px;
            background-color: #ffffff;
            color: #2b5876;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .buttons a:hover {
            background-color: #ddd;
        }

        footer {
            background-color: rgba(0, 0, 0, 0.2);
            text-align: center;
            padding: 10px;
            font-size: 0.9em;
        }
    </style>
</head>
<body>

    <header>
        <h1>Conference Room Booking System</h1>
        <p>Simplify meeting room scheduling with ease</p>
    </header>

    <main>
        <h2>Welcome to  Corp's Room Reservation Portal</h2>
        <p>
            Book, manage, and track meeting room availability in real-time.
            Say goodbye to scheduling conflicts and manual coordination.
        </p>
        <div class="buttons">
            <a href="login.jsp">Login</a>
            <a href="register.jsp">Register</a>
        </div>
    </main>

    <footer>
        &copy; 2025 Corporation | All rights reserved
    </footer>

</body>
</html>
