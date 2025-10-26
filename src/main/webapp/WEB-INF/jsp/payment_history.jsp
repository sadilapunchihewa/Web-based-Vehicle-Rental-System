<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Payment History - DriveLK</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        .gradient-bg { background: linear-gradient(135deg, #0891b2 0%, #0e7490 100%); }
        .action-btn { transition: all 0.3s ease; }
        .action-btn:hover { transform: scale(1.05); }
    </style>
</head>
<body class="bg-gray-100 font-sans">

<header class="gradient-bg text-white py-4 fixed w-full top-0 z-10 shadow-lg">
    <div class="container mx-auto flex justify-between items-center px-4">
        <a href="/home" class="text-2xl font-bold">DriveLK</a>
        <nav class="flex space-x-6">
            <a href="/home" class="text-white hover:underline">Home</a>
            <a href="/rental/vehicles" class="text-white hover:underline">Rent Vehicle</a>
            <a href="/rental/my-bookings" class="text-white hover:underline">My Bookings</a>
            <a href="/payment/history" class="text-white hover:underline">Payment History</a>
            <a href="/support/tickets" class="text-white hover:underline">Support</a>
            <a href="/driver/list" class="text-white hover:underline">Drivers</a>
            <a href="/logout" class="text-white hover:underline">Logout</a>
        </nav>
    </div>
</header>

<div class="container mx-auto mt-20 px-4">
    <h1 class="text-3xl font-bold mb-4">Your Payments</h1>

    <c:choose>
        <c:when test="${not empty payments}">
            <c:forEach var="payment" items="${payments}">
                <div class="bg-white rounded-xl shadow-xl p-6 mb-6">
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div>
                            <span class="font-medium">Booking ID:</span> ${payment.bookingId}
                        </div>
                        <div>
                            <span class="font-medium">Amount:</span> LKR ${payment.amount}
                        </div>
                        <div>
                            <span class="font-medium">Status:</span>
                            <span class="px-2 py-1 rounded-lg
                                <c:choose>
                                    <c:when test="${payment.paymentStatus eq 'Pending'}">bg-yellow-200 text-yellow-800</c:when>
                                    <c:when test="${payment.paymentStatus eq 'Verified'}">bg-green-200 text-green-800</c:when>
                                    <c:when test="${payment.paymentStatus eq 'Rejected'}">bg-red-200 text-red-800</c:when>
                                    <c:otherwise>bg-gray-200 text-gray-800</c:otherwise>
                                </c:choose>
                            ">${payment.paymentStatus}</span>
                        </div>
                        <div>
                            <span class="font-medium">Uploaded At:</span> ${payment.uploadedAt}
                        </div>
                        <div>
                            <span class="font-medium">Verified At:</span>
                            <c:choose>
                                <c:when test="${not empty payment.verifiedAt}">${payment.verifiedAt}</c:when>
                                <c:otherwise>-</c:otherwise>
                            </c:choose>
                        </div>
                        <div>
                            <a href="/Uploads/${payment.paymentSlipPath}" target="_blank" class="text-blue-600 hover:underline">View Slip</a>
                        </div>

                        <!-- ADDED: Invoice Button for Verified Payments -->
                        <c:if test="${payment.paymentStatus eq 'Verified'}">
                            <div>
                                <a href="/payment/invoice/${payment.bookingId}"
                                   class="bg-green-600 text-white px-4 py-2 rounded-md hover:bg-green-700">Generate Invoice</a>
                            </div>
                        </c:if>
                    </div>
                </div>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <div class="text-center mt-20 text-gray-700 text-xl">No payments found.</div>
        </c:otherwise>
    </c:choose>

    <a href="/payment/upload" class="bg-blue-600 text-white px-6 py-3 rounded-md hover:bg-blue-700">Upload New Payment</a>
</div>

<!-- Contact Information -->
<div class="text-center mt-6 text-gray-600">
    <p>Need help? Contact us at <a href="mailto:support@drivelk.com" class="text-blue-600 hover:underline">support@drivelk.com</a></p>
    <p class="text-sm mt-1">or call <a href="tel:+94112345678" class="text-blue-600 hover:underline">+94 11 234 5678</a></p>
</div>

</body>
</html>
