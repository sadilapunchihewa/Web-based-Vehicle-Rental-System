<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Drive LK - Edit Vehicle</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <style>
        /* CSS styles adapted from your provided JSP files */
        :root{ --header-bg: #0e7490; --header-fg:#ffffff; --footer-bg: #2f81cd; --footer-fg:#e5e7eb; }
        header{ background-color:var(--header-bg); }
        header .text-primary, header a, header h2, header svg{ color:var(--header-fg) !important; fill:currentColor; }
        .header-border{ border-bottom:1px solid rgb(47, 129, 205); }
        footer{ background-color:var(--footer-bg) !important; }
        header .btn-primary{ background-color: #000a3a; border-color:#157cbf; }
        body { font-family: "Space Grotesk", "Noto Sans", sans-serif; background-color: #ffffff; }
        .text-dark-gray { color: #101418; }
        .custom-container { max-width: 960px; margin: 0 auto; }
        .custom-padding-x { padding-left: 40px; padding-right: 40px; }
        .form-control, .form-select, .btn-primary, .btn-outline-secondary { border-radius: 0.75rem; }
        .btn-primary { background-color: #3f7fbf; border: none; }
        .alert { border-radius: 0.75rem; }
        .form-check { margin-bottom: 0.5rem; }
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

    <div class="custom-container custom-padding-x py-5">
        <h2 class="fs-2 fw-bold mb-5">Edit Vehicle (ID: ${vehicle.vehicleId})</h2>
        <div class="card border-0 shadow-sm">
            <div class="card-body">
                <%-- Display error message passed from controller on failure --%>
                <c:if test="${not empty error}">
                    <div class="alert alert-danger" role="alert">
                        Error: ${error}
                    </div>
                </c:if>

                <%-- Form action matches VehicleController @PostMapping("/update/{id}") --%>
                <form action="/vehicle/update/${vehicle.vehicleId}" method="post">
                    <div class="row g-3">

                        <div class="col-md-6">
                            <label class="form-label text-dark-gray" for="vehicleId">Vehicle ID</label>
                            <input type="text" id="vehicleId" name="vehicleId" class="form-control" value="${vehicle.vehicleId}" readonly>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label text-dark-gray" for="brand">Brand</label>
                            <input type="text" id="brand" name="brand" class="form-control" required="true" value="${vehicle.brand}">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label text-dark-gray" for="model">Model</label>
                            <input type="text" id="model" name="model" class="form-control" required="true" value="${vehicle.model}">
                        </div>

                        <div class="col-md-6">
                            <label class="form-label text-dark-gray" for="type">Type</label>
                            <select id="type" name="type" class="form-select">
                                <option value="Sedan" ${vehicle.type == 'Sedan' ? 'selected' : ''}>Sedan</option>
                                <option value="SUV" ${vehicle.type == 'SUV' ? 'selected' : ''}>SUV</option>
                                <option value="Truck" ${vehicle.type == 'Truck' ? 'selected' : ''}>Truck</option>
                                <option value="Van" ${vehicle.type == 'Van' ? 'selected' : ''}>Van</option>
                                <option value="Luxury" ${vehicle.type == 'Luxury' ? 'selected' : ''}>Luxury</option>
                                <option value="Bike" ${vehicle.type == 'Bike' ? 'selected' : ''}>Bike</option>
                                <option value="Economy" ${vehicle.type == 'Economy' ? 'selected' : ''}>Economy</option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label text-dark-gray" for="year">Year</label>
                            <input type="number" id="year" name="year" class="form-control" required="true" value="${vehicle.year}">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label text-dark-gray" for="mileage">Mileage (km)</label>
                            <input type="number" id="mileage" name="mileage" class="form-control" value="${vehicle.mileage}">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label text-dark-gray" for="fuelType">Fuel Type</label>
                            <select id="fuelType" name="fuelType" class="form-select">
                                <option value="Petrol" ${vehicle.fuelType == 'Petrol' ? 'selected' : ''}>Petrol</option>
                                <option value="Diesel" ${vehicle.fuelType == 'Diesel' ? 'selected' : ''}>Diesel</option>
                                <option value="Electric" ${vehicle.fuelType == 'Electric' ? 'selected' : ''}>Electric</option>
                                <option value="Hybrid" ${vehicle.fuelType == 'Hybrid' ? 'selected' : ''}>Hybrid</option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label text-dark-gray" for="seatingCapacity">Seating Capacity</label>
                            <input type="number" id="seatingCapacity" name="seatingCapacity" class="form-control" required="true" value="${vehicle.seatingCapacity}">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label text-dark-gray" for="availabilityStatus">Availability Status</label>
                            <select id="availabilityStatus" name="availabilityStatus" class="form-select">
                                <option value="Available" ${vehicle.availabilityStatus == 'Available' ? 'selected' : ''}>Available</option>
                                <option value="Rented" ${vehicle.availabilityStatus == 'Rented' ? 'selected' : ''}>Rented</option>
                                <option value="Under Maintenance" ${vehicle.availabilityStatus == 'Under Maintenance' ? 'selected' : ''}>Under Maintenance</option>
                                <option value="Pending Deletion" ${vehicle.availabilityStatus == 'Pending Deletion' ? 'selected' : ''}>Pending Deletion</option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label text-dark-gray" for="imageUrl">Image URL (Optional)</label>
                            <input type="text" id="imageUrl" name="imageUrl" class="form-control" value="${vehicle.imageUrl}">
                            <small class="form-text text-muted">Current Image:
                                <c:choose>
                                    <c:when test="${not empty vehicle.imageUrl}">
                                        <a href="${vehicle.imageUrl}" target="_blank">View Link</a>
                                    </c:when>
                                    <c:otherwise>
                                        No Image URL set.
                                    </c:otherwise>
                                </c:choose>
                            </small>
                        </div>
                        <div class="col-12">
                            <label class="form-label text-dark-gray" for="description">Description</label>
                            <textarea id="description" name="description" class="form-control" rows="4">${vehicle.description}</textarea>
                        </div>

                        <div class="col-12">
                            <label class="form-label text-dark-gray">Features</label>
                            <%-- The controller handles unchecked boxes by defaulting to "false" --%>
                            <div class="d-flex flex-wrap gap-4">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="hasGps" value="true" id="hasGps" ${vehicle.hasGps ? 'checked' : ''}>
                                    <label class="form-check-label" for="hasGps">GPS</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="hasLeatherSeats" value="true" id="hasLeatherSeats" ${vehicle.hasLeatherSeats ? 'checked' : ''}>
                                    <label class="form-check-label" for="hasLeatherSeats">Leather Seats</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="hasSunroof" value="true" id="hasSunroof" ${vehicle.hasSunroof ? 'checked' : ''}>
                                    <label class="form-check-label" for="hasSunroof">Sunroof</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="hasPremiumSound" value="true" id="hasPremiumSound" ${vehicle.hasPremiumSound ? 'checked' : ''}>
                                    <label class="form-check-label" for="hasPremiumSound">Premium Sound</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="hasAwd" value="true" id="hasAwd" ${vehicle.hasAwd ? 'checked' : ''}>
                                    <label class="form-check-label" for="hasAwd">AWD</label>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 d-flex gap-2 mt-4">
                            <button type="submit" class="btn btn-primary">Update Vehicle</button>
                            <a href="/vehicle/view/${vehicle.vehicleId}" class="btn btn-outline-secondary">Cancel</a>
                        </div>
                    </div>
                </form>
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