<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Bookings - DriveLK</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .gradient-bg {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }
        .table-hover {
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }
        .table-hover:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px -3px rgba(0, 0, 0, 0.1);
        }
        .status-glow {
            box-shadow: 0 0 0 0 rgba(34, 197, 94, 0.4);
            transition: box-shadow 0.3s ease-in-out;
        }
        .status-glow:hover {
            box-shadow: 0 0 0 3px rgba(34, 197, 94, 0.3);
        }
        .fade-in {
            animation: fadeIn 0.5s ease-in-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .btn-edit {
            background: linear-gradient(to right, #3b82f6, #1d4ed8);
            color: white;
            padding: 0.5rem 1rem;
            border-radius: 0.5rem;
            border: none;
            cursor: pointer;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            font-size: 0.875rem;
            font-weight: 500;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
        }
        .btn-edit:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
            background: linear-gradient(to right, #1d4ed8, #1e40af);
        }
        .btn-cancel {
            background: linear-gradient(to right, #f59e0b, #d97706);
            color: white;
            padding: 0.5rem 1rem;
            border-radius: 0.5rem;
            border: none;
            cursor: pointer;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            font-size: 0.875rem;
            font-weight: 500;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
        }
        .btn-cancel:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
            background: linear-gradient(to right, #d97706, #b45309);
        }
        .btn-delete {
            background: linear-gradient(to right, #ef4444, #dc2626);
            color: white;
            padding: 0.5rem 1rem;
            border-radius: 0.5rem;
            border: none;
            cursor: pointer;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            font-size: 0.875rem;
            font-weight: 500;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
        }
        .btn-delete:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
            background: linear-gradient(to right, #dc2626, #b91c1c);
        }
    </style>
</head>
<body class="bg-gradient-to-br from-slate-50 via-blue-50 to-indigo-50 min-h-screen">
<!-- Header -->
<header class="bg-[#0891b2] text-white shadow-2xl">
    <div class="container mx-auto px-4 py-4">
        <div class="flex justify-between items-center">
            <a href="/home" class="text-2xl font-bold text-white">DriveLK</a>
            <nav class="flex space-x-6">
                <a href="/home" class="hover:text-blue-200 transition-all duration-300 hover:scale-105">Home</a>
                <a href="/rental/vehicles" class="hover:text-blue-200 transition-all duration-300 hover:scale-105">Rent Vehicle</a>
                <a href="/rental/my-bookings" class="hover:text-blue-200 transition-all duration-300 hover:scale-105">My Bookings</a>
                <a href="/payment/history" class="hover:text-blue-200 transition-all duration-300 hover:scale-105">
                    <i class="fas fa-receipt mr-1"></i>Payment History
                </a>
                <a href="/support/tickets" class="hover:text-blue-200 transition-all duration-300 hover:scale-105">
                    <i class="fas fa-headset mr-1"></i>Support
                </a>
                <a href="/driver/list" class="hover:text-blue-200 transition-all duration-300 hover:scale-105">
                    <i class="fas fa-users mr-1"></i>Drivers
                </a>
                <a href="/logout" class="hover:text-blue-200 transition-all duration-300 hover:scale-105">Logout</a>
            </nav>
        </div>
    </div>
</header>

<!-- Main Content -->
<main class="container mx-auto px-4 py-8 fade-in">
    <h1 class="text-3xl font-bold text-center text-gray-800 mb-8 bg-gradient-to-r from-gray-700 via-gray-800 to-gray-900 bg-clip-text text-transparent drop-shadow-sm">My Bookings</h1>

    <!-- Success/Error Messages -->
    <c:if test="${not empty success}">
        <div class="mb-4 p-4 bg-gradient-to-r from-emerald-50 to-green-50 border-2 border-emerald-200 text-emerald-700 rounded-xl shadow-lg backdrop-blur-sm animate-pulse">
            <i class="fas fa-check-circle mr-2"></i>${success}
        </div>
    </c:if>
    <c:if test="${not empty error}">
        <div class="mb-4 p-4 bg-gradient-to-r from-rose-50 to-red-50 border-2 border-rose-200 text-rose-700 rounded-xl shadow-lg backdrop-blur-sm animate-pulse">
            <i class="fas fa-exclamation-circle mr-2"></i>${error}
        </div>
    </c:if>

    <div class="bg-white/70 backdrop-blur-md rounded-2xl shadow-2xl overflow-hidden border border-white/30">
        <div class="overflow-x-auto">
            <table class="w-full">
                <thead class="bg-gradient-to-r from-slate-50 to-gray-100">
                <tr>
                    <th class="px-6 py-3 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">
                        <i class="fas fa-hashtag mr-1 text-[#0891b2]"></i>Booking ID
                    </th>
                    <th class="px-6 py-3 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">
                        <i class="fas fa-car mr-1 text-[#0891b2]"></i>Vehicle
                    </th>
                    <th class="px-6 py-3 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">
                        <i class="fas fa-calendar-alt mr-1 text-[#0891b2]"></i>Period
                    </th>
                    <th class="px-6 py-3 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">
                        <i class="fas fa-clock mr-1 text-[#0891b2]"></i>Days
                    </th>
                    <th class="px-6 py-3 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">
                        <i class="fas fa-dollar-sign mr-1 text-[#0891b2]"></i>Total Cost
                    </th>
                    <th class="px-6 py-3 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">
                        <i class="fas fa-info-circle mr-1 text-[#0891b2]"></i>Status
                    </th>
                    <th class="px-6 py-3 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">
                        <i class="fas fa-cogs mr-1 text-[#0891b2]"></i>Actions
                    </th>
                </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200">
                <c:forEach var="booking" items="${bookings}">
                    <tr class="table-hover hover:bg-slate-50/50">
                        <td class="px-6 py-4 whitespace-nowrap">
                            <div class="text-sm font-medium text-gray-900">${booking.rentalId}</div>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <div class="text-sm font-medium text-gray-900">
                                    ${booking.vehicle.brand} ${booking.vehicle.model}
                            </div>
                            <div class="text-xs text-gray-500">${booking.vehicle.type}</div>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <div class="text-sm text-gray-900">${booking.rentalStartDate}</div>
                            <div class="text-xs text-gray-500">to ${booking.rentalEndDate}</div>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                ${booking.numberOfDays}
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <div class="text-sm font-semibold bg-gradient-to-r from-emerald-400 to-green-500 bg-clip-text text-transparent">
                                LKR <fmt:formatNumber value="${booking.totalCost}" pattern="#,##0"/>
                            </div>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <c:choose>
                                <c:when test="${booking.bookingStatus == 'Confirmed'}">
                                    <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-gradient-to-r from-emerald-100 to-green-200 text-emerald-800 status-glow">
                                            ${booking.bookingStatus}
                                    </span>
                                </c:when>
                                <c:when test="${booking.bookingStatus == 'Pending'}">
                                    <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-gradient-to-r from-amber-100 to-yellow-200 text-amber-800">
                                            ${booking.bookingStatus}
                                    </span>
                                </c:when>
                                <c:when test="${booking.bookingStatus == 'Completed'}">
                                    <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-gradient-to-r from-blue-100 to-cyan-200 text-blue-800">
                                            ${booking.bookingStatus}
                                    </span>
                                </c:when>
                                <c:otherwise>
                                    <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-gradient-to-r from-rose-100 to-red-200 text-rose-800">
                                            ${booking.bookingStatus}
                                    </span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                            <div class="flex flex-wrap gap-2">
                                <!-- Payment Button for Confirmed Bookings -->
                                <c:if test="${booking.bookingStatus == 'Confirmed' || booking.bookingStatus == 'Pending'}">
                                    <a href="/payment/upload?bookingId=${booking.rentalId}"
                                       class="inline-flex items-center px-3 py-1.5 bg-gradient-to-r from-emerald-500 to-green-600 text-white text-xs font-semibold rounded-lg hover:from-emerald-600 hover:to-green-700 transition-all duration-300 shadow hover:shadow-lg transform hover:-translate-y-0.5">
                                        <i class="fas fa-money-bill-wave mr-1"></i> Pay Now
                                    </a>
                                </c:if>

                                <!-- Edit Button for Pending Bookings -->
                                <c:if test="${booking.bookingStatus == 'Pending'}">
                                    <button onclick="openEditModal('${booking.rentalId}', ${booking.numberOfDays})" class="btn-edit">
                                        <i class="fas fa-edit"></i> Edit
                                    </button>
                                </c:if>

                                <!-- Cancel Button -->
                                <c:if test="${booking.bookingStatus != 'Cancelled' && booking.bookingStatus != 'Completed'}">
                                    <form action="/rental/cancel/${booking.rentalId}" method="post" class="inline"
                                          onsubmit="return confirm('Are you sure you want to cancel this booking?')">
                                        <button type="submit" class="btn-cancel">
                                            <i class="fas fa-ban"></i> Cancel
                                        </button>
                                    </form>
                                </c:if>

                                <!-- Delete Button -->
                                <form action="/rental/delete/${booking.rentalId}" method="post" class="inline"
                                      onsubmit="return confirm('Are you sure you want to delete this booking? This cannot be undone.')">
                                    <button type="submit" class="btn-delete">
                                        <i class="fas fa-trash"></i> Delete
                                    </button>
                                </form>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- Empty State -->
        <c:if test="${empty bookings}">
            <div class="text-center py-12 fade-in">
                <i class="fas fa-calendar-times text-6xl text-gray-300 mb-4 animate-bounce"></i>
                <h3 class="text-xl font-semibold text-gray-600 mb-2">No bookings yet</h3>
                <p class="text-gray-500 mb-4">Start by renting a vehicle from our collection</p>
                <a href="/rental/vehicles" class="inline-flex items-center px-4 py-2 bg-gradient-to-r from-[#0891b2] to-blue-700 text-white rounded-lg hover:from-blue-600 hover:to-blue-800 transition-all duration-300 shadow-lg hover:shadow-xl transform hover:-translate-y-1">
                    <i class="fas fa-car mr-2"></i> Browse Vehicles
                </a>
            </div>
        </c:if>
    </div>
</main>

<!-- Edit Modal -->
<div id="editModal" class="hidden fixed inset-0 bg-slate-600 bg-opacity-50 overflow-y-auto h-full w-full z-50 backdrop-blur-sm">
    <div class="relative top-20 mx-auto p-5 border w-96 shadow-2xl rounded-2xl bg-white/90 backdrop-blur-md fade-in">
        <div class="mt-3">
            <h3 class="text-lg font-semibold text-gray-900 mb-4">Edit Booking</h3>
            <form id="editForm" method="post">
                <div class="mb-4">
                    <label for="editNumberOfDays" class="block text-sm font-semibold text-gray-700 mb-2">
                        Number of Days
                    </label>
                    <input type="number" id="editNumberOfDays" name="numberOfDays" min="1" max="30"
                           class="w-full px-3 py-2 border-2 border-gray-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#0891b2]/20 text-base transition-all duration-300"
                           required>
                </div>
                <div class="flex justify-end space-x-3">
                    <button type="button" onclick="closeEditModal()"
                            class="px-4 py-2 bg-slate-300 text-gray-700 rounded-lg hover:bg-slate-400 transition-all duration-300">
                        Cancel
                    </button>
                    <button type="submit"
                            class="px-4 py-2 bg-gradient-to-r from-[#0891b2] to-blue-700 text-white rounded-lg hover:from-blue-600 hover:to-blue-800 transition-all duration-300 shadow-lg hover:shadow-xl transform hover:-translate-y-1">
                        Update Booking
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Footer -->
<footer class="bg-gradient-to-r from-slate-800 via-gray-900 to-slate-900 text-white py-8 mt-12">
    <div class="container mx-auto px-4 text-center">
        <p class="text-base">&copy; 2024 DriveLK. All rights reserved.</p>
    </div>
</footer>

<script>
    function openEditModal(rentalId, numberOfDays) {
        document.getElementById('editForm').action = '/rental/update/' + rentalId;
        document.getElementById('editNumberOfDays').value = numberOfDays;
        document.getElementById('editModal').classList.remove('hidden');
    }

    function closeEditModal() {
        document.getElementById('editModal').classList.add('hidden');
    }

    // Close modal when clicking outside
    window.onclick = function(event) {
        const modal = document.getElementById('editModal');
        if (event.target === modal) {
            closeEditModal();
        }
    }
</script>
</body>
</html>