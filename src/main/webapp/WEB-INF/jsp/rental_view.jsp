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
    <title>View Rental - DriveLK</title>
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

        /* Details Card */
        .details-card {
            background: #fff;
            border-radius: 0.5rem;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            padding: 2rem;
            margin-bottom: 1.5rem;
        }

        .details-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1.5rem;
        }

        .detail-item {
            padding: 1rem;
            background: #f9fafb;
            border-radius: 0.375rem;
            border-left: 4px solid #0891b2;
        }

        .detail-label {
            font-weight: 700;
            color: #6b7280;
            font-size: 0.875rem;
            margin-bottom: 0.25rem;
            text-transform: uppercase;
        }

        .detail-value {
            font-size: 1.1rem;
            color: #1f2937;
            font-weight: 600;
        }

        .status-badge {
            padding: 0.5rem 1rem;
            border-radius: 1rem;
            font-size: 0.9rem;
            font-weight: 600;
            display: inline-block;
        }
        .status-pending {
            background: #fef3c7;
            color: #92400e;
        }
        .status-confirmed {
            background: #d1fae5;
            color: #065f46;
        }
        .status-active {
            background: #dbeafe;
            color: #1e40af;
        }
        .status-completed {
            background: #e0e7ff;
            color: #3730a3;
        }
        .status-cancelled {
            background: #fee2e2;
            color: #991b1b;
        }

        /* Buttons */
        .btn {
            padding: 0.6rem 1.2rem;
            border-radius: 0.5rem;
            font-weight: 600;
            text-decoration: none;
            transition: 0.3s;
            display: inline-block;
            margin-right: 0.5rem;
        }
        .btn-back {
            background: #0891b2;
            color: #fff;
        }
        .btn-back:hover {
            background: #0e7490;
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
            .details-grid {
                grid-template-columns: 1fr;
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
            <li><a href="${rentalListUrl}" class="sidebar-link active">Manage Rentals</a></li>
            <li><a href="${financeListUrl}" class="sidebar-link">Manage Finances</a></li>
            <li><a href="${customerListUrl}" class="sidebar-link">Manage Customer Tickets</a></li>
        </ul>
    </nav>
</aside>
<!-- Main Content -->
<div class="main-content">
    <!-- Header -->
    <header>
        <h2>Rental Details</h2>
        <div>
            <span style="margin-right:1rem; color:#374151;">
                Welcome, <c:out value="${sessionScope.user.username != null ? sessionScope.user.username : 'Admin'}"/>
            </span>
            <a href="<spring:url value='/logout'/>" class="logout-btn">Logout</a>
        </div>
    </header>

    <!-- Main Area -->
    <main>
        <h1 style="color: #f97316;">Rental Details - ${rental.rentalId}</h1>

        <div class="details-card">
            <div class="details-grid">
                <div class="detail-item">
                    <div class="detail-label">Rental ID</div>
                    <div class="detail-value">${rental.rentalId}</div>
                </div>

                <div class="detail-item">
                    <div class="detail-label">Status</div>
                    <div class="detail-value">
                        <c:choose>
                            <c:when test="${rental.bookingStatus == 'Pending'}">
                                <span class="status-badge status-pending">Pending</span>
                            </c:when>
                            <c:when test="${rental.bookingStatus == 'Confirmed'}">
                                <span class="status-badge status-confirmed">Confirmed</span>
                            </c:when>
                            <c:when test="${rental.bookingStatus == 'Active'}">
                                <span class="status-badge status-active">Active</span>
                            </c:when>
                            <c:when test="${rental.bookingStatus == 'Completed'}">
                                <span class="status-badge status-completed">Completed</span>
                            </c:when>
                            <c:otherwise>
                                <span class="status-badge status-cancelled">Cancelled</span>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

                <div class="detail-item">
                    <div class="detail-label">Customer Name</div>
                    <div class="detail-value">
                        <c:out value="${rental.customer.firstName} ${rental.customer.lastName}"/>
                    </div>
                </div>

                <div class="detail-item">
                    <div class="detail-label">Customer ID</div>
                    <div class="detail-value">${rental.customer.userId}</div>
                </div>

                <div class="detail-item">
                    <div class="detail-label">Contact Info</div>
                    <div class="detail-value">${rental.customer.contactInfo}</div>
                </div>

                <div class="detail-item">
                    <div class="detail-label">Vehicle</div>
                    <div class="detail-value">
                        <c:out value="${rental.vehicle.brand} ${rental.vehicle.model}"/>
                    </div>
                </div>

                <div class="detail-item">
                    <div class="detail-label">Vehicle ID</div>
                    <div class="detail-value">${rental.vehicle.vehicleId}</div>
                </div>

                <div class="detail-item">
                    <div class="detail-label">Driver</div>
                    <div class="detail-value">
                        <c:choose>
                            <c:when test="${rental.driver != null}">
                                <c:out value="${rental.driver.firstName} ${rental.driver.lastName}"/> (ID: ${rental.driver.driverId})
                            </c:when>
                            <c:otherwise>
                                Self-Drive
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

                <div class="detail-item">
                    <div class="detail-label">Start Date</div>
                    <div class="detail-value">${rental.formattedStartDate}</div>
                </div>

                <div class="detail-item">
                    <div class="detail-label">End Date</div>
                    <div class="detail-value">${rental.formattedEndDate}</div>
                </div>

                <div class="detail-item">
                    <div class="detail-label">Number of Days</div>
                    <div class="detail-value">${rental.numberOfDays} days</div>
                </div>

                <div class="detail-item">
                    <div class="detail-label">Total Cost</div>
                    <div class="detail-value" style="color: #059669; font-size: 1.3rem;">Rs. ${rental.totalCost}</div>
                </div>
            </div>
        </div>

        <a href="<spring:url value='/rental/list'/>" class="back-link">← Back to Rental List</a>
    </main>
</div>
</body>
</html>
