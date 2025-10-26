<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Manage Payments</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        .gradient-bg { background: linear-gradient(135deg, #0891b2 0%, #0e7490 100%); }
        .action-btn { transition: all 0.3s ease; }
        .action-btn:hover { transform: scale(1.05); }
        .table-row:hover { background-color: #f5f5f5; }
    </style>
</head>
<body class="bg-gray-100 font-sans">
<header class="gradient-bg text-white py-4 fixed w-full top-0 z-10 shadow-lg">
    <div class="container mx-auto flex justify-between items-center px-4">
        <a href="/home" class="text-2xl font-bold">DriveLK</a>
        <nav>
            <a href="/home" class="text-white hover:underline mx-4">Dashboard</a>
            <a href="/logout" class="text-white hover:underline">Logout</a>
        </nav>
    </div>
</header>




<div class="container mx-auto mt-20 px-4">
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
        <a href="/logout" class="block mt-4 text-blue-600 hover:underline font-bold">Logout</a>
    </div>
</div>
</body>
</html>
