<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>City Church - Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            background-color: #211A1D;
            color: #ffffff;
            font-family: 'Inter', sans-serif;
            margin: 0;
            padding: 40px;
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            padding-bottom: 20px;
            margin-bottom: 40px;
        }
        h1 { color: #8075FF; margin: 0; font-size: 24px; }
        .logout-btn {
            background: transparent;
            border: 1px solid #ff4d4d;
            color: #ff4d4d;
            padding: 8px 16px;
            border-radius: 6px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s;
            text-decoration: none;
        }
        .logout-btn:hover {
            background: #ff4d4d;
            color: white;
        }
        .grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 24px;
        }
        .card {
            background: rgba(255, 255, 255, 0.03);
            border: 1px solid rgba(255, 255, 255, 0.1);
            padding: 24px;
            border-radius: 12px;
        }
        .card h3 { margin-top: 0; color: #8075FF; }
        .btn {
            display: inline-block;
            background: #6320EE;
            color: white;
            padding: 10px 20px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 500;
            margin-top: 12px;
            border: none;
            cursor: pointer;
            transition: 0.2s;
        }
        .btn:hover { background: #8075FF; }
        .textarea-input {
            width: 100%;
            box-sizing: border-box;
            border-radius: 8px;
            padding: 12px;
            background: rgba(0,0,0,0.2);
            color: white;
            border: 1px solid rgba(255, 255, 255, 0.2);
            margin-top: 16px;
            margin-bottom: 12px;
            font-family: 'Inter', sans-serif;
            resize: vertical;
        }
        .textarea-input:focus {
            outline: none;
            border-color: #6320EE;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>City Church Platform</h1>
        <a href="logout" class="logout-btn">Logout</a>
    </div>

    <div class="grid">
        <div class="card">
            <h3>Live Notifications</h3>
            <p>View real-time announcements broadcasted to the congregation.</p>
            <a href="notification.jsp" class="btn" >Open Notification Feed</a>
        </div>

        <%
            String userRole = (String) session.getAttribute("role");
            if (userRole != null && (userRole.equalsIgnoreCase("LEADER") || userRole.equalsIgnoreCase("CONGRESS") || userRole.equalsIgnoreCase("ADMIN"))) {
        %>
        <div class="card" style="border-color: #6320EE;">
            <h3>Leadership Portal</h3>
            <p>Broadcast instant notifications and alerts via WebSocket & JMS.</p>

            <textarea id="broadcastText" class="textarea-input" rows="3" required placeholder="Type your broadcast message here..."></textarea>
            <button onclick="sendBroadcast()" class="btn" style="width: 100%;">Send Broadcast</button>
        </div>

        <script>
            function sendBroadcast() {
                const text = document.getElementById("broadcastText").value;
                if (!text || text.trim() === "") {
                    return;
                }

                fetch('publish', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                    body: 'notificationText=' + encodeURIComponent(text)
                })
                .then(response => {
                    if (response.ok) {
                        document.getElementById("broadcastText").value = "";
                    }
                })
                .catch(error => {
                    console.error(error);
                });
            }
        </script>
        <% } %>
    </div>
</body>
</html>