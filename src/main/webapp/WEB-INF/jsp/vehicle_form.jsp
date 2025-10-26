<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Drive LK - Add Vehicle</title>
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
        <div class="custom-container d-flex align-items-center justify-content-between">
            <h2 class="fs-5 fw-bold mb-0">DriveLK (Admin)</h2>
            <div class="d-flex gap-4">
                <a href="/vehicle/list" class="text-primary text-decoration-none">Manage Vehicles</a>
                <a href="/logout" class="btn btn-primary btn-sm">Logout</a>
            </div>
        </div>
    </header>

    <div class="custom-container custom-padding-x py-5">
        <h2 class="fs-2 fw-bold mb-5">Add New Vehicle</h2>
        <div class="card border-0 shadow-sm">
            <div class="card-body">
                <%-- Display error message passed from controller on failure --%>
                <c:if test="${not empty error}">
                    <div class="alert alert-danger" role="alert">
                        Error: ${error}
                    </div>
                </c:if>

                <%-- Form action matches VehicleController @PostMapping("/add") --%>
                <form action="/vehicle/add" method="post">
                    <div class="row g-3">

                        <div class="col-md-6">
                            <label class="form-label text-dark-gray" for="vehicleId">Vehicle ID (e.g., V001)</label>
                            <input type="text" id="vehicleId" name="vehicleId" class="form-control" required="true" value="${param.vehicleId}">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label text-dark-gray" for="brand">Brand</label>
                            <input type="text" id="brand" name="brand" class="form-control" required="true" value="${param.brand}">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label text-dark-gray" for="model">Model</label>
                            <input type="text" id="model" name="model" class="form-control" required="true" value="${param.model}">
                        </div>

                        <div class="col-md-6">
                            <label class="form-label text-dark-gray" for="type">Type</label>
                            <select id="type" name="type" class="form-select">
                                <option value="Sedan">Sedan</option>
                                <option value="SUV">SUV</option>
                                <option value="Truck">Truck</option>
                                <option value="Van">Van</option>
                                <option value="Luxury">Luxury</option>
                                <option value="Bike">Bike</option>
                                <option value="Economy">Economy</option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label text-dark-gray" for="year">Year</label>
                            <input type="number" id="year" name="year" class="form-control" required="true" value="${param.year}">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label text-dark-gray" for="mileage">Mileage (km)</label>
                            <input type="number" id="mileage" name="mileage" class="form-control" value="${param.mileage}">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label text-dark-gray" for="fuelType">Fuel Type</label>
                            <select id="fuelType" name="fuelType" class="form-select">
                                <option value="Petrol">Petrol</option>
                                <option value="Diesel">Diesel</option>
                                <option value="Electric">Electric</option>
                                <option value="Hybrid">Hybrid</option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label text-dark-gray" for="seatingCapacity">Seating Capacity</label>
                            <input type="number" id="seatingCapacity" name="seatingCapacity" class="form-control" required="true" value="${param.seatingCapacity}">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label text-dark-gray" for="availabilityStatus">Availability Status</label>
                            <select id="availabilityStatus" name="availabilityStatus" class="form-select">
                                <option value="Available">Available</option>
                                <option value="Rented">Rented</option>
                                <option value="Under Maintenance">Under Maintenance</option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label text-dark-gray" for="imageUrl">Image URL (Optional)</label>
                            <input type="text" id="imageUrl" name="imageUrl" class="form-control" value="${param.imageUrl}">
                            <small class="form-text text-muted">Use a direct URL for the vehicle image.</small>
                        </div>
                        <div class="col-12">
                            <label class="form-label text-dark-gray" for="description">Description</label>
                            <textarea id="description" name="description" class="form-control" rows="4">${param.description}</textarea>
                        </div>

                        <div class="col-12">
                            <label class="form-label text-dark-gray">Features</label>
                            <%-- The controller handles unchecked boxes by defaulting to "false" --%>
                            <div class="d-flex flex-wrap gap-4">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="hasGps" value="true" id="hasGps">
                                    <label class="form-check-label" for="hasGps">GPS</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="hasLeatherSeats" value="true" id="hasLeatherSeats">
                                    <label class="form-check-label" for="hasLeatherSeats">Leather Seats</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="hasSunroof" value="true" id="hasSunroof">
                                    <label class="form-check-label" for="hasSunroof">Sunroof</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="hasPremiumSound" value="true" id="hasPremiumSound">
                                    <label class="form-check-label" for="hasPremiumSound">Premium Sound</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="hasAwd" value="true" id="hasAwd">
                                    <label class="form-check-label" for="hasAwd">AWD</label>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 d-flex gap-2 mt-4">
                            <button type="submit" class="btn btn-primary">Add Vehicle</button>
                            <a href="/vehicle/list" class="btn btn-outline-secondary">Cancel</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <footer class="bg-dark text-white text-center py-4">
        <div class="custom-container">
            <p class="mb-0">© 2025 Drive LK. All rights reserved.</p>
        </div>
    </footer>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>