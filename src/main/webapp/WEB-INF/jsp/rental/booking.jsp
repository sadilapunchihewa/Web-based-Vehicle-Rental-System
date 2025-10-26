<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Vehicle - DriveLK</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <style>
        .gradient-bg {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }
        .card-hover {
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }
        .card-hover:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1);
        }
        .date-glow {
            box-shadow: 0 0 0 0 rgba(8, 145, 178, 0.7);
            transition: box-shadow 0.3s ease-in-out;
        }
        .date-glow:focus {
            box-shadow: 0 0 0 3px rgba(8, 145, 178, 0.3);
        }
        .fade-in {
            animation: fadeIn 0.5s ease-in-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body class="bg-gradient-to-br from-slate-50 via-blue-50 to-indigo-50 min-h-screen">
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

<main class="container mx-auto px-4 py-8 fade-in">
    <div class="max-w-4xl mx-auto">
        <h1 class="text-3xl font-bold text-center text-gray-800 mb-8 bg-gradient-to-r from-gray-700 via-gray-800 to-gray-900 bg-clip-text text-transparent drop-shadow-sm">Book Your Vehicle</h1>

        <c:if test="${not empty success}">
            <div class="mb-6 p-4 bg-gradient-to-r from-emerald-50 to-green-50 border-2 border-emerald-200 text-emerald-700 rounded-xl shadow-lg backdrop-blur-sm animate-pulse">
                <i class="fas fa-check-circle mr-2"></i>${success}
            </div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="mb-6 p-4 bg-gradient-to-r from-rose-50 to-red-50 border-2 border-rose-200 text-rose-700 rounded-xl shadow-lg backdrop-blur-sm animate-pulse">
                <i class="fas fa-exclamation-circle mr-2"></i>${error}
            </div>
        </c:if>

        <c:choose>
            <c:when test="${not empty vehicle}">
                <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
                    <div class="bg-white/70 backdrop-blur-md rounded-2xl shadow-2xl p-6 card-hover border border-white/30">
                        <h2 class="text-2xl font-semibold mb-4 text-gray-800">Vehicle Details</h2>
                        <div class="space-y-4">
                                <%-- Vehicle Image and Info block (Omitted for brevity) --%>
                            <c:choose>
                                <c:when test="${not empty vehicle.imageUrl}">
                                    <img src="${vehicle.imageUrl}" alt="${vehicle.brand} ${vehicle.model}"
                                         class="w-full h-64 object-cover rounded-xl mb-4 transition-all duration-300 hover:scale-105">
                                </c:when>
                                <c:otherwise>
                                    <c:choose>
                                        <c:when test="${fn:containsIgnoreCase(vehicle.model, 'camry')}">
                                            <img src="/images/camry.jpg" alt="${vehicle.brand} ${vehicle.model}"
                                                 class="w-full h-64 object-cover rounded-xl mb-4 transition-all duration-300 hover:scale-105">
                                        </c:when>
                                        <c:when test="${fn:containsIgnoreCase(vehicle.model, 'dio')}">
                                            <img src="/images/dio.jpg" alt="${vehicle.brand} ${vehicle.model}"
                                                 class="w-full h-64 object-cover rounded-xl mb-4 transition-all duration-300 hover:scale-105">
                                        </c:when>
                                        <c:when test="${fn:containsIgnoreCase(vehicle.model, 'hilux')}">
                                            <img src="/images/hilux.jpg" alt="${vehicle.brand} ${vehicle.model}"
                                                 class="w-full h-64 object-cover rounded-xl mb-4 transition-all duration-300 hover:scale-105">
                                        </c:when>
                                        <c:when test="${fn:containsIgnoreCase(vehicle.model, 'KDH')}">
                                            <img src="/images/KDH.jpg" alt="${vehicle.brand} ${vehicle.model}"
                                                 class="w-full h-64 object-cover rounded-xl mb-4 transition-all duration-300 hover:scale-105">
                                        </c:when>
                                        <c:when test="${fn:containsIgnoreCase(vehicle.model, 'ranger')}">
                                            <img src="/images/ranger.jpg" alt="${vehicle.brand} ${vehicle.model}"
                                                 class="w-full h-64 object-cover rounded-xl mb-4 transition-all duration-300 hover:scale-105">
                                        </c:when>
                                        <c:otherwise>
                                            <div class="h-64 gradient-bg rounded-xl flex items-center justify-center mb-4 transition-all duration-300 hover:scale-105">
                                                <i class="fas fa-car text-white text-8xl opacity-90"></i>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </c:otherwise>
                            </c:choose>

                            <div class="grid grid-cols-2 gap-4">
                                <div><label class="block text-sm font-semibold text-gray-600">Brand</label><p class="text-lg font-semibold text-gray-800">${vehicle.brand}</p></div>
                                <div><label class="block text-sm font-semibold text-gray-600">Model</label><p class="text-lg font-semibold text-gray-800">${vehicle.model}</p></div>
                                <div><label class="block text-sm font-semibold text-gray-600">Type</label><p class="text-lg font-semibold text-gray-800">${vehicle.type}</p></div>
                                <div><label class="block text-sm font-semibold text-gray-600">Year</label><p class="text-lg font-semibold text-gray-800">${vehicle.year}</p></div>
                                <div><label class="block text-sm font-semibold text-gray-600">Fuel Type</label><p class="text-lg font-semibold text-gray-800">${vehicle.fuelType}</p></div>
                                <div><label class="block text-sm font-semibold text-gray-600">Seating Capacity</label><p class="text-lg font-semibold text-gray-800">${vehicle.seatingCapacity}</p></div>
                            </div>

                            <div class="flex flex-wrap gap-2">
                                <c:if test="${vehicle.hasGps}"><span class="inline-flex items-center text-xs bg-gradient-to-r from-blue-100 to-cyan-200 text-blue-800 px-3 py-1 rounded-full font-medium shadow-sm"><i class="fas fa-map-marker-alt mr-1"></i> GPS</span></c:if>
                                <c:if test="${vehicle.hasLeatherSeats}"><span class="inline-flex items-center text-xs bg-gradient-to-r from-emerald-100 to-green-200 text-emerald-800 px-3 py-1 rounded-full font-medium shadow-sm"><i class="fas fa-chair mr-1"></i> Leather Seats</span></c:if>
                                <c:if test="${vehicle.hasSunroof}"><span class="inline-flex items-center text-xs bg-gradient-to-r from-amber-100 to-yellow-200 text-amber-800 px-3 py-1 rounded-full font-medium shadow-sm"><i class="fas fa-sun mr-1"></i> Sunroof</span></c:if>
                                <c:if test="${vehicle.hasPremiumSound}"><span class="inline-flex items-center text-xs bg-gradient-to-r from-purple-100 to-violet-200 text-purple-800 px-3 py-1 rounded-full font-medium shadow-sm"><i class="fas fa-volume-up mr-1"></i> Premium Sound</span></c:if>
                                <c:if test="${vehicle.hasAwd}"><span class="inline-flex items-center text-xs bg-gradient-to-r from-rose-100 to-red-200 text-rose-800 px-3 py-1 rounded-full font-medium shadow-sm"><i class="fas fa-car-side mr-1"></i> AWD</span></c:if>
                            </div>

                            <c:if test="${not empty vehicle.description}">
                                <div><label class="block text-sm font-semibold text-gray-600">Description</label><p class="text-gray-700 text-sm leading-relaxed">${vehicle.description}</p></div>
                            </c:if>
                        </div>
                    </div>

                    <div class="bg-white/70 backdrop-blur-md rounded-2xl shadow-2xl p-6 card-hover border border-white/30">
                        <h2 class="text-2xl font-semibold mb-4 text-gray-800">Booking Information</h2>
                        <form action="/rental/book" method="post" id="bookingForm">
                            <input type="hidden" name="vehicleId" value="${vehicle.vehicleId}">
                            <input type="hidden" name="numberOfDays" id="numberOfDays" value="1">
                            <input type="hidden" name="startDate" id="startDate" value="" required>
                            <input type="hidden" name="endDate" id="endDate" value="" required>

                            <div class="space-y-4">
                                <div>
                                    <label for="rentalDates" class="block text-sm font-semibold text-gray-700 mb-2">
                                        Rental Period <span class="text-rose-500">*</span>
                                    </label>
                                    <input type="text" id="rentalDates" name="rentalDates"
                                           class="w-full px-3 py-2 border-2 border-gray-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#0891b2]/20 date-glow text-base placeholder-gray-400 transition-all duration-300"
                                           placeholder="Click to select start and end dates..." readonly required>
                                    <div id="dateError" class="text-rose-500 text-sm mt-1 hidden">
                                        <i class="fas fa-exclamation-triangle mr-1"></i>Please select a valid date range
                                    </div>
                                    <div id="dateHelp" class="text-blue-600 text-sm mt-1">
                                        <i class="fas fa-info-circle mr-1"></i>Click the field above to select your rental dates
                                    </div>
                                </div>

                                <div class="mb-6">
                                    <label class="block text-sm font-semibold text-gray-700 mb-2">Booking Option</label>
                                    <div class="flex space-x-6 mb-3">
                                        <label class="flex items-center">
                                            <input type="radio" name="withDriver" value="false" checked class="mr-2 text-[#0891b2] focus:ring-[#0891b2]" onclick="toggleDriver(false)">
                                            <span class="text-sm text-gray-700">Self-Drive</span>
                                        </label>
                                        <label class="flex items-center">
                                            <input type="radio" name="withDriver" value="true" class="mr-2 text-[#0891b2] focus:ring-[#0891b2]" onclick="toggleDriver(true)">
                                            <span class="text-sm text-gray-700">With Driver (+LKR 1,500/day)</span>
                                        </label>
                                    </div>

                                    <div id="driverSelect" class="hidden">
                                        <label class="block text-sm font-semibold text-gray-700 mb-2">Select Driver <span class="text-rose-500">*</span></label>
                                        <select name="driverId" id="driverId" class="w-full px-3 py-2 border-2 border-gray-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#0891b2]/20 text-base transition-all duration-300">
                                            <option value="">-- Choose an Available Driver --</option>
                                            <c:forEach var="driver" items="${drivers}">
                                                <%-- FIX: Use userId, firstName, lastName, and contactInfo from the Driver Management model --%>
                                                <option value="${driver.userId}">${driver.firstName} ${driver.lastName} (ID: ${driver.userId}, Contact: ${driver.contactInfo})</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <c:if test="${empty drivers}">
                                        <p class="text-sm text-red-500">Note: No drivers are currently listed as available.</p>
                                    </c:if>
                                </div>


                                <div class="bg-gradient-to-r from-slate-50 to-gray-100 p-4 rounded-xl shadow-inner">
                                    <h3 class="font-semibold text-gray-800 mb-3 text-sm">Rental Summary</h3>
                                    <div class="space-y-2 text-sm">
                                        <div class="flex justify-between">
                                            <span>Daily Rate (Vehicle):</span>
                                            <span class="font-semibold" id="dailyRateDisplay">
                                                LKR <fmt:formatNumber value="${vehicle.dailyRate}" pattern="#,##0"/>
                                            </span>
                                        </div>
                                        <div id="driverRateRow" class="flex justify-between hidden">
                                            <span>Daily Rate (Driver):</span>
                                            <span class="font-semibold text-emerald-600">LKR 1,500</span>
                                        </div>
                                        <div class="flex justify-between">
                                            <span>Number of Days:</span>
                                            <span class="font-semibold" id="daysDisplay">1</span>
                                        </div>
                                        <div class="flex justify-between text-lg font-bold bg-gradient-to-r from-emerald-400 to-green-500 bg-clip-text text-transparent border-t pt-2">
                                            <span>Total Cost:</span>
                                            <span id="totalCostDisplay">
                                                LKR <fmt:formatNumber value="${vehicle.dailyRate}" pattern="#,##0"/>
                                            </span>
                                        </div>
                                    </div>
                                </div>

                                <div class="bg-gradient-to-r from-blue-50 to-cyan-100 p-4 rounded-xl shadow-inner">
                                    <h3 class="font-semibold text-blue-800 mb-2 text-sm">What's included:</h3>
                                    <ul class="text-sm text-blue-700 space-y-1">
                                        <li class="flex items-center">
                                            <i class="fas fa-check mr-2 text-emerald-500"></i> Comprehensive insurance
                                        </li>
                                        <li class="flex items-center">
                                            <i class="fas fa-check mr-2 text-emerald-500"></i> 24/7 roadside assistance
                                        </li>
                                        <li class="flex items-center">
                                            <i class="fas fa-check mr-2 text-emerald-500"></i> Free cancellation within 24 hours
                                        </li>
                                        <li class="flex items-center">
                                            <i class="fas fa-check mr-2 text-emerald-500"></i> Unlimited mileage
                                        </li>
                                        <li class="flex items-center text-blue-800 font-semibold">
                                            <i class="fas fa-user-tie mr-2 text-emerald-500"></i> Professional driver service (LKR 1,500/day option)
                                        </li>
                                    </ul>
                                </div>

                                <div class="flex items-center mb-4">
                                    <input type="checkbox" id="terms" name="terms" required
                                           class="w-4 h-4 text-[#0891b2] bg-gray-100 border-gray-300 rounded focus:ring-[#0891b2] transition-all duration-300">
                                    <label for="terms" class="ml-2 text-sm text-gray-700">
                                        I agree to the <a href="/terms" class="text-[#0891b2] hover:underline font-semibold">Terms and Conditions</a>
                                    </label>
                                </div>

                                <button type="submit" id="submitBtn" disabled
                                        class="w-full bg-gradient-to-r from-emerald-600 to-green-700 text-white py-3 px-4 rounded-lg hover:from-emerald-700 hover:to-green-800 transition-all duration-300 font-semibold shadow-lg hover:shadow-xl transform hover:-translate-y-1 disabled:bg-gray-400 disabled:cursor-not-allowed disabled:transform-none">
                                    <i class="fas fa-calendar-check mr-2"></i> Confirm Booking
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div class="bg-white/70 backdrop-blur-md rounded-2xl shadow-2xl p-8 text-center border border-white/30">
                    <i class="fas fa-exclamation-triangle text-6xl text-amber-500 mb-4 animate-bounce"></i>
                    <h2 class="text-2xl font-semibold text-gray-800 mb-2">Vehicle Not Found</h2>
                    <p class="text-gray-600 mb-4">The vehicle you're trying to book is not available.</p>
                    <a href="/rental/vehicles" class="bg-gradient-to-r from-[#0891b2] to-blue-700 text-white px-6 py-2 rounded-lg hover:from-blue-600 hover:to-blue-800 transition-all duration-300 shadow-lg hover:shadow-xl transform hover:-translate-y-1">
                        Back to Vehicles
                    </a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</main>

<footer class="bg-gradient-to-r from-slate-800 via-gray-900 to-slate-900 text-white py-8 mt-12">
    <div class="container mx-auto px-4 text-center">
        <p class="text-base">&copy; 2024 DriveLK. All rights reserved.</p>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script>
    <c:if test="${not empty vehicle}">

    const DRIVER_DAILY_RATE = 1500;
    const vehicleDailyRate = ${vehicle.dailyRate};

    // Set default dates immediately
    const today = new Date();
    const tomorrow = new Date(today);
    tomorrow.setDate(tomorrow.getDate() + 1);

    const datePicker = flatpickr("#rentalDates", {
        mode: "range",
        minDate: "today",
        dateFormat: "Y-m-d",
        defaultDate: [today, tomorrow],
        onChange: function(selectedDates, dateStr, instance) {
            updateRentalSummary(selectedDates);
        },
        onReady: function(selectedDates, dateStr, instance) {
            if (selectedDates.length === 2) {
                updateRentalSummary(selectedDates);
            }
        }
    });

    function formatDate(date) {
        if (!date) return '';
        const d = new Date(date);
        const year = d.getFullYear();
        const month = String(d.getMonth() + 1).padStart(2, '0');
        const day = String(d.getDate()).padStart(2, '0');
        return year + '-' + month + '-' + day;
    }

    function updateRentalSummary(selectedDates) {
        const dateError = document.getElementById('dateError');
        const dateHelp = document.getElementById('dateHelp');
        const submitBtn = document.getElementById('submitBtn');
        const driverRateRow = document.getElementById('driverRateRow');
        const withDriverChecked = document.querySelector('input[name="withDriver"][value="true"]').checked;

        let isValidRange = false;
        let numberOfDays = 0;
        let formattedStart = '';
        let formattedEnd = '';

        if (selectedDates.length === 2) {
            const startDate = selectedDates[0];
            const endDate = selectedDates[1];

            formattedStart = formatDate(startDate);
            formattedEnd = formatDate(endDate);

            // Calculate number of days (inclusive)
            const timeDiff = endDate.getTime() - startDate.getTime();
            numberOfDays = Math.ceil(timeDiff / (1000 * 3600 * 24)) + 1;

            if (numberOfDays > 0) {
                isValidRange = true;
            }
        }

        document.getElementById('startDate').value = formattedStart;
        document.getElementById('endDate').value = formattedEnd;

        if (isValidRange) {
            // Update display
            document.getElementById('daysDisplay').textContent = numberOfDays;
            document.getElementById('numberOfDays').value = numberOfDays;

            // Calculate costs
            let totalCost = vehicleDailyRate * numberOfDays;

            if (withDriverChecked) {
                totalCost += DRIVER_DAILY_RATE * numberOfDays;
                driverRateRow.classList.remove('hidden');
            } else {
                driverRateRow.classList.add('hidden');
            }

            document.getElementById('totalCostDisplay').textContent =
                'LKR ' + totalCost.toLocaleString('en-US', {maximumFractionDigits: 0});

            // Hide error and help message, enable submit
            dateError.classList.add('hidden');
            dateHelp.classList.add('hidden');
            submitBtn.disabled = false;
        } else {
            showDateError();
        }
    }

    function showDateError() {
        const dateError = document.getElementById('dateError');
        const dateHelp = document.getElementById('dateHelp');
        const submitBtn = document.getElementById('submitBtn');

        dateError.classList.remove('hidden');
        dateHelp.classList.add('hidden');
        submitBtn.disabled = true;
        document.getElementById('startDate').value = '';
        document.getElementById('endDate').value = '';
    }

    function toggleDriver(withDriver) {
        const driverSelectDiv = document.getElementById('driverSelect');
        const driverSelectElement = document.getElementById('driverId');

        if (withDriver) {
            driverSelectDiv.classList.remove('hidden');
            driverSelectElement.setAttribute('required', 'true');
        } else {
            driverSelectDiv.classList.add('hidden');
            driverSelectElement.removeAttribute('required');
            driverSelectElement.value = ''; // Clear selection if self-driving
        }

        // Recalculate cost when the driver option changes
        updateRentalSummary(datePicker.selectedDates);
    }

    // Initial call to set up cost calculation for default dates
    document.addEventListener('DOMContentLoaded', function() {
        updateRentalSummary(datePicker.selectedDates);
    });

    // Form validation
    document.getElementById('bookingForm').addEventListener('submit', function(e) {
        const selectedDates = datePicker.selectedDates;
        const termsChecked = document.getElementById('terms').checked;
        const startDateValue = document.getElementById('startDate').value;
        const endDateValue = document.getElementById('endDate').value;
        const withDriverChecked = document.querySelector('input[name="withDriver"][value="true"]').checked;
        const driverIdValue = document.getElementById('driverId').value;

        // 1. Date Validation
        if (selectedDates.length !== 2 || !startDateValue || !endDateValue) {
            e.preventDefault();
            showDateError();
            alert('Please select valid start and end rental dates.');
            return false;
        }

        // 2. Driver Validation
        if (withDriverChecked && driverIdValue === "") {
            e.preventDefault();
            alert('Please select a driver to proceed with the "With Driver" option.');
            return false;
        }

        // 3. Terms Validation
        if (!termsChecked) {
            e.preventDefault();
            alert('You must agree to the Terms and Conditions.');
            return false;
        }

        // 4. Past Date Check (already handled implicitly by minDate="today" in flatpickr, but good redundancy)
        const todayAtMidnight = new Date();
        todayAtMidnight.setHours(0, 0, 0, 0);
        const start = new Date(startDateValue);

        if (start < todayAtMidnight) {
            e.preventDefault();
            alert('Start date cannot be in the past.');
            return false;
        }
    });

    </c:if>
</script>
</body>
</html>