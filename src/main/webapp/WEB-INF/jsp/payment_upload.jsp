<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Upload Payment Slip</title>
    <meta name="viewport" content="width=device-thwidth, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        .gradient-bg { background: linear-gradient(135deg, #0891b2 0%, #0e7490 100%); }
        .success-message { background-color: #d4edda; color: #155724; padding: 10px; border-radius: 5px; margin-bottom: 15px; }
        .error-message { background-color: #f8d7da; color: #721c24; padding: 10px; border-radius: 5px; margin-bottom: 15px; }
        .pulse-animation { animation: pulse 2s infinite; }
        @keyframes pulse { 0% { transform: scale(1); opacity: 1; } 50% { transform: scale(1.05); opacity: 0.7; } 100% { transform: scale(1); opacity: 1; } }
        .status-card { background: linear-gradient(145deg, #ffffff 0%, #f8fafc 100%); border: 1px solid #e2e8f0; }
        .pending-icon { width: 80px; height: 80px; background: linear-gradient(135deg, #fbbf24 0%, #f59e0b 100%); border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: 0 auto 20px; animation: pulse 2s infinite; }
    </style>
    <script>
        function checkPaymentStatus() {
            window.location.href = '/payment/status/${bookingId}';
        }
        // Auto-refresh if payment is pending
        <c:if test="${not empty bookingId}">
        setTimeout(function() { location.reload(); }, 30000);
        </c:if>
    </script>
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

    <!-- UPLOAD FORM -->
    <c:if test="${empty bookingId}">
        <div class="bg-white rounded-lg shadow-md p-6">
            <h2 class="text-2xl font-bold text-gray-800 mb-4">Upload Payment Slip</h2>

            <c:if test="${not empty success}">
                <div class="success-message">${success}</div>
            </c:if>

            <c:if test="${not empty error}">
                <div class="error-message">${error}</div>
            </c:if>

            <form action="/payment/upload" method="post" enctype="multipart/form-data" class="space-y-4">
                <div>
                    <label for="bookingId" class="block text-gray-700">Booking ID</label>
                    <input type="text" id="bookingId" name="bookingId" required
                           value="${prefilledBookingId != null ? prefilledBookingId : ''}"
                           <c:if test="${prefilledBookingId != null}">readonly</c:if>
                           class="w-full p-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 <c:if test='${prefilledBookingId != null}'>bg-gray-100</c:if>">
                </div>


                <div>
                    <label for="amount" class="block text-gray-700">Amount (LKR)</label>
                    <input type="number" id="amount" name="amount" step="0.01" required min="1"
                           class="w-full p-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                </div>
                    <label for="paymentSlip" class="block text-gray-700">Payment Slip</label>
                    <input type="file" id="paymentSlip" name="paymentSlip" required class="w-full p-2 border rounded-md">
                </div>
                <button type="submit" class="bg-blue-600 text-white px-4 py-2 rounded-md hover:bg-blue-700">
                    Upload Payment
                </button>
            </form>
        </div>
    </c:if>

    <!-- PAYMENT PENDING DISPLAY -->
    <c:if test="${not empty bookingId}">
        <div class="max-w-2xl mx-auto mt-6">
            <div class="status-card rounded-xl shadow-xl p-8 text-center mb-6">
                <div class="pending-icon">
                    <svg class="w-10 h-10 text-white" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm1-12a1 1 0 10-2 0v4a1 1 0 00.293.707l2.828 2.829a1 1 0 101.415-1.415L11 9.586V6z" clip-rule="evenodd"/>
                    </svg>
                </div>
                <h1 class="text-3xl font-bold text-gray-800 mb-2">Payment Pending</h1>
                <p class="text-lg text-gray-600 mb-6">Your payment slip has been uploaded successfully</p>

                <div class="bg-gray-50 rounded-lg p-4 mb-6">
                    <h3 class="text-lg font-semibold text-gray-800 mb-3">Payment Details</h3>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4 text-sm">
                        <div class="text-left">
                            <span class="font-medium text-gray-600">Booking ID:</span>
                            <span class="ml-2 text-gray-800">${bookingId}</span>
                        </div>
                        <div class="text-left">
                            <span class="font-medium text-gray-600">Amount:</span>
                            <span class="ml-2 text-gray-800">LKR ${amount}</span>
                        </div>
                        <div class="text-left">
                            <span class="font-medium text-gray-600">Upload Time:</span>
                            <span class="ml-2 text-gray-800">${payment.uploadedAt}</span>
                        </div>
                        <div class="text-left">
                            <span class="font-medium text-gray-600">Status:</span>
                            <span class="ml-2 px-2 py-1 bg-yellow-100 text-yellow-800 rounded-full text-xs font-medium">Pending Review</span>
                        </div>
                    </div>
                </div>

                <div class="flex flex-col sm:flex-row gap-4 justify-center">
                    <a href="/payment/history" class="bg-blue-600 text-white px-6 py-3 rounded-lg hover:bg-blue-700 transition-colors font-medium">
                        Check Status
                    </a>
                    <a href="/home" class="bg-gray-600 text-white px-6 py-3 rounded-lg hover:bg-gray-700 transition-colors font-medium inline-block">
                        Back to Dashboard
                    </a>
                </div>
            </div>
        </div>
    </c:if>


    <br><br>
    <!-- Information Card -->
    <div class="bg-white rounded-lg shadow-md p-6">
        <h3 class="text-lg font-semibold text-gray-800 mb-4">What happens next?</h3>
        <div class="space-y-4">
            <div class="flex items-start">
                <div class="flex-shrink-0 w-8 h-8 bg-blue-100 rounded-full flex items-center justify-center mr-3">
                    <span class="text-blue-600 font-bold text-sm">1</span>
                </div>
                <div>
                    <h4 class="font-medium text-gray-800">Review Process</h4>
                    <p class="text-gray-600 text-sm">Our team will verify your payment slip and booking details.</p>
                </div>
            </div>
            <div class="flex items-start">
                <div class="flex-shrink-0 w-8 h-8 bg-blue-100 rounded-full flex items-center justify-center mr-3">
                    <span class="text-blue-600 font-bold text-sm">2</span>
                </div>
                <div>
                    <h4 class="font-medium text-gray-800">Confirmation</h4>
                    <p class="text-gray-600 text-sm">You'll receive a confirmation once the payment is approved.</p>
                </div>
            </div>
            <div class="flex items-start">
                <div class="flex-shrink-0 w-8 h-8 bg-blue-100 rounded-full flex items-center justify-center mr-3">
                    <span class="text-blue-600 font-bold text-sm">3</span>
                </div>
                <div>
                    <h4 class="font-medium text-gray-800">Booking Activation</h4>
                    <p class="text-gray-600 text-sm">Your booking will be activated and you'll receive further instructions.</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Contact Information -->
    <div class="text-center mt-6 text-gray-600">
        <p>Need help? Contact us at <a href="mailto:support@drivelk.com" class="text-blue-600 hover:underline">support@drivelk.com</a></p>
        <p class="text-sm mt-1">or call <a href="tel:+94112345678" class="text-blue-600 hover:underline">+94 11 234 5678</a></p>
    </div>
</div>

<script>
    // Add some dynamic behavior
    document.addEventListener('DOMContentLoaded', function() {
        // Show a subtle notification that page will auto-refresh
        const notification = document.createElement('div');
        notification.className = 'fixed top-20 right-4 bg-blue-100 text-blue-800 px-4 py-2 rounded-lg shadow-md text-sm z-50';
        notification.innerHTML = 'Page will auto-refresh in 30 seconds';
        document.body.appendChild(notification);

        // Hide notification after 5 seconds
        setTimeout(() => {
            notification.style.opacity = '0';
            setTimeout(() => notification.remove(), 500);}, 5000);
    });
</script>
</body>
</html>