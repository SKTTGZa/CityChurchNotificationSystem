<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>City Church - Register</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            background-color: #211A1D;
            color: #ffffff;
            font-family: 'Inter', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .card {
            background: rgba(255, 255, 255, 0.03);
            border: 1px solid rgba(255, 255, 255, 0.1);
            padding: 40px;
            border-radius: 16px;
            width: 350px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.4);
            backdrop-filter: blur(10px);
        }
        h2 { text-align: center; margin-bottom: 24px; font-weight: 600; color: #8075FF; }
        label { font-size: 14px; color: #b0b0b0; display: block; margin-bottom: 6px; }
        input, select {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            background: #211A1D;
            border: 1px solid #443c40;
            border-radius: 8px;
            color: white;
            font-size: 14px;
            box-sizing: border-box;
        }
        input:focus, select:focus { border-color: #6320EE; outline: none; }
        button {
            width: 100%;
            padding: 12px;
            background: #6320EE;
            border: none;
            border-radius: 8px;
            color: white;
            font-weight: 600;
            font-size: 15px;
            cursor: pointer;
            transition: background 0.2s;
        }
        button:hover { background: #8075FF; }
        .footer-link { text-align: center; margin-top: 16px; font-size: 14px; }
        .footer-link a { color: #8075FF; text-decoration: none; }
        .footer-link a:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <div class="card">
        <h2>Create Account</h2>
        <form action="register" method="POST">
            <label>Username</label>
            <input type="text" name="username" required>

            <label>Password</label>
            <input type="password" name="password" required>

            <label>Role</label>
            <select name="role">
                <option value="MEMBER">Member</option>
                <option value="LEADER">Leader</option>
            </select>

            <button type="submit">Register</button>
        </form>
        <div class="footer-link">
            Already have an account? <a href="login.jsp">Sign In</a>
        </div>
    </div>
</body>
</html>