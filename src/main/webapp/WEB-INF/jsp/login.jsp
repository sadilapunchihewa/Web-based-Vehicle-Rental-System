<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DriveLK - Login</title>
    <style>
        /* Reset and global styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f2f3f5;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            padding: 20px;
        }

        /* Login container */
        .login-container {
            width: 1000px;
            max-width: 100%;
            height: 600px;
            display: flex;
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 12px 35px rgba(0,0,0,0.12);
            overflow: hidden;
        }

        /* Left side - login form */
        .login-left {
            flex: 1;
            padding: 50px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        /* Logo and header */
        .logo {
            margin-bottom: 40px;
            text-align: center;
        }

        .logo h1 {
            color: #0891b2;
            font-size: 36px;
            font-weight: 700;
        }

        .logo p {
            color: #4b5563;
            font-size: 16px;
            margin-top: 5px;
        }

        /* Form elements */
        .form-group {
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #0891b2;
            font-weight: 500;
            font-size: 14px;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 14px 15px;
            border: 1px solid #e0e6ed;
            border-radius: 6px;
            font-size: 15px;
            background: #f9fafb;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            outline: none;
            border-color: #f97316;
            box-shadow: 0 0 0 3px rgba(249, 115, 22, 0.15);
        }

        /* Login button */
        .login-btn {
            width: 100%;
            padding: 14px;
            background: #f97316;
            color: #ffffff;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .login-btn:hover {
            background-color: #ea580c;
        }

        /* Messages for errors and success */
        .message {
            padding: 12px;
            border-radius: 6px;
            margin-bottom: 25px;
            font-weight: 500;
            font-size: 14px;
        }

        .error-message {
            background-color: #fef2f2;
            color: #dc2626;
            border: 1px solid #fee2e2;
        }

        .success-message {
            background-color: #edf7ed;
            color: #065f46;
            border: 1px solid #d1e7dd;
        }

        /* Right side - welcome panel */
        .login-right {
            flex: 1;
            background: linear-gradient(135deg, #046072, #0891b2, #5ac8d8);
            color: #ffffff;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 50px;
            border-top-left-radius: 80px;
            border-bottom-left-radius: 80px;
        }

        .login-right h2 {
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 15px;
        }

        .login-right p {
            font-size: 15px;
            color: #f0f9ff;
            margin-bottom: 25px;
            text-align: center;
            max-width: 80%;
        }

        .login-right .signup-btn {
            background-color: #f97316;
            color: #ffffff;
            border: none;
            padding: 12px 35px;
            border-radius: 30px;
            font-weight: 600;
            font-size: 15px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .login-right .signup-btn:hover {
            background-color: #ea580c;
        }

        @media (max-width: 768px) {
            .login-container {
                flex-direction: column;
                width: 100%;
                height: auto;
            }

            .login-left, .login-right {
                padding: 30px;
                border-radius: 12px;
            }

            .login-right {
                border-top-left-radius: 12px;
                border-bottom-left-radius: 12px;
            }
        }
    </style>
</head>
<body>

<!-- Login Box Container -->
<div class="login-container">

    <!-- Left: Login Form -->
    <div class="login-left">
        <div class="logo">
            <h1>DriveLK</h1>
            <p>Securely sign in to your account</p>
        </div>

        <!-- Error message -->
        <c:if test="${not empty error}">
            <div class="message error-message">${error}</div>
        </c:if>

        <!-- Logout success message -->
        <c:if test="${param.logout == 'true'}">
            <div class="message success-message">You have been logged out successfully</div>
        </c:if>

        <!-- Login form -->
        <form method="post" action="${pageContext.request.contextPath}/login" id="loginForm">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required/>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required/>
            </div>

            <button type="submit" class="login-btn">Sign In</button>
        </form>
    </div>

    <!-- Right: Sign Up -->
    <div class="login-right">
        <h2>Welcome to DriveLK</h2>
        <p>Join our platform to access premium vehicle services and manage your account efficiently.</p>
        <button class="signup-btn" onclick="window.location.href='${pageContext.request.contextPath}/signup'">Sign Up</button>
    </div>
</div>

<script>
    // Validate form on submit
    document.getElementById('loginForm').addEventListener('submit', function (e) {
        const username = document.getElementById('username').value.trim();
        const password = document.getElementById('password').value.trim();

        if (!username || !password) {
            e.preventDefault();
            alert('Please fill in all fields');
            return;
        }

        // Show loading state on button
        const btn = document.querySelector('.login-btn');
        btn.textContent = 'Signing In...';
        btn.disabled = true;
    });

    // Focus on username field on page load
    window.addEventListener('load', function () {
        document.getElementById('username').focus();
    });

    // Submit form on Enter key press
    document.addEventListener('keypress', function (e) {
        if (e.key === 'Enter') {
            document.getElementById('loginForm').submit();
        }
    });
</script>

</body>
</html>
