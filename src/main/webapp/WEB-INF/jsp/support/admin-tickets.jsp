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
    <title>Support Tickets - DriveLK</title>
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

        /* Alert Messages */
        .alert {
            padding: 1rem;
            margin-bottom: 1rem;
            border-radius: 0.5rem;
            font-weight: 600;
        }
        .alert-success {
            background: #d1fae5;
            color: #065f46;
            border: 1px solid #10b981;
        }
        .alert-error {
            background: #fee2e2;
            color: #991b1b;
            border: 1px solid #dc2626;
        }

        /* Table */
        .table-container {
            background: #fff;
            border-radius: 0.5rem;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            overflow-x: auto;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 0.95rem;
        }
        thead {
            background: #0891b2;
            color: #fff;
        }
        th, td {
            padding: 0.75rem 1rem;
            text-align: left;
        }
        tr {
            border-bottom: 1px solid #e5e7eb;
            transition: background 0.2s;
        }
        tbody tr:hover {
            background-color: #f3f4f6;
        }

        /* Buttons inside table */
        .btn {
            padding: 0.4rem 0.8rem;
            border-radius: 0.5rem;
            font-weight: 600;
            text-decoration: none;
            font-size: 0.85rem;
            transition: 0.3s;
            display: inline-block;
            margin-right: 0.3rem;
            border: none;
            cursor: pointer;
        }
        .btn-view {
            background: #0891b2;
            color: #fff;
        }
        .btn-view:hover {
            background: #0e7490;
        }
        .btn-edit {
            background: #135c70;
            color: #fff;
        }
        .btn-edit:hover {
            background: #2092b1;
        }
        .btn-delete {
            background: #dc2626;
            color: #fff;
        }
        .btn-delete:hover {
            background: #b91c1c;
        }

        .status-badge {
            padding: 0.3rem 0.8rem;
            border-radius: 1rem;
            font-size: 0.8rem;
            font-weight: 600;
        }
        .status-open {
            background: #fef3c7;
            color: #92400e;
        }
        .status-in-progress {
            background: #dbeafe;
            color: #1e40af;
        }
        .status-resolved {
            background: #d1fae5;
            color: #065f46;
        }
        .status-closed {
            background: #e5e7eb;
            color: #4b5563;
        }

        /* Description cell */
        .description-cell {
            max-width: 300px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
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
        <h2>Customer Support Tickets</h2>
        <div>
            <span style="margin-right:1rem; color:#374151;">
                Welcome, <c:out value="${sessionScope.user.username != null ? sessionScope.user.username : 'Admin'}"/>
            </span>
            <a href="<spring:url value='/logout'/>" class="logout-btn">Logout</a>
        </div>
    </header>

    <!-- Main Area -->
    <main>
        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 1.5rem;">
            <h1 style="color: #f97316; margin: 0;">Manage Customer Tickets</h1>
        </div>

        <!-- Success/Error Messages -->
        <c:if test="${not empty success}">
            <div class="alert alert-success">${success}</div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert alert-error">${error}</div>
        </c:if>

        <div class="table-container">
            <table>
                <thead>
                <tr>
                    <th>Ticket ID</th>
                    <th>Customer ID</th>
                    <th>Description</th>
                    <th>Status</th>
                    <th>Response</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:choose>
                    <c:when test="${empty tickets}">
                        <tr>
                            <td colspan="6" style="text-align: center; padding: 2rem; color: #6b7280;">
                                No support tickets found
                            </td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="ticket" items="${tickets}">
                            <spring:url value="/support/admin/ticket/update/${ticket.ticketId}" var="updateUrl"/>
                            <tr>
                                <td>${ticket.ticketId}</td>
                                <td>${ticket.customerId}</td>
                                <td class="description-cell" title="${ticket.description}">
                                    ${ticket.description}
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${ticket.status == 'Open'}">
                                            <span class="status-badge status-open">Open</span>
                                        </c:when>
                                        <c:when test="${ticket.status == 'In Progress'}">
                                            <span class="status-badge status-in-progress">In Progress</span>
                                        </c:when>
                                        <c:when test="${ticket.status == 'Resolved'}">
                                            <span class="status-badge status-resolved">Resolved</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="status-badge status-closed">Closed</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td class="description-cell" title="${ticket.response}">
                                    <c:choose>
                                        <c:when test="${empty ticket.response}">
                                            <span style="color: #9ca3af; font-style: italic;">No response yet</span>
                                        </c:when>
                                        <c:otherwise>
                                            ${ticket.response}
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <a href="${updateUrl}" class="btn btn-edit">Update</a>

                                    <form action="<spring:url value='/support/admin/ticket/delete/${ticket.ticketId}'/>"
                                          method="post"
                                          style="display: inline;"
                                          onsubmit="return confirm('Are you sure you want to delete this ticket?');">
                                        <button type="submit" class="btn btn-delete">Delete</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
                </tbody>
            </table>
        </div>

        <a href="<spring:url value='/admin/dashboard'/>" class="back-link">Back to Dashboard</a>
    </main>
</div>
</body>
</html>
