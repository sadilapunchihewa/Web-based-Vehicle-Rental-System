<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<spring:url value="/admin/add" var="addUrl"/>
<spring:url value="/admin/list" var="listUrl"/>
<spring:url value="/admin/dashboard" var="dashboardUrl"/>

<html>
<head>
    <title>Add Admin - DriveLK</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #dee3e3;
            margin: 0;
            display: flex;
            min-height: 100vh;
        }

        /* Sidebar */
        .sidebar {
            width: 256px;
            background-color: #ffffff;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            position: fixed;
            height: 100%;
            overflow-y: auto;
            z-index: 10;
        }
        .sidebar .logo {
            display: flex;
            align-items: center;
            padding: 24px;
            font-weight: bold;
        }
        .sidebar .logo span { font-size: 24px; margin-right: 8px; }
        .sidebar nav ul { list-style: none; padding: 0; margin: 0; }
        .sidebar nav ul li { margin: 0; }
        .sidebar-link {
            display: flex;
            align-items: center;
            padding: 12px 24px;
            color: #4b5563;
            font-weight: 600;
            border-radius: 8px;
            transition: all 0.3s ease;
            text-decoration: none;
        }
        .sidebar-link:hover, .sidebar-link.active {
            background-color: #e0ecff;
            color: #0891b2;
        }


        /* Header */
        header {
            background: #fff;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
            padding: 12px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: fixed;
            top: 0;
            left: 250px;
            right: 0;
            z-index: 20;
        }
        header h2 {
            font-size: 20px;
            font-weight: 600;
            color: #0891b2;
            margin: 0;
        }
        header a {
            background: #f97316;
            color: #fff;
            padding: 8px 16px;
            border-radius: 6px;
            text-decoration: none;
            transition: 0.2s;
        }
        header a:hover {
            background: #ea580c;
        }

        /* Main Content */
        .main-content {
            flex: 1;
            margin-left: 256px;
            display: flex;
            flex-direction: column;
        }
        header {
            background: #fff;
            padding: 16px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 1px 4px rgba(0,0,0,0.1);
            position: fixed;
            top:0;
            left: 256px;
            right: 0;
            z-index: 20;
        }
        header h2 { color: #0891b2; font-size: 1.5rem; margin:0; }
        .logout-btn {
            background: #f97316;
            color: #fff;
            padding: 8px 16px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            transition: 0.3s;
        }
        .logout-btn:hover {
            background: #ea580c;
        }

        main {
            padding: 100px 24px 24px 24px;
        }

        /* Form Container */
        .form-container {
            background: #fff;
            padding: 32px;
            border-radius: 16px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.08);
            max-width: 650px;
            margin: auto;
            border: 1px solid #e5e7eb;
        }
        .form-container h3 {
            margin-bottom: 20px;
            font-size: 1.25rem;
            color: #111827;
            border-bottom: 2px solid #0891b2;
            padding-bottom: 8px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }
        .form-grid div { display: flex; flex-direction: column; }

        label {
            margin-bottom: 6px;
            font-weight: 600;
            color: #374151;
            font-size: 0.95rem;
        }
        input[type="text"], input[type="password"] {
            padding: 12px 14px;
            border: 1px solid #d1d5db;
            border-radius: 10px;
            background-color: #f9fafb;
            font-size: 0.95rem;
            transition: all 0.25s ease;
        }
        input:focus {
            border-color: #0891b2;
            background-color: #fff;
            box-shadow: 0 0 0 4px rgba(8,145,178,0.15);
        }
        input[readonly] { background: #f3f4f6; color: #6b7280; cursor: not-allowed; }
        .col-span-2 { grid-column: span 2; }

        /* Buttons */
        .button-group {
            display:flex;
            justify-content:center;
            align-items:center;
            gap:14px;
            flex-wrap:nowrap;
            margin-top:24px;
        }
        .form-grid .button-group{
            flex-direction:row !important;
            justify-content:center;
            gap:14px;
            width:auto !important;
            flex:0 0 auto !important;
            display:inline-flex !important;
            white-space:nowrap;
        }

        .btn {
            padding: 10px 18px;
            border-radius: 10px;
            font-weight: 600;
            border: none;
            cursor: pointer;
            text-decoration: none;
            text-align: center;
            min-width: 70px;
            transition: transform 0.2s ease, background 0.3s ease;
        }
        .btn:hover { transform: translateY(-2px); }

        .btn-submit { background: #0891b2; color: #fff; }
        .btn-submit:hover { background: #0e7490; }
        .btn-cancel { background: #e5e7eb; color: #374151; }
        .btn-cancel:hover { background: #d1d5db; }
        .btn-back { background: #f97316; color: #fff; }
        .btn-back:hover { background: #ea580c; }

        /* Error */
        .error-message {
            grid-column: 1 / -1;
            padding: 10px;
            background: #fee2e2;
            color: #b91c1c;
            border-radius: 6px;
        }

        /* Animations */
        .fade-in {
            opacity: 0;
            transform: translateY(20px);
            animation: fadeInUp 0.6s ease-out forwards;
        }
        @keyframes fadeInUp {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        /* Responsive */
        @media(max-width: 768px) {
            .sidebar { position: relative; width: 100%; height: auto; left:0; }
            .main-content { margin-left: 0; }
            header { left: 0; width: 100%; }
            .form-grid { grid-template-columns: 1fr; }
            .button-group { flex-wrap: wrap; }
            .btn { flex: 1; min-width: auto; }
        }
    </style>
</head>
<body>
<!-- Sidebar -->
<aside class="sidebar">
    <div class="logo"><h1 style="color: #0891b2;">DriveLK</h1></div>
    <nav>
        <ul>
            <li><a href="<spring:url value='/admin/dashboard'/>" class="sidebar-link">Dashboard</a></li>
            <li><a href="${adminListUrl}" class="sidebar-link active">Manage Admins</a></li>
            <li><a href="${driverListUrl}" class="sidebar-link">Manage Drivers</a></li>
            <li><a href="${vehicleListUrl}" class="sidebar-link">Manage Vehicles</a></li>
            <li><a href="${rentalListUrl}" class="sidebar-link">Manage Rentals</a></li>
            <li><a href="${financeListUrl}" class="sidebar-link">Manage Finances</a></li>
            <li><a href="${customerListUrl}" class="sidebar-link">Manage Customer Tickets</a></li>
        </ul>
    </nav>
</aside>

<!-- Main Content -->
<div class="main-content">
    <!-- Header -->
    <header>
        <div style="display:flex; align-items:center; gap:16px;">
            <h2 style="font-weight: bold;">Add New Admin</h2>
        </div>
        <div style="display:flex; align-items:center; gap:16px;">
        <span style="color:#555;">
            Welcome, <c:out value="${sessionScope.user.username != null ? sessionScope.user.username : 'Admin'}"/>
        </span>
            <a href="<spring:url value='/logout'/>">Logout</a>
        </div>
    </header>

    <!-- Main Content Area -->
    <main>
        <div class="mb-6 fade-in" style="text-align:center; margin-bottom:20px;">
            <p>Fill in the details to create a new admin account.</p>
        </div>
        <div class="form-container fade-in">
            <form action="${addUrl}" method="post" class="form-grid">
                <c:if test="${not empty error}"><div class="error-message">${error}</div></c:if>

                <div>
                    <label for="userId">User ID (Suggested: ${suggestedUserId})</label>
                    <input type="text" id="userId" name="userId" value="${suggestedUserId}" required>
                </div>
                <div>
                    <label for="firstName">First Name</label>
                    <input type="text" id="firstName" name="firstName" required>
                </div>
                <div>
                    <label for="lastName">Last Name</label>
                    <input type="text" id="lastName" name="lastName" required>
                </div>
                <div>
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" required>
                </div>
                <div>
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <div>
                    <label for="contactInfo">Contact Info</label>
                    <input type="text" id="contactInfo" name="contactInfo">
                </div>

                <div class="button-group">
                    <button type="submit" class="btn btn-submit">
                        <span id="submit-text">Add Admin</span>
                    </button>
                    <a href="${listUrl}" class="btn btn-cancel">Cancel</a>
                    <a href="${dashboardUrl}" class="btn btn-back">Back to Dashboard</a>
                </div>
            </form>
        </div>
    </main>
</div>

<script>
    // Highlight active sidebar link
    const currentPath = window.location.pathname.replace(/\/$/, '');
    document.querySelectorAll('.sidebar-link').forEach(link => {
        const linkPath = link.getAttribute('href').replace(/\/$/, '');
        if (linkPath === currentPath) link.classList.add('active');
    });

    // Fade-in animation on load
    document.addEventListener('DOMContentLoaded', () => {
        document.querySelectorAll('.fade-in').forEach((el, index) => {
            el.style.animationDelay = `${index * 0.1}s`;
        });
    });

    // Client-side validation
    document.querySelector('form').addEventListener('submit', (e) => {
        let valid = true;
        const userId = document.getElementById('userId');
        const username = document.getElementById('username');
        const contactInfo = document.getElementById('contactInfo');

        [userId, username, contactInfo].forEach(input => {
            input.style.borderColor = "#ccc";
        });

        if (!/^[A][0-9]{3}$/.test(userId.value)) {
            valid = false;
            userId.style.borderColor = "red";
        }
        if (!/^[a-zA-Z0-9]{3,20}$/.test(username.value)) {
            valid = false;
            username.style.borderColor = "red";
        }
        if (contactInfo.value && !/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$|^[0-9]{10}$/.test(contactInfo.value)) {
            valid = false;
            contactInfo.style.borderColor = "red";
        }

        if (!valid) e.preventDefault();
    });
</script>
</body>
</html>
