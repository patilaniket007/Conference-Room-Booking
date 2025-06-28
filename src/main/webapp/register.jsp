<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register - Conference Room Booking</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background: linear-gradient(to right, #2C3E50, #4CA1AF);
            font-family: 'Segoe UI', sans-serif;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
        }

        .register-box {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 40px;
            border-radius: 15px;
            width: 400px;
            text-align: center;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.4);
        }

        .register-box h2 {
            margin-bottom: 25px;
            font-weight: 600;
        }

        input[type="text"],
        input[type="password"],
        select {
            width: 90%;
            padding: 12px;
            margin: 10px 0;
            border: none;
            border-radius: 8px;
            outline: none;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background: linear-gradient(to right, #16A085, #00b09b);
            border: none;
            border-radius: 8px;
            color: white;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
        }

        input[type="submit"]:hover {
            background: linear-gradient(to right, #0e786c, #01907a);
        }

        .btn-link {
            display: inline-block;
            margin-top: 15px;
            color: #f1f1f1;
            text-decoration: underline;
        }

        .error {
            color: #ff6b6b;
            margin-top: 10px;
        }

        .success {
            color: #2ecc71;
            margin-top: 10px;
        }
    </style>
</head>
<body>

    <div class="register-box">
        <h2>Create Account</h2>

        <form action="RegisterServlet" method="post">
            <input type="text" name="username" placeholder="Username" required />
            <input type="password" name="password" placeholder="Password" required />
            <select name="role" required>
                <option value="">Select Role</option>
                <option value="user">User</option>
                <option value="admin">Admin</option>
            </select>
            <input type="submit" value="Register" />
        </form>

        <p class="error">${error}</p>
        <p class="success">${success}</p>

        <a href="login.jsp" class="btn-link">Already have an account? Login</a>
    </div>

</body>
</html>
