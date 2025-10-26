<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<spring:url value="/admin/list" var="adminListUrl"/>
<spring:url value="/driver/list" var="driverListUrl"/>
<spring:url value="/vehicle/list" var="vehicleListUrl"/>
<spring:url value="/rental/list" var="rentalListUrl"/>
<spring:url value="/payment/admin/payments" var="financeListUrl"/>
<spring:url value="/support/admin/tickets" var="customerListUrl"/>

<html>
<head>
    <title>Update Ticket - DriveLK</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        /* Reset & Body */
        * {
            box-sizing: border-box;
        }
        body {
            margin: 0;
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9fafb;
            display: flex;
            min-height: 100vh;
            color: #374151;
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

        /* Main Content */
        .main-content {
            margin-left: 16rem;
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        header {
            background: #fff;
            padding: 1rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 1px 4px rgba(0,0,0,0.1);
        }
        header h2 {
            color: #0891b2;
            font-size: 1.5rem;
            margin: 0;
        }
        header .logout-btn {
            background: #f97316;
            color: #fff;
            padding: 0.5rem 1rem;
            border-radius: 0.5rem;
            text-decoration: none;
            font-weight: 600;
            transition: 0.3s;
        }
        header .logout-btn:hover {
            background: #ea580c;
        }

        main {
            padding: 2rem;
            flex: 1;
        }

        h1 {
            color: #0891b2;
            font-size: 1.75rem;
            font-weight: 700;
            margin-bottom: 1rem;
        }

        /* Form Card */
        .form-card {
            background: #fff;
            border-radius: 0.5rem;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            padding: 2rem;
            margin-bottom: 1.5rem;
            max-width: 800px;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-label {
            display: block;
            font-weight: 700;
            color: #374151;
            margin-bottom: 0.5rem;
            font-size: 0.95rem;
        }

        .form-control {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #d1d5db;
            border-radius: 0.375rem;
            font-size: 1rem;
            font-family: inherit;
            transition: border-color 0.2s;
        }

        .form-control:focus {
            outline: none;
            border-color: #0891b2;
            box-shadow: 0 0 0 3px rgba(8, 145, 178, 0.1);
        }

        textarea.form-control {
            resize: vertical;
            min-height: 120px;
        }

        .form-control[readonly] {
            background-color: #f3f4f6;
            cursor: not-allowed;
        }

        /* Buttons */
        .btn {
            padding: 0.75rem 1.5rem;
            border-radius: 0.5rem;
            font-weight: 600;
            text-decoration: none;
            transition: 0.3s;
            display: inline-block;
            margin-right: 0.5rem;
            border: none;
            cursor: pointer;
            font-size: 1rem;
        }

        .btn-primary {
            background: #0891b2;
            color: #fff;
        }
        .btn-primary:hover {
            background: #0e7490;
        }

        .btn-secondary {
            background: #6b7280;
            color: #fff;
        }
        .btn-secondary:hover {
            background: #4b5563;
        }

        /* Back link */
        .back-link {
            display: inline-block;
            margin-top: 2rem;
            color: #f97316;
            font-weight: 600;
            text-decoration: none;
        }
        .back-link:hover {
            text-decoration: underline;
        }

        /* Info Box */
        .info-box {
            background: #e0ecff;
            border-left: 4px solid #0891b2;
            padding: 1rem;
            border-radius: 0.375rem;
            margin-bottom: 1.5rem;
        }

        .info-label {
            font-weight: 700;
            color: #1e40af;
            margin-bottom: 0.25rem;
        }

        .info-value {
            color: #374151;
            font-size: 0.95rem;
        }

        /* Responsive */
        @media(max-width: 768px) {
            .sidebar {
                position: relative;
                width: 100%;
                height: auto;
                box-shadow: none;
            }
            .main-content {
                margin-left: 0;
            }
        }
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
            <li><a href="<spring:url value='/admin/dashboard'/>" class="sidebar-link">Dashboard</a></li>
            <li><a href="${adminListUrl}" class="sidebar-link">Manage Admins</a></li>
            <li><a href="${driverListUrl}" class="sidebar-link">Manage Drivers</a></li>
            <li><a href="${vehicleListUrl}" class="sidebar-link">Manage Vehicles</a></li>
            <li><a href="${rentalListUrl}" class="sidebar-link">Manage Rentals</a></li>
            <li><a href="${financeListUrl}" class="sidebar-link">Manage Finances</a></li>
            <li><a href="${customerListUrl}" class="sidebar-link active">Manage Customer Tickets</a></li>
        </ul>
    </nav>
</aside>
<!-- Main Content -->
<div class="main-content">
    <!-- Header -->
    <header>
        <h2>Update Support Ticket</h2>
        <div>
            <span style="margin-right:1rem; color:#374151;">
                Welcome, <c:out value="${sessionScope.user.username != null ? sessionScope.user.username : 'Admin'}"/>
            </span>
            <a href="<spring:url value='/logout'/>" class="logout-btn">Logout</a>
        </div>
    </header>

    <!-- Main Area -->
    <main>
        <h1 style="color: #f97316;">Update Ticket - ${ticket.ticketId}</h1>

        <div class="info-box">
            <div class="info-label">Customer ID</div>
            <div class="info-value">${ticket.customerId}</div>
        </div>

        <div class="form-card">
            <form action="<spring:url value='/support/admin/ticket/update/${ticket.ticketId}'/>" method="post">
                <div class="form-group">
                    <label class="form-label">Ticket ID</label>
                    <input type="text" class="form-control" value="${ticket.ticketId}" readonly>
                </div>

                <div class="form-group">
                    <label class="form-label">Customer Description</label>
                    <textarea class="form-control" readonly>${ticket.description}</textarea>
                </div>

                <div class="form-group">
                    <label class="form-label">Status *</label>
                    <select name="status" class="form-control" required>
                        <option value="Open" ${ticket.status == 'Open' ? 'selected' : ''}>Open</option>
                        <option value="In Progress" ${ticket.status == 'In Progress' ? 'selected' : ''}>In Progress</option>
                        <option value="Resolved" ${ticket.status == 'Resolved' ? 'selected' : ''}>Resolved</option>
                        <option value="Closed" ${ticket.status == 'Closed' ? 'selected' : ''}>Closed</option>
                    </select>
                </div>

                <div class="form-group">
                    <label class="form-label">Admin Response *</label>
                    <textarea name="response" class="form-control" required placeholder="Enter your response to the customer...">${ticket.response}</textarea>
                </div>

                <div style="margin-top: 2rem;">
                    <button type="submit" class="btn btn-primary">Update Ticket</button>
                    <a href="<spring:url value='/support/admin/tickets'/>" class="btn btn-secondary">Cancel</a>
                </div>
            </form>
        </div>

        <a href="<spring:url value='/support/admin/tickets'/>" class="back-link">← Back to Tickets List</a>
    </main>
</div>
</body>
</html>
