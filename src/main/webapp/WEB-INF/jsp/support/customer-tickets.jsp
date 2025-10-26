<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Support Tickets - DriveLK</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body class="bg-gray-50">
<!-- Header -->
<header class="bg-[#0891b2] text-white shadow-2xl">
    <div class="container mx-auto px-4 py-4">
        <div class="flex justify-between items-center">
            <a href="/home" class="text-2xl font-bold text-white">DriveLK</a>
            <nav class="flex space-x-6">
                <a href="/home" class="hover:text-blue-200 transition-all duration-300">Home</a>
                <a href="/rental/vehicles" class="hover:text-blue-200 transition-all duration-300">Rent Vehicle</a>
                <a href="/rental/my-bookings" class="hover:text-blue-200 transition-all duration-300">My Bookings</a>
                <a href="/payment/history" class="hover:text-blue-200 transition-all duration-300">
                    <i class="fas fa-receipt mr-1"></i>Payment History
                </a>
                <a href="/support/tickets" class="hover:text-blue-200 transition-all duration-300">
                    <i class="fas fa-headset mr-1"></i>Support
                </a>
                <a href="/driver/list" class="hover:text-blue-200 transition-all duration-300">
                    <i class="fas fa-users mr-1"></i>Drivers
                </a>
                <a href="/logout" class="hover:text-blue-200 transition-all duration-300">Logout</a>
            </nav>
        </div>
    </div>
</header>

<!-- Main Content -->
<main class="container mx-auto px-4 py-8">
    <h1 class="text-3xl font-bold text-center text-gray-800 mb-8">My Support Tickets</h1>

    <!-- Success/Error Messages -->
    <c:if test="${not empty success}">
        <div class="mb-4 p-4 bg-green-50 border-2 border-green-200 text-green-700 rounded-xl shadow-lg">
            <i class="fas fa-check-circle mr-2"></i>${success}
        </div>
    </c:if>
    <c:if test="${not empty error}">
        <div class="mb-4 p-4 bg-red-50 border-2 border-red-200 text-red-700 rounded-xl shadow-lg">
            <i class="fas fa-exclamation-circle mr-2"></i>${error}
        </div>
    </c:if>

    <!-- Tickets Table -->
    <div class="bg-white rounded-2xl shadow-2xl overflow-hidden mb-6">
        <table class="w-full">
            <thead class="bg-gradient-to-r from-slate-50 to-gray-100">
                <tr>
                    <th class="px-6 py-3 text-left text-xs font-semibold text-gray-700 uppercase">Ticket ID</th>
                    <th class="px-6 py-3 text-left text-xs font-semibold text-gray-700 uppercase">Description</th>
                    <th class="px-6 py-3 text-left text-xs font-semibold text-gray-700 uppercase">Status</th>
                    <th class="px-6 py-3 text-left text-xs font-semibold text-gray-700 uppercase">Response</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-gray-200">
                <c:forEach var="ticket" items="${tickets}">
                    <tr class="hover:bg-slate-50 transition-colors">
                        <td class="px-6 py-4 text-sm font-medium text-gray-900">${ticket.ticketId}</td>
                        <td class="px-6 py-4 text-sm text-gray-900">${ticket.description}</td>
                        <td class="px-6 py-4">
                            <c:choose>
                                <c:when test="${ticket.status == 'Resolved'}">
                                    <span class="px-2 py-1 text-xs font-semibold rounded-full bg-green-100 text-green-800">
                                        ${ticket.status}
                                    </span>
                                </c:when>
                                <c:when test="${ticket.status == 'In Progress'}">
                                    <span class="px-2 py-1 text-xs font-semibold rounded-full bg-blue-100 text-blue-800">
                                        ${ticket.status}
                                    </span>
                                </c:when>
                                <c:otherwise>
                                    <span class="px-2 py-1 text-xs font-semibold rounded-full bg-yellow-100 text-yellow-800">
                                        ${ticket.status}
                                    </span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td class="px-6 py-4 text-sm text-gray-900">
                            <c:choose>
                                <c:when test="${not empty ticket.response}">${ticket.response}</c:when>
                                <c:otherwise>
                                    <span class="text-gray-400 italic">No response yet</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- Empty State -->
        <c:if test="${empty tickets}">
            <div class="text-center py-12">
                <i class="fas fa-ticket-alt text-6xl text-gray-300 mb-4"></i>
                <h3 class="text-xl font-semibold text-gray-600 mb-2">No tickets yet</h3>
                <p class="text-gray-500 mb-4">Create a support ticket if you need assistance</p>
            </div>
        </c:if>
    </div>

    <!-- Action Buttons -->
    <div class="flex gap-4">
        <a href="/support/ticket/new" class="inline-flex items-center px-6 py-3 bg-gradient-to-r from-[#0891b2] to-blue-700 text-white rounded-lg hover:from-blue-600 hover:to-blue-800 transition-all duration-300 shadow-lg">
            <i class="fas fa-plus mr-2"></i> New Ticket
        </a>
        <a href="/home" class="inline-flex items-center px-6 py-3 bg-gray-300 text-gray-700 rounded-lg hover:bg-gray-400 transition-all duration-300">
            <i class="fas fa-arrow-left mr-2"></i> Back to Home
        </a>
    </div>
</main>
</body>
</html>
