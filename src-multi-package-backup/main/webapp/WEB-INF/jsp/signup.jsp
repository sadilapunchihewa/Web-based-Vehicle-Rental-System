<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DriveLK - Sign Up</title>
    <style>
        /* Global Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #ebedef;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            padding: 20px;
        }

        /* Signup Container */
        .signup-container {
            width: 1000px;
            height: 650px;
            max-width: 100%;
            display: flex;
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 12px 35px rgba(0,0,0,0.12);
            overflow: hidden;
        }

        /* Signup Form: Left side  */
        .signup-left {
            flex: 1;
            padding: 50px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .logo h1 {
            color: #0891b2;
            font-size: 36px;
            font-weight: 700;
            text-align: center;
        }

        .logo p {
            color: #4b5563;
            font-size: 16px;
            margin-top: 5px;
            text-align: left;
        }

        /* Form input styles */
        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #0891b2;
            font-weight: 500;
            font-size: 14px;
        }

        input[type="text"],
        input[type="password"],
        input[type="email"],
        input[type="tel"] {
            width: 100%;
            padding: 14px 15px;
            border: 1px solid #e0e6ed;
            border-radius: 6px;
            font-size: 15px;
            background: #f9fafb;
        }

        input:focus {
            outline: none;
            border-color: #f97316;
            box-shadow: 0 0 0 3px rgba(249, 115, 22, 0.15);
        }

        /* Submit button */
        .signup-btn {
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

        .signup-btn:hover {
            background-color: #ea580c;
        }

        /* Message (success or error) */
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

        /* /* Signup Form: Right side  */
        .signup-right {
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

        .signup-right h2 {
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 15px;
        }

        .signup-right p {
            font-size: 15px;
            color: #f0f9ff;
            margin-bottom: 25px;
            text-align: center;
            max-width: 80%;
        }

        /* Login button on right side */
        .login-link-btn {
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

        .login-link-btn:hover {
            background-color: #ea580c;
        }

        @media (max-width: 768px) {
            .signup-container {
                flex-direction: column;
                width: 100%;
                height: auto;
            }

            .signup-left, .signup-right {
                padding: 30px;
                border-radius: 0;
            }
        }
    </style>
</head>
<body>

<div class="signup-container">
    <!-- Signup Form: Left side -->
    <div class="signup-left">
        <div class="logo">
            <br><h1>DriveLK</h1>
            <p>Create your account</p>
        </div>

        <!-- Show error messages -->
        <c:if test="${not empty error}">
            <div class="message error-message">${error}</div>
        </c:if>

        <!-- Show success messages -->
        <c:if test="${not empty success}">
            <div class="message success-message">${success}</div>
        </c:if>

        <!-- Signup form -->
        <form method="post" action="${pageContext.request.contextPath}/signup" id="signupForm">
            <!-- First name -->
            <div class="form-group">
                <label for="firstName">First Name</label>
                <input type="text" id="firstName" name="firstName" required minlength="2" maxlength="30"/>
            </div>

            <!-- Last name -->
            <div class="form-group">
                <label for="lastName">Last Name</label>
                <input type="text" id="lastName" name="lastName" required minlength="2" maxlength="30"/>
            </div>

            <!-- Username -->
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required minlength="4" maxlength="20"/>
            </div>

            <!-- Password -->
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required minlength="6" maxlength="100"/>
            </div>

            <!-- Contact info -->
            <div class="form-group">
                <label for="contactInfo">Contact Info (Email or Phone)</label>
                <input type="text" id="contactInfo" name="contactInfo" required
                       pattern="(^[^\s@]+@[^\s@]+\.[^\s@]+$)|(^[0-9]{10}$)"
                       title="Enter a valid email or a 10-digit phone number"/>
            </div>

            <!-- Submit -->
            <button type="submit" class="signup-btn">Sign Up</button>
        </form>
    </div>

    <!-- Right: Login redirect -->
    <div class="signup-right">
        <h2>Already have an account?</h2>
        <p>Sign in to access your DriveLK account and enjoy premium services.</p>
        <!-- Button redirects to /login -->
        <button class="login-link-btn" onclick="window.location.href='${pageContext.request.contextPath}/login'">Login</button>
    </div>
</div>

<script>
    // Disable button after submit
    document.getElementById('signupForm').addEventListener('submit', function () {
        const btn = document.querySelector('.signup-btn');
        btn.textContent = 'Signing Up...';
        btn.disabled = true;
    });

    // Autofocus first field on page load
    window.addEventListener('load', function () {
        document.getElementById('firstName').focus();
    });
</script>

</body>
</html>
