<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Invoice - ${payment.bookingId}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        @page {
            size: A4;
            margin: 20mm;
        }
        @media print {
            .no-print { display: none; }
        }
        .gradient-header {
            background: linear-gradient(90deg, #1e3a8a, #3b82f6);
        }

        /* Watermark CSS */
        .watermark {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            opacity: 0.1; /* Semi-transparent */
            z-index: 0;
            text-align: center;
            pointer-events: none;
        }
        .watermark img {
            width: 150px;
            height: auto;
        }
        .watermark-text {
            font-size: 48px;
            color: #1e3a8a;
            font-weight: bold;
            margin-top: -10px;
        }

        /* Ensure content is above watermark */
        .invoice-content {
            position: relative;
            z-index: 1;
        }
    </style>
</head>
<body class="bg-gray-100 font-sans p-6">

<!-- Watermark -->
<div class="watermark" style="position:absolute; top:50%; left:50%; transform:translate(-50%, -50%);
     opacity:0.08; text-align:center; pointer-events:none;">
    <div style="font-size:60px; color:#1e3a8a; font-weight:bold;">Drive LK</div>
</div>

<!-- Invoice Content -->
<div class="relative max-w-full mx-auto bg-white p-8 rounded-lg shadow-lg z-10">
    <!-- your invoice content here -->
</div>


<!-- Header -->
<div class="flex justify-between items-center mb-6 gradient-header text-white p-4 rounded">
    <div>
        <h1 class="text-3xl font-bold">DriveLK</h1>
        <p class="text-sm">Vehicle Management System</p>
        <p class="text-sm">support@drivelk.com | +94 11 234 5678</p>
    </div>
    <div class="text-right">
        <h1 class="text-2xl font-semibold">Invoice</h1>
        <p class="text-sm">Invoice no : ${payment.paymentId}</p>
        <p class="text-sm">Date: ${payment.verifiedAt}</p>
    </div>
</div>

<!-- Finance Officer Info -->
<div class="mb-6 bg-blue-50 p-4 rounded shadow">
    <h3 class="font-semibold text-gray-700">Finance Officer:</h3>
    <p>Dileepa Anushan</p>
    <p>Email: dileepa@drivelk.com</p>
</div>

<!-- Customer & Booking Info -->
<div class="mb-6 grid grid-cols-1 md:grid-cols-2 gap-4">
    <div>
        <h3 class="font-semibold text-gray-700 mb-2">Bill To:</h3>
        <p>${user.username}</p>
        <p>User ID: ${user.userId}</p>
    </div>
    <div>
        <h3 class="font-semibold text-gray-700 mb-2">Booking Info:</h3>
        <p>Booking ID: ${payment.bookingId}</p>
        <p>Payment Status: <span class="font-semibold">${payment.paymentStatus}</span></p>
        <p>Uploaded At: ${payment.uploadedAt}</p>
        <p>Verified At: <c:choose>
            <c:when test="${not empty payment.verifiedAt}">${payment.verifiedAt}</c:when>
            <c:otherwise>-</c:otherwise>
        </c:choose></p>
    </div>
</div>

<!-- Payment Table -->
<div class="overflow-x-auto">
    <table class="w-full text-left border-collapse">
        <thead>
        <tr class="bg-blue-100 text-blue-800">
            <th class="p-3 border-b border-gray-300">Description</th>
            <th class="p-3 border-b border-gray-300 text-right">Amount (LKR)</th>
        </tr>
        </thead>
        <tbody>
        <tr class="hover:bg-blue-50">
            <td class="p-3 border-b border-gray-300">Payment for Booking ID: ${payment.bookingId}</td>
            <td class="p-3 border-b border-gray-300 text-right font-semibold">${payment.amount}</td>
        </tr>
        </tbody>
        <tfoot>
        <tr class="bg-blue-50 font-semibold">
            <td class="p-3 text-right">Total</td>
            <td class="p-3 text-right">${payment.amount}</td>
        </tr>
        </tfoot>
    </table>
</div>

<!-- Footer Notes -->
<div class="mt-6 text-gray-700">
    <p>Thank you for choosing DriveLK!</p>
    <p class="mt-2">This is a computer-generated invoice and does not require a signature.</p>
</div>

<!-- Print Button -->
<div class="mt-6 no-print">
    <a href="javascript:window.print()" class="bg-blue-600 text-white px-6 py-2 rounded-md hover:bg-blue-700">Print Invoice</a>
</div>
</div>

</body>
</html>
