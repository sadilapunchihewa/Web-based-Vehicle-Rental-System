<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Available Vehicles - DriveLK</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
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
        .search-glow {
            box-shadow: 0 0 0 0 rgba(8, 145, 178, 0.7);
            transition: box-shadow 0.3s ease-in-out;
        }
        .search-glow:focus {
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
<!-- Header -->
<header class="bg-[#0891b2] text-white shadow-2xl">
    <div class="container mx-auto px-4 py-4">
        <div class="flex justify-between items-center">
            <a href="/home" class="text-2xl font-bold text-white">DriveLK</a>
            <nav class="flex space-x-6">
                <a href="/home" class="hover:text-blue-200 transition-all duration-300 hover:scale-105">Home</a>
                <a href="/rental/vehicles" class="hover:text-blue-200 transition-all duration-300 hover:scale-105">Rent Vehicle</a>
                <a href="/rental/my-bookings" class="hover:text-blue-200 transition-all duration-300 hover:scale-105">My Bookings</a>
                <a href="/logout" class="hover:text-blue-200 transition-all duration-300 hover:scale-105">Logout</a>
            </nav>
        </div>
    </div>
</header>

<!-- Main Content -->
<main class="container mx-auto px-4 py-8 fade-in">
    <h1 class="text-3xl font-bold text-center text-gray-800 mb-8 bg-gradient-to-r from-gray-700 via-gray-800 to-gray-900 bg-clip-text text-transparent drop-shadow-sm">Available Vehicles</h1>

    <!-- Search and Filter Section -->
    <div class="mb-8 bg-white/70 backdrop-blur-md p-6 rounded-2xl shadow-2xl border border-white/30">
        <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
            <div>
                <label class="block text-sm font-semibold text-gray-700 mb-2">Search by Brand</label>
                <input type="text" id="searchInput" placeholder="Toyota, Ford, etc."
                       class="w-full px-3 py-2 border-2 border-gray-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#0891b2]/20 search-glow text-base placeholder-gray-400 transition-all duration-300">
            </div>
            <div>
                <label class="block text-sm font-semibold text-gray-700 mb-2">Vehicle Type</label>
                <select id="typeFilter" class="w-full px-3 py-2 border-2 border-gray-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#0891b2]/20 text-base transition-all duration-300">
                    <option value="">All Types</option>
                    <option value="Car">Car</option>
                    <option value="SUV">SUV</option>
                    <option value="Truck">Truck</option>
                    <option value="Bike">Bike</option>
                    <option value="Luxury">Luxury</option>
                </select>
            </div>
            <div>
                <label class="block text-sm font-semibold text-gray-700 mb-2">Fuel Type</label>
                <select id="fuelFilter" class="w-full px-3 py-2 border-2 border-gray-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#0891b2]/20 text-base transition-all duration-300">
                    <option value="">All Fuel Types</option>
                    <option value="Petrol">Petrol</option>
                    <option value="Diesel">Diesel</option>
                    <option value="Electric">Electric</option>
                    <option value="Hybrid">Hybrid</option>
                </select>
            </div>
        </div>
    </div>

    <c:choose>
        <c:when test="${not empty vehicles}">
            <!-- Vehicles Grid -->
            <div id="vehiclesGrid" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                <c:forEach var="vehicle" items="${vehicles}">
                    <div class="bg-white/70 backdrop-blur-md rounded-2xl shadow-2xl overflow-hidden card-hover vehicle-card border border-white/30 fade-in"
                         data-brand="${vehicle.brand}" data-type="${vehicle.type}" data-fuel="${vehicle.fuelType}">

                        <!-- Vehicle Image -->
                        <c:choose>
                            <c:when test="${not empty vehicle.imageUrl}">
                                <img src="${vehicle.imageUrl}" alt="${vehicle.brand} ${vehicle.model}"
                                     class="w-full h-48 object-cover transition-all duration-300 hover:scale-105">
                            </c:when>
                            <c:otherwise>
                                <!-- Default images based on vehicle model -->
                                <c:choose>
                                    <c:when test="${fn:containsIgnoreCase(vehicle.model, 'camry')}">
                                        <img src="/images/camry.jpg" alt="${vehicle.brand} ${vehicle.model}"
                                             class="w-full h-48 object-cover transition-all duration-300 hover:scale-105">
                                    </c:when>
                                    <c:when test="${fn:containsIgnoreCase(vehicle.model, 'dio')}">
                                        <img src="/images/dio.jpg" alt="${vehicle.brand} ${vehicle.model}"
                                             class="w-full h-48 object-cover transition-all duration-300 hover:scale-105">
                                    </c:when>
                                    <c:when test="${fn:containsIgnoreCase(vehicle.model, 'hilux')}">
                                        <img src="/images/hilux.jpg" alt="${vehicle.brand} ${vehicle.model}"
                                             class="w-full h-48 object-cover transition-all duration-300 hover:scale-105">
                                    </c:when>
                                    <c:when test="${fn:containsIgnoreCase(vehicle.model, 'KDH')}">
                                        <img src="/images/KDH.jpg" alt="${vehicle.brand} ${vehicle.model}"
                                             class="w-full h-48 object-cover transition-all duration-300 hover:scale-105">
                                    </c:when>
                                    <c:when test="${fn:containsIgnoreCase(vehicle.model, 'ranger')}">
                                        <img src="/images/ranger.jpg" alt="${vehicle.brand} ${vehicle.model}"
                                             class="w-full h-48 object-cover transition-all duration-300 hover:scale-105">
                                    </c:when>
                                    <c:otherwise>
                                        <div class="h-48 gradient-bg flex items-center justify-center transition-all duration-300 hover:scale-105">
                                            <i class="fas fa-car text-white text-6xl opacity-90"></i>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </c:otherwise>
                        </c:choose>

                        <div class="p-6">
                            <div class="flex justify-between items-start mb-3">
                                <h3 class="text-xl font-semibold text-gray-800">${vehicle.brand} ${vehicle.model}</h3>
                                <span class="bg-gradient-to-r from-emerald-400 to-green-500 text-white text-xs font-medium px-2 py-1 rounded-full shadow-md">
                                        ${vehicle.availabilityStatus}
                                </span>
                            </div>

                            <div class="space-y-2 mb-4">
                                <div class="flex justify-between text-sm text-gray-600">
                                    <span class="text-gray-500"><i class="fas fa-cog mr-1"></i>Type:</span>
                                    <span class="font-medium text-gray-800">${vehicle.type}</span>
                                </div>
                                <div class="flex justify-between text-sm text-gray-600">
                                    <span class="text-gray-500"><i class="fas fa-calendar mr-1"></i>Year:</span>
                                    <span class="font-medium text-gray-800">${vehicle.year}</span>
                                </div>
                                <div class="flex justify-between text-sm text-gray-600">
                                    <span class="text-gray-500"><i class="fas fa-gas-pump mr-1"></i>Fuel:</span>
                                    <span class="font-medium text-gray-800">${vehicle.fuelType}</span>
                                </div>
                                <div class="flex justify-between text-sm text-gray-600">
                                    <span class="text-gray-500"><i class="fas fa-users mr-1"></i>Seats:</span>
                                    <span class="font-medium text-gray-800">${vehicle.seatingCapacity}</span>
                                </div>
                            </div>

                            <div class="flex items-center justify-between mb-4">
                                <div>
                                    <span class="text-xl font-bold bg-gradient-to-r from-[#0891b2] to-blue-700 bg-clip-text text-transparent">
                                        LKR <fmt:formatNumber value="${vehicle.dailyRate}" pattern="#,##0"/> /day
                                    </span>
                                </div>
                            </div>

                            <!-- Features -->
                            <div class="flex flex-wrap gap-2 mb-4">
                                <c:if test="${vehicle.hasGps}">
                                    <span class="inline-flex items-center text-xs bg-gradient-to-r from-blue-100 to-cyan-200 text-blue-800 px-2 py-1 rounded-full font-medium shadow-sm">
                                        <i class="fas fa-map-marker-alt mr-1"></i> GPS
                                    </span>
                                </c:if>
                                <c:if test="${vehicle.hasLeatherSeats}">
                                    <span class="inline-flex items-center text-xs bg-gradient-to-r from-emerald-100 to-green-200 text-emerald-800 px-2 py-1 rounded-full font-medium shadow-sm">
                                        <i class="fas fa-chair mr-1"></i> Leather Seats
                                    </span>
                                </c:if>
                                <c:if test="${vehicle.hasSunroof}">
                                    <span class="inline-flex items-center text-xs bg-gradient-to-r from-amber-100 to-yellow-200 text-amber-800 px-2 py-1 rounded-full font-medium shadow-sm">
                                        <i class="fas fa-sun mr-1"></i> Sunroof
                                    </span>
                                </c:if>
                            </div>

                            <a href="/rental/book/${vehicle.vehicleId}"
                               class="w-full bg-gradient-to-r from-[#0891b2] to-blue-700 text-white py-2 px-4 rounded-lg hover:from-blue-600 hover:to-blue-800 transition-all duration-300 flex items-center justify-center shadow-lg hover:shadow-xl transform hover:-translate-y-1 font-medium">
                                <i class="fas fa-calendar-plus mr-2"></i> Book Now
                            </a>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <!-- No Results Message -->
            <div id="noResults" class="hidden text-center py-12 fade-in">
                <i class="fas fa-car text-6xl text-gray-300 mb-4 animate-bounce"></i>
                <h3 class="text-xl font-semibold text-gray-600 mb-2">No vehicles found</h3>
                <p class="text-gray-500">Try adjusting your search filters</p>
            </div>
        </c:when>
        <c:otherwise>
            <div class="text-center py-12 fade-in">
                <i class="fas fa-car text-6xl text-gray-300 mb-4 animate-bounce"></i>
                <h3 class="text-xl font-semibold text-gray-600 mb-2">No vehicles available</h3>
                <p class="text-gray-500">Please check back later for available vehicles</p>
            </div>
        </c:otherwise>
    </c:choose>
</main>

<!-- Footer -->
<footer class="bg-gradient-to-r from-slate-800 via-gray-900 to-slate-900 text-white py-8 mt-12">
    <div class="container mx-auto px-4 text-center">
        <p class="text-base">&copy; 2024 DriveLK. All rights reserved.</p>
    </div>
</footer>

<script>
    // Filter functionality
    function filterVehicles() {
        const searchTerm = document.getElementById('searchInput').value.toLowerCase();
        const typeFilter = document.getElementById('typeFilter').value;
        const fuelFilter = document.getElementById('fuelFilter').value;
        const vehicles = document.querySelectorAll('.vehicle-card');
        let visibleCount = 0;

        vehicles.forEach(vehicle => {
            const brand = vehicle.dataset.brand.toLowerCase();
            const type = vehicle.dataset.type;
            const fuel = vehicle.dataset.fuel;

            const matchesSearch = brand.includes(searchTerm);
            const matchesType = !typeFilter || type === typeFilter;
            const matchesFuel = !fuelFilter || fuel === fuelFilter;

            if (matchesSearch && matchesType && matchesFuel) {
                vehicle.style.display = 'block';
                visibleCount++;
            } else {
                vehicle.style.display = 'none';
            }
        });

        // Show/hide no results message
        const noResults = document.getElementById('noResults');
        if (visibleCount === 0) {
            if (noResults) noResults.classList.remove('hidden');
        } else {
            if (noResults) noResults.classList.add('hidden');
        }
    }

    // Event listeners for filters
    document.getElementById('searchInput').addEventListener('input', filterVehicles);
    document.getElementById('typeFilter').addEventListener('change', filterVehicles);
    document.getElementById('fuelFilter').addEventListener('change', filterVehicles);

    // Initial filter
    <c:if test="${not empty vehicles}">
    filterVehicles();
    </c:if>
</script>
</body>
</html>