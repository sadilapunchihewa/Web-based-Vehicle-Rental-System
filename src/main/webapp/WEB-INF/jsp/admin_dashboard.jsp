<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<spring:url value="/admin/list" var="adminListUrl"/>
<spring:url value="/customer/list" var="customerListUrl"/>
<spring:url value="/driver/list" var="driverListUrl"/>
<spring:url value="/vehicle/list" var="vehicleListUrl"/>
<spring:url value="/rental/list" var="rentalListUrl"/>
<spring:url value="/payment/admin/payments" var="financeListUrl"/>
<spring:url value="/support/admin/tickets" var="customerListUrl"/>

<html>
<head>
    <title>Admin Dashboard - DriveLK</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        /* Font & Colors */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9fafb;
            margin: 0;
            padding: 0;
            display: flex;
            min-height: 100vh;
        }
        a { text-decoration: none; color: inherit; }

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
        }
        .sidebar-link:hover, .sidebar-link.active {
            background-color: #e0ecff;
            color: #0891b2;
        }

        /* Main content */
        .main-content {
            margin-left: 256px;
            flex: 1;
            display: flex;
            flex-direction: column;
        }
        header {
            background-color: #ffffff;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
            padding: 16px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        header h2 { color: #0891b2; margin: 0; }
        header .header-right { display: flex; align-items: center; gap: 16px; }
        header .header-right a {
            background-color: #f97316;
            color: #ffffff;
            padding: 8px 16px;
            border-radius: 8px;
            transition: all 0.3s ease;

        }
        header .header-right a:hover { background-color: #ea580c; }

        main.container { padding: 24px; max-width: 1200px; margin: 0 auto; }
        main h1 { color: #0891b2; font-size: 28px; margin-bottom: 8px; }
        main p { color: #4b5563; margin-bottom: 24px; }

        /* Cards */
        .cards-container {
            display: grid;
            grid-template-columns: repeat(3, 1fr); /* 3 cards per row */
            gap: 24px;
        }
        .card {
            background-color: #ffffff;
            padding: 16px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.05);
            transition: all 0.3s ease;
        }
        .card:hover { box-shadow: 0 6px 15px rgba(0,0,0,0.1); }
        .card h3 { color: #0891b2; font-size: 18px; margin-bottom: 8px; }
        .card p { color: #4b5563; font-size: 14px; margin-bottom: 12px; }
        .card a {
            display: inline-block;
            background-color: #0891b2;
            color: #ffffff;
            padding: 8px 16px;
            border-radius: 8px;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        .card a:hover { background-color: #0e7490; }

        /* Fade-in animation */
        .fade-in { opacity: 0; transform: translateY(20px); animation: fadeInUp 0.6s ease-out forwards; }
        @keyframes fadeInUp { to { opacity: 1; transform: translateY(0); } }

        @media (max-width: 1024px) { .cards-container { grid-template-columns: repeat(2, 1fr); } }
        @media (max-width: 768px) { .cards-container { grid-template-columns: 1fr; } .main-content { margin-left: 0; } }
    </style>
</head>
<body>
<!-- Sidebar -->
<aside class="sidebar">
    <div class="logo">
        <h1 style="color: #0891b2;">DriveLK</h1>
    </div>
    <nav>
        <ul>
            <li><a href="<spring:url value='/admin/dashboard'/>" class="sidebar-link active">Dashboard</a></li>
            <li><a href="${adminListUrl}" class="sidebar-link">Manage Admins</a></li>
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
    <header>
        <h2>Admin Dashboard</h2>
        <div class="header-right">
            <span>Welcome, <c:out value="${sessionScope.user.username != null ? sessionScope.user.username : 'Admin'}"/></span>
            <a href="<spring:url value='/logout'/>">Logout</a>
        </div>
    </header>

    <main class="container">
        <div class="fade-in">
            <h1 style="color: #f97316;">Welcome to DriveLK Admin Panel</h1>
            <p>Manage system components efficiently from here.</p>
        </div>


        <div style="background-color: #d1d5db; padding: 24px; border-radius: 12px; box-shadow: 0 4px 10px rgba(0,0,0,0.05);">
            <div class="cards-container">
                <div class="card fade-in"><h3>Manage Admins</h3><p>Add, edit, or delete admin accounts.</p><a href="${adminListUrl}">Go to Admins</a></div>
                <div class="card fade-in" style="animation-delay:0.2s;"><h3>Manage Drivers</h3><p>Manage driver profiles, availability, licenses, and add new drivers.</p><a href="${driverListUrl}">Go to Drivers</a></div>
                <div class="card fade-in" style="animation-delay:0.3s;"><h3>Manage Vehicles</h3><p>Add, edit, or remove vehicles and update vehicle info.</p><a href="${vehicleListUrl}">Go to Vehicles</a></div>
                <div class="card fade-in" style="animation-delay:0.4s;"><h3>Manage Rentals</h3><p>View, update, or delete rental records and bookings.</p><a href="${rentalListUrl}">Go to Rentals</a></div>
                <div class="card fade-in" style="animation-delay:0.5s;"><h3>Manage Finances</h3><p>View and update payments, invoices, or financial records.</p><a href="${financeListUrl}">Go to Finances</a></div>
                <div class="card fade-in" style="animation-delay:0.1s;"><h3>Manage Customer Tickets</h3><p>Manage and resolve customer tickets.</p><a href="${customerListUrl}">Go to Customers</a></div>
            </div>
        </div>

    </main>
</div>

<script>
    // Highlight active sidebar link
    const currentPath = window.location.pathname.replace(/\/$/, '');
    document.querySelectorAll('.sidebar-link').forEach(link => {
        const linkPath = link.getAttribute('href').replace(/\/$/, '');
        if (linkPath === currentPath) { link.classList.add('active'); }
    });

    // Fade-in animation on load
    document.addEventListener('DOMContentLoaded', () => {
        document.querySelectorAll('.fade-in').forEach((el, index) => {
            el.style.animationDelay = `${index * 0.1}s`;
        });
    });
</script>
</body>
</html>
