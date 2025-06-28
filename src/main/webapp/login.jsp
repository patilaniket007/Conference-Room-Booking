<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Conference Room Booking</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background: linear-gradient(to right, #141E30, #243B55);
            font-family: 'Segoe UI', sans-serif;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
        }

        .login-box {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 40px;
            border-radius: 15px;
            width: 360px;
            text-align: center;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.4);
        }

        .login-box h2 {
            margin-bottom: 25px;
            font-weight: 600;
            color: #ffffff;
        }

        input[type="text"],
        input[type="password"] {
            width: 90%;
            padding: 12px;
            margin: 12px 0;
            border: none;
            border-radius: 8px;
            outline: none;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background: #00c6ff;
            background: linear-gradient(to right, #0072ff, #00c6ff);
            border: none;
            border-radius: 8px;
            color: white;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
        }

        input[type="submit"]:hover {
            background: linear-gradient(to right, #0050b3, #00aaff);
        }

        .btn-link {
            display: inline-block;
            margin-top: 15px;
            color: #f1f1f1;
            text-decoration: underline;
            font-size: 15px;
        }

        .error {
            color: #ff6b6b;
            margin-top: 10px;
        }
    </style>
</head>
<body>

    <div class="login-box">
        <h2>Login</h2>

        <form action="LoginServlet" method="post">
            <input type="text" name="username" placeholder="Username" required />
            <input type="password" name="password" placeholder="Password" required />
            <input type="submit" value="Login" />
        </form>

        <p class="error">${error}</p>
        <a href="register.jsp" class="btn-link">Don't have an account? Register</a>
    </div>

</body>
</html>
