<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>City Church - Send Announcement</title>
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
            width: 400px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.4);
        }
        h2 { text-align: center; margin-bottom: 24px; color: #8075FF; }
        label { font-size: 14px; color: #b0b0b0; display: block; margin-bottom: 6px; }
        textarea {
            width: 100%;
            height: 100px;
            padding: 12px;
            margin-bottom: 20px;
            background: #211A1D;
            border: 1px solid #443c40;
            border-radius: 8px;
            color: white;
            font-size: 14px;
            box-sizing: border-box;
            resize: none;
            font-family: 'Inter', sans-serif;
        }
        textarea:focus { border-color: #6320EE; outline: none; }
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
        .back-link { text-align: center; margin-top: 16px; font-size: 14px; }
        .back-link a { color: #8075FF; text-decoration: none; }
        .back-link a:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <div class="card">
        <h2>Broadcast Alert</h2>
        <form action="${pageContext.request.contextPath}/publish" method="POST">
            <label>Announcement Message</label>
            <textarea name="notificationText" placeholder="Type church update here..." required></textarea>

            <button type="submit">Broadcast Now</button>
        </form>
        <div class="back-link">
            <a href="home.jsp">&larr; Back to Dashboard</a>
        </div>
    </div>
</body>
</html>