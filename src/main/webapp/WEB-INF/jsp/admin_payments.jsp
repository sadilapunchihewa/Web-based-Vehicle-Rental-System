<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<spring:url value="/admin/list" var="adminListUrl"/>
<spring:url value="/driver/list" var="driverListUrl"/>
<spring:url value="/vehicle/list" var="vehicleListUrl"/>
<spring:url value="/rental/list" var="rentalListUrl"/>
<spring:url value="/payment/admin/payments" var="financeListUrl"/>
<spring:url value="/support/admin/tickets" var="customerListUrl"/>
<html>
<head>
    <title>Manage Payments - DriveLK</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        * { box-sizing: border-box; }
        body { margin: 0; font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif; background-color: #f9fafb; display: flex; min-height: 100vh; color: #374151; }

        /* Sidebar */
        .sidebar { width: 256px; background-color: #ffffff; box-shadow: 0 4px 10px rgba(0,0,0,0.1); position: fixed; height: 100%; overflow-y: auto; z-index: 10; }
        .sidebar .logo { display: flex; align-items: center; padding: 24px; font-weight: bold; }
        .sidebar nav ul { list-style: none; padding: 0; margin: 0; }
        .sidebar nav ul li { margin: 0; }
        .sidebar-link { display: flex; align-items: center; padding: 12px 24px; color: #4b5563; font-weight: 600; border-radius: 8px; transition: all 0.3s ease; text-decoration: none; }
        .sidebar-link:hover, .sidebar-link.active { background-color: #e0ecff; color: #0891b2; }

        /* Main Content */
        .main-content { margin-left: 256px; flex: 1; display: flex; flex-direction: column; }
        header { background: #fff; padding: 1rem 2rem; display: flex; justify-content: space-between; align-items: center; box-shadow: 0 1px 4px rgba(0,0,0,0.1); }
        header h2 { color: #0891b2; font-size: 1.5rem; margin: 0; }
        header .logout-btn { background: #f97316; color: #fff; padding: 0.5rem 1rem; border-radius: 0.5rem; text-decoration: none; font-weight: 600; transition: 0.3s; }
        header .logout-btn:hover { background: #ea580c; }

        .action-btn { transition: all 0.3s ease; }
        .action-btn:hover { transform: scale(1.05); }
        .table-row:hover { background-color: #f5f5f5; }

        @media(max-width: 768px) {
            .sidebar { position: relative; width: 100%; height: auto; box-shadow: none; }
            .main-content { margin-left: 0; }
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
            <li><a href="${adminListUrl}" class="sidebar-link">Manage Admins</a></li>
            <li><a href="${driverListUrl}" class="sidebar-link">Manage Drivers</a></li>
            <li><a href="${vehicleListUrl}" class="sidebar-link">Manage Vehicles</a></li>
            <li><a href="${rentalListUrl}" class="sidebar-link">Manage Rentals</a></li>
            <li><a href="${financeListUrl}" class="sidebar-link active">Manage Finances</a></li>
            <li><a href="${customerListUrl}" class="sidebar-link">Manage Customer Tickets</a></li>
        </ul>
    </nav>
</aside>

<!-- Main Content -->
<div class="main-content">
<header>
    <h2>Manage Payments</h2>
    <div>
        <span style="margin-right:1rem; color:#374151;">
            Welcome, <c:out value="${sessionScope.user.username != null ? sessionScope.user.username : 'Admin'}"/>
        </span>
        <a href="<spring:url value='/logout'/>" class="logout-btn">Logout</a>
    </div>
</header>




<main class="container mx-auto px-4 py-8">
    <c:set var="verifiedCount" value="0" />
    <c:set var="rejectedCount" value="0" />
    <c:forEach var="p" items="${payments}">
        <c:choose>
            <c:when test="${p.paymentStatus == 'Verified'}">
                <c:set var="verifiedCount" value="${verifiedCount + 1}" />
            </c:when>
            <c:when test="${p.paymentStatus == 'Rejected'}">
                <c:set var="rejectedCount" value="${rejectedCount + 1}" />
            </c:when>
            <c:when test="${p.paymentStatus == 'Deleted'}">
                <c:set var="deletedCount" value="${deletedCount + 1}" />
            </c:when>
        </c:choose>
    </c:forEach>
    <c:set var="totalCount" value="${payments.size()}" />

    <!-- Stats Cards -->
    <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-6">
        <div class="bg-white p-4 rounded-lg shadow-md text-center">
            <h3 class="text-lg font-semibold text-gray-700">Verified Payments</h3>
            <p class="text-2xl font-bold text-green-600">${verifiedCount}</p>
        </div>
        <div class="bg-white p-4 rounded-lg shadow-md text-center">
            <h3 class="text-lg font-semibold text-gray-700">Rejected Payments</h3>
            <p class="text-2xl font-bold text-red-600">${rejectedCount}</p>
        </div>
        <div class="bg-white p-4 rounded-lg shadow-md text-center">
            <h3 class="text-lg font-semibold text-gray-700">Total Payments</h3>
            <p class="text-2xl font-bold text-blue-600">${totalCount}</p>
        </div>
    </div>

    <!-- Search Form -->
    <div class="mb-6">
        <form action="/payment/admin/payments" method="get" class="flex">
            <input type="text" name="search" value="${currentSearch}" placeholder="Search by Booking ID or User ID" class="w-full p-2 border rounded-l-md focus:outline-none focus:ring-2 focus:ring-blue-500">
            <button type="submit" class="bg-blue-600 text-white p-2 rounded-r-md hover:bg-blue-700">Search</button>
        </form>
    </div>

    <div class="bg-white rounded-lg shadow-md p-6">
        <h2 class="text-2xl font-bold text-gray-800 mb-4">Manage Payments</h2>

        <!-- Sorting Bar -->
        <div class="mb-4 flex flex-wrap items-center gap-4">
            <span class="font-semibold text-gray-700">Sort by:</span>
            <a href="/payment/admin/payments?sortBy=paymentId&sortDir=asc&search=${currentSearch}"
               class="px-3 py-1 bg-blue-500 text-white rounded hover:bg-blue-600">Payment ID ↑</a>
            <a href="/payment/admin/payments?sortBy=paymentId&sortDir=desc&search=${currentSearch}"
               class="px-3 py-1 bg-blue-500 text-white rounded hover:bg-blue-600">Payment ID ↓</a>

            <a href="/payment/admin/payments?sortBy=userId&sortDir=asc&search=${currentSearch}"
               class="px-3 py-1 bg-green-500 text-white rounded hover:bg-green-600">User ID ↑</a>
            <a href="/payment/admin/payments?sortBy=userId&sortDir=desc&search=${currentSearch}"
               class="px-3 py-1 bg-green-500 text-white rounded hover:bg-green-600">User ID ↓</a>

            <a href="/payment/admin/payments?sortBy=amount&sortDir=asc&search=${currentSearch}"
               class="px-3 py-1 bg-yellow-500 text-white rounded hover:bg-yellow-600">Amount ↑</a>
            <a href="/payment/admin/payments?sortBy=amount&sortDir=desc&search=${currentSearch}"
               class="px-3 py-1 bg-yellow-500 text-white rounded hover:bg-yellow-600">Amount ↓</a>

            <a href="/payment/admin/payments?sortBy=uploadedAt&sortDir=asc&search=${currentSearch}"
               class="px-3 py-1 bg-purple-500 text-white rounded hover:bg-purple-600">Date ↑</a>
            <a href="/payment/admin/payments?sortBy=uploadedAt&sortDir=desc&search=${currentSearch}"
               class="px-3 py-1 bg-purple-500 text-white rounded hover:bg-purple-600">Date ↓</a>
        </div>

        <table class="w-full border-collapse">
            <thead>
            <tr class="bg-gradient-to-r from-purple-600 to-indigo-600 text-white">
                <th class="p-3 text-left">Payment ID</th>
                <th class="p-3 text-left">Booking ID</th>
                <th class="p-3 text-left">User ID</th>
                <th class="p-3 text-left">Amount</th>
                <th class="p-3 text-left">Payment Slip</th>
                <th class="p-3 text-left">Status</th>
                <th class="p-3 text-left">Uploaded At</th>
                <th class="p-3 text-left">Verified At</th>
                <th class="p-3 text-left">Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="payment" items="${payments}">
                <tr class="table-row">
                    <td class="p-3">${payment.paymentId}</td>
                    <td class="p-3">${payment.bookingId}</td>
                    <td class="p-3">${payment.userId}</td>
                    <td class="p-3">${payment.amount}</td>
                    <td class="p-3"><a href="/Uploads/${payment.paymentSlipPath}" target="_blank" class="text-blue-600 hover:underline">${payment.paymentSlipPath}</a></td>
                    <td class="p-3">${payment.paymentStatus}</td>
                    <td class="p-3">${payment.uploadedAt}</td>
                    <td class="p-3">${payment.verifiedAt}</td>
                    <td class="p-3">
                        <c:if test="${payment.paymentStatus == 'Pending'}">
                            <form action="/payment/admin/verify" method="post" class="inline">
                                <input type="hidden" name="paymentId" value="${payment.paymentId}">
                                <button type="submit" class="action-btn bg-green-500 text-white px-4 py-2 rounded-md hover:bg-green-600">Verify</button>
                            </form>
                            <form action="/payment/admin/reject" method="post" class="inline">
                                <input type="hidden" name="paymentId" value="${payment.paymentId}">
                                <button type="submit" class="action-btn bg-red-500 text-white px-4 py-2 rounded-md hover:bg-red-600">Reject</button>
                            </form>
                        </c:if>
                        <c:choose>
                            <c:when test="${payment.paymentStatus == 'Deleted'}">
                                <form action="/payment/admin/restore" method="post" class="inline" onsubmit="return confirm('Are you sure you want to restore this payment?');">
                                    <input type="hidden" name="paymentId" value="${payment.paymentId}">
                                    <button type="submit" class="action-btn bg-yellow-500 text-white px-4 py-2 rounded-md hover:bg-yellow-600">Restore</button>
                                </form>
                            </c:when>
                            <c:otherwise>
                                <form action="/payment/admin/delete" method="post" class="inline" onsubmit="return confirm('Are you sure you want to delete this payment?');">
                                    <input type="hidden" name="paymentId" value="${payment.paymentId}">
                                    <button type="submit" class="action-btn bg-gray-500 text-white px-4 py-2 rounded-md hover:bg-gray-600">Delete</button>
                                </form>
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <div class="mt-6 text-right">
            <p class="text-lg font-semibold text-gray-800">Total Pending Payments: LKR <span class="text-red-600">${totalOutstanding}</span></p>
            </p>


            <p class="text-lg font-semibold text-gray-800">
                Total Payments: LKR <span class="text-green-600">${totalPayments}</span>
            </p>


        </div>
    </div>
</main>
</div>
</body>
</html>
