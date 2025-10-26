<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Support Ticket - DriveLK</title>
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
                <a href="/payment/history" class="hover:text-blue-200 transition-all duration-300">Payment History</a>
                <a href="/support/tickets" class="hover:text-blue-200 transition-all duration-300">Support</a>
                <a href="/logout" class="hover:text-blue-200 transition-all duration-300">Logout</a>
            </nav>
        </div>
    </div>
</header>

<!-- Main Content -->
<main class="container mx-auto px-4 py-8">
    <div class="max-w-2xl mx-auto">
        <h1 class="text-3xl font-bold text-center text-gray-800 mb-8">Create Support Ticket</h1>

        <!-- Success/Error Messages -->
        <c:if test="${not empty error}">
            <div class="mb-4 p-4 bg-red-50 border-2 border-red-200 text-red-700 rounded-xl shadow-lg">
                <i class="fas fa-exclamation-circle mr-2"></i>${error}
            </div>
        </c:if>

        <!-- Ticket Form -->
        <div class="bg-white rounded-2xl shadow-2xl p-8">
            <form action="/support/ticket/new" method="post">
                <div class="mb-6">
                    <label for="description" class="block text-sm font-semibold text-gray-700 mb-2">
                        <i class="fas fa-comment-alt mr-2"></i>Describe your issue
                    </label>
                    <textarea id="description" name="description" rows="8" required
                              class="w-full px-4 py-3 border-2 border-gray-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#0891b2] focus:border-transparent transition-all duration-300"
                              placeholder="Please describe your issue in detail..."></textarea>
                </div>

                <div class="flex gap-4">
                    <button type="submit"
                            class="inline-flex items-center px-6 py-3 bg-gradient-to-r from-[#0891b2] to-blue-700 text-white rounded-lg hover:from-blue-600 hover:to-blue-800 transition-all duration-300 shadow-lg">
                        <i class="fas fa-paper-plane mr-2"></i> Submit Ticket
                    </button>
                    <a href="/support/tickets"
                       class="inline-flex items-center px-6 py-3 bg-gray-300 text-gray-700 rounded-lg hover:bg-gray-400 transition-all duration-300">
                        <i class="fas fa-arrow-left mr-2"></i> Cancel
                    </a>
                </div>
            </form>
        </div>
    </div>
</main>
</body>
</html>
