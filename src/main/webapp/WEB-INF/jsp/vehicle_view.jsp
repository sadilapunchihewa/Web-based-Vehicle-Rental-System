<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Drive LK - View Vehicle</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <style>
        /* General Styles adapted from your project's theme */
        :root{ --header-bg: #0e7490; --header-fg:#ffffff; --footer-bg: #2f81cd; }
        header{ background-color:var(--header-bg); }
        header .text-primary, header a, header h2, header svg{ color:var(--header-fg) !important; fill:currentColor; }
        .header-border{ border-bottom:1px solid rgb(47, 129, 205); }
        .feature-tag { display: inline-block; padding: 0.3rem 0.8rem; margin-right: 0.5rem; margin-bottom: 0.5rem; border-radius: 0.5rem; font-size: 0.9rem; background-color: #e0f2f1; color: #004d40; }
        .vehicle-image { max-height: 400px; object-fit: cover; width: 100%; border-radius: 0.75rem; }
    </style>
</head>
<body>
<div class="d-flex flex-column min-vh-100">
    <header class="header-border px-4 py-3">
        <div class="container d-flex align-items-center justify-content-between">
            <h2 class="fs-5 fw-bold mb-0 text-white">DriveLK (Admin)</h2>
            <a href="/vehicle/list" class="btn btn-primary btn-sm">Back to Vehicle List</a>
        </div>
    </header>

    <div class="container py-5 flex-grow-1">
        <h2 class="fs-2 fw-bold mb-5">Vehicle Details (ID: ${vehicle.vehicleId})</h2>

        <div class="card border-0 shadow-sm">
            <c:choose>
                <c:when test="${not empty vehicle.imageUrl}">
                    <img src="${vehicle.imageUrl}" class="vehicle-image card-img-top" alt="${vehicle.brand} ${vehicle.model}">
                </c:when>
                <c:otherwise>
                    <div class="vehicle-image card-img-top bg-light d-flex align-items-center justify-content-center text-secondary">
                        <h3>No Image Available</h3>
                    </div>
                </c:otherwise>
            </c:choose>

            <div class="card-body p-4">
                <h3 class="card-title text-dark-gray mb-4">${vehicle.brand} ${vehicle.model}</h3>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <p class="text-muted"><strong>Vehicle ID:</strong> ${vehicle.vehicleId}</p>
                        <p class="text-muted"><strong>Brand:</strong> ${vehicle.brand}</p>
                        <p class="text-muted"><strong>Model:</strong> ${vehicle.model}</p>
                        <p class="text-muted"><strong>Type:</strong> ${vehicle.type}</p>
                        <p class="text-muted"><strong>Year:</strong> ${vehicle.year}</p>
                        <p class="text-muted"><strong>Mileage:</strong> <c:out value="${vehicle.mileage != null ? vehicle.mileage : 'N/A'}" /> km</p>
                    </div>
                    <div class="col-md-6 mb-3">
                        <p class="text-muted"><strong>Fuel Type:</strong> ${vehicle.fuelType}</p>
                        <p class="text-muted"><strong>Seating Capacity:</strong> ${vehicle.seatingCapacity}</p>
                        <p class="text-muted"><strong>Status:</strong> <span class="badge ${vehicle.availabilityStatus == 'Available' ? 'bg-success' : vehicle.availabilityStatus == 'Rented' ? 'bg-warning' : 'bg-danger'}">${vehicle.availabilityStatus}</span></p>
                        <p class="text-muted"><strong>Daily Rate (Auto-calculated):</strong> LKR ${vehicle.dailyRate}</p>
                        <p class="text-muted"><strong>Description:</strong> <c:out value="${vehicle.description != null ? vehicle.description : 'No description provided.'}" /></p>
                    </div>
                </div>

                <h5 class="mt-4 mb-3 text-dark-gray">Features</h5>
                <div class="d-flex flex-wrap">
                    <c:if test="${vehicle.hasGps}">
                        <span class="feature-tag">GPS</span>
                    </c:if>
                    <c:if test="${vehicle.hasLeatherSeats}">
                        <span class="feature-tag">Leather Seats</span>
                    </c:if>
                    <c:if test="${vehicle.hasSunroof}">
                        <span class="feature-tag">Sunroof</span>
                    </c:if>
                    <c:if test="${vehicle.hasPremiumSound}">
                        <span class="feature-tag">Premium Sound</span>
                    </c:if>
                    <c:if test="${vehicle.hasAwd}">
                        <span class="feature-tag">AWD</span>
                    </c:if>
                    <c:if test="${!vehicle.hasGps && !vehicle.hasLeatherSeats && !vehicle.hasSunroof && !vehicle.hasPremiumSound && !vehicle.hasAwd}">
                        <span class="text-muted">No premium features listed.</span>
                    </c:if>
                </div>

                <div class="d-flex gap-2 flex-wrap mt-4">
                    <%-- Edit Button --%>
                    <a href="/vehicle/edit/${vehicle.vehicleId}" class="btn btn-outline-primary">Edit Details</a>

                    <%-- Delete Button --%>
                    <a href="/vehicle/delete/${vehicle.vehicleId}"
                       onclick="return confirm('Are you sure you want to delete this vehicle (${vehicle.vehicleId})?');"
                       class="btn btn-outline-danger">Delete Vehicle</a>

                    <%-- Back to List Button --%>
                    <a href="/vehicle/list" class="btn btn-outline-secondary">Back to List</a>
                </div>
            </div>
        </div>
    </div>

    <footer class="bg-dark text-white text-center py-4 mt-auto">
        <div class="container">
            <p class="mb-0">© 2025 Drive LK. All rights reserved.</p>
        </div>
    </footer>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>