<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Live Notification Feed</title>
    <link href='https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap' rel='stylesheet'>
    <style>
        body {
            background-color: #211A1D;
            color: #fff;
            font-family: 'Inter', sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 40px;
            margin: 0;
        }
        .feed-container {
            background: rgba(255, 255, 255, 0.03);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 16px;
            width: 100%;
            max-width: 600px;
            padding: 20px;
            min-height: 400px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
        }
        h2 {
            color: #8075FF;
            margin-top: 0;
            text-align: center;
        }
        .notification-item {
            background: rgba(99, 32, 238, 0.2);
            border-left: 4px solid #6320EE;
            padding: 15px;
            margin-bottom: 15px;
            border-radius: 4px;
            animation: fadeIn 0.5s ease-in-out;
        }
        .waiting {
            text-align: center;
            color: rgba(255, 255, 255, 0.5);
            font-style: italic;
            margin-top: 20px;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .back-link {
            color: #8075FF;
            text-decoration: none;
            margin-bottom: 20px;
            align-self: flex-start;
            margin-left: calc(50% - 300px);
        }
    </style>
</head>
<body>

    <a href="home.jsp" class="back-link">&larr; Back to Dashboard</a>

    <div class="feed-container">
        <h2>Live Announcements</h2>
        <div id="notificationBox">
            <div class="waiting">Waiting for new messages...</div>
        </div>
    </div>

    <script>
        const wsProtocol = window.location.protocol === 'https:' ? 'wss://' : 'ws://';
        const wsUrl = wsProtocol + window.location.host + '/notifications';

        const socket = new WebSocket(wsUrl);

        socket.onopen = function() {};

        socket.onmessage = function(event) {
            const box = document.getElementById('notificationBox');

            if (box.children.length === 1 && box.children[0].classList.contains('waiting')) {
                box.innerHTML = '';
            }

            const item = document.createElement('div');
            item.className = 'notification-item';
            item.textContent = event.data;
            box.prepend(item);
        };

        socket.onclose = function() {
            const box = document.getElementById('notificationBox');
            box.innerHTML += '<div class="waiting" style="color: #ff4d4d;">Connection lost. Please refresh.</div>';
        };
    </script>
</body>
</html>