<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DriveLK - Login</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .login-container {
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }

        .logo {
            margin-bottom: 30px;
        }

        .logo h1 {
            color: #333;
            font-size: 28px;
            margin-bottom: 5px;
        }

        .logo p {
            color: #666;
            font-size: 14px;
        }

        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
            font-weight: 500;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #e1e5e9;
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            outline: none;
            border-color: #667eea;
        }

        .login-btn {
            width: 100%;
            padding: 12px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: transform 0.2s ease;
        }

        .login-btn:hover {
            transform: translateY(-2px);
        }

        .login-btn:active {
            transform: translateY(0);
        }

        .message {
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
            font-weight: 500;
        }

        .error-message {
            background-color: #fee;
            color: #c33;
            border: 1px solid #fcc;
        }

        .success-message {
            background-color: #efe;
            color: #363;
            border: 1px solid #cfc;
        }

        .car-icon {
            font-size: 48px;
            margin-bottom: 10px;
        }

        @media (max-width: 480px) {
            .login-container {
                padding: 30px 20px;
            }
        }
    </style>
</head>
<body>
<div class="login-container">
    <div class="logo">
        <div class="car-icon">🚗</div>
        <h1>DriveLK</h1>
        <p>Sign in to your account</p>
    </div>

    <c:if test="${not empty error}">
        <div class="message error-message">${error}</div>
    </c:if>

    <c:if test="${param.logout == 'true'}">
        <div class="message success-message">You have been logged out successfully</div>
    </c:if>

    <form method="post" action="${pageContext.request.contextPath}/login" id="loginForm">
        <div class="form-group">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required/>
        </div>

        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required/>
        </div>

        <button type="submit" class="login-btn">Sign In</button>
    </form>
</div>

<script>
    // Simple form validation and enhancement
    document.getElementById('loginForm').addEventListener('submit', function(e) {
        const username = document.getElementById('username').value.trim();
        const password = document.getElementById('password').value.trim();

        if (!username || !password) {
            e.preventDefault();
            alert('Please fill in all fields');
            return;
        }

        // Add loading state to button
        const btn = document.querySelector('.login-btn');
        btn.textContent = 'Signing In...';
        btn.disabled = true;
    });

    // Focus on username field when page loads
    window.addEventListener('load', function() {
        document.getElementById('username').focus();
    });

    // Add enter key support
    document.addEventListener('keypress', function(e) {
        if (e.key === 'Enter') {
            document.getElementById('loginForm').submit();
        }
    });
</script>
</body>
</html>