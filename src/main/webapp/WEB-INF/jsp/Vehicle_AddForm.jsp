<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Drive LK - Add Vehicle</title>
    <link rel="icon" type="image/x-icon" href="data:image/x-icon;base64," />
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;500;700;900&family=Space+Grotesk:wght@400;500;700&display=swap" rel="stylesheet">
    <style>

        :root{
            --header-bg: #0e7490;   /* header background */
            --header-fg:#ffffff;   /* header text/icons */
            --footer-bg: #2f81cd;   /* footer background */
            --footer-fg:#e5e7eb;   /* footer text/links */
        }

        /* Header */
        header{
            background-color:var(--header-bg);
        }
        header .text-primary,
        header .text-secondary,
        header a,
        header h2,
        header svg{
            color:var(--header-fg) !important;
            fill:currentColor;
        }
        .header-border{
            border-bottom:1px solid rgb(47, 129, 205);
        }

        /* Footer (your HTML uses .bg-blue) */
        .bg-blue,
        footer{
            background-color:var(--footer-bg) !important;
        }
        footer .text-secondary,
        footer a,
        footer p,
        footer svg{
            color:var(--footer-fg) !important;
            fill:currentColor;
        }
        footer a:hover{ opacity:.85; }

            /* Make the Login button pop on dark header (optional) */
        header .btn-primary{
            background-color: #000a3a;
            border-color:#157cbf;
        }
        header .btn-primary:hover{
            background-color: #000a3a;
            border-color:#1b8fd9;
        }

        body {
            font-family: "Space Grotesk", "Noto Sans", sans-serif;
            background-color: #ffffff; /* bg-gray-50 */
        }
        .header-border {
            border-bottom: 1px solid #000a3a;
        }
        .text-dark-gray {
            color: #101418;
        }
        .bg-light-gray {
            background-color: #ffffff;
        }
        .custom-container {
            max-width: 960px;
            margin: 0 auto;
        }
        .custom-padding-x {
            padding-left: 40px;
            padding-right: 40px;
        }
        .form-control, .form-select, .btn-primary, .btn-outline-secondary {
            border-radius: 0.75rem;
        }
        .btn-primary {
            background-color: #3f7fbf;
            border: none;
        }
        .alert {
            border-radius: 0.75rem;
        }
    </style>
</head>
<body>
<div class="d-flex flex-column min-vh-100">
    <!-- Header -->
    <header class="header-border px-4 py-3">
        <div class="custom-container d-flex align-items-center justify-content-between">
            <div class="d-flex align-items-center gap-3">
                <div style="width: 24px; height: 24px;">
                    <svg viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" clip-rule="evenodd"
                              d="M12.0799 24L4 19.2479L9.95537 8.75216L18.04 13.4961L18.0446 4H29.9554L29.96 13.4961L38.0446 8.75216L44 19.2479L35.92 24L44 28.7521L38.0446 39.2479L29.96 34.5039L29.9554 44H18.0446L18.04 34.5039L9.95537 39.2479L4 28.7521L12.0799 24Z"
                              fill="currentColor"></path>
                    </svg>
                </div>
                <h2 class="fs-5 fw-bold mb-0">DriveLK</h2>
            </div>
            <div class="d-flex gap-4">
                <a href="/vehicle_list" class="text-primary text-decoration-none">Our Vehicles</a>
                <a href="#" class="text-primary text-decoration-none">About Us</a>
                <a href="#" class="text-primary text-decoration-none">Drivers</a>
                <a href="#" class="text-primary text-decoration-none">Contact</a>
            </div>
            <div class="dropdown">
                <button class="btn btn-primary btn-sm dropdown-toggle" type="button" id="authDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                    Login
                </button>
                <ul class="dropdown-menu dropdown-menu-end p-3" style="width: 300px;">
                    <li>
                        <h5 class="dropdown-header">Sign In</h5>
                    </li>
                    <li>
                        <form class="px-2 py-3">
                            <div class="mb-3">
                                <label for="loginEmail" class="form-label">Email</label>
                                <input type="email" class="form-control" id="loginEmail" placeholder="Your Email">
                            </div>
                            <div class="mb-3">
                                <label for="loginPassword" class="form-label">Password</label>
                                <input type="password" class="form-control" id="loginPassword" placeholder="Your Password">
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Sign in</button>
                        </form>
                    </li>
                    <li><hr class="dropdown-divider"></li>
                    <li>
                        <div class="text-center">
                            <p class="mb-0">Don't have an account? <a href="#" id="showRegister">Register</a></p>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <div class="custom-container custom-padding-x py-5">
        <h2 class="fs-2 fw-bold mb-5">Add New Vehicle</h2>
        <div class="card border-0 shadow-sm">
            <div class="card-body">
                <c:if test="${not empty errorMessage}">
                    <div class="alert alert-danger" role="alert">
                            ${errorMessage}
                    </div>
                </c:if>
                <form:form modelAttribute="vehicle" action="/vehicle_add" method="post" enctype="multipart/form-data">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label text-dark-gray">Brand</label>
                            <form:input path="brand" class="form-control" required="true"/>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label text-dark-gray">Model</label>
                            <form:input path="model" class="form-control" required="true"/>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label text-dark-gray">Type</label>
                            <form:select path="type" class="form-select">
                                <form:option value="Sedan">Sedan</form:option>
                                <form:option value="SUV">SUV</form:option>
                                <form:option value="Truck">Truck</form:option>
                                <form:option value="Van">Van</form:option>
                            </form:select>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label text-dark-gray">Year</label>
                            <form:input path="year" type="number" class="form-control" required="true"/>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label text-dark-gray">Mileage (km)</label>
                            <form:input path="mileage" type="number" class="form-control" required="true"/>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label text-dark-gray">Pricing (per day LKR)</label>
                            <form:input path="pricing" type="number" class="form-control" required="true"/>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label text-dark-gray">Fuel Type</label>
                            <form:select path="fuelType" class="form-select">
                                <form:option value="Petrol">Petrol</form:option>
                                <form:option value="Diesel">Diesel</form:option>
                                <form:option value="Electric">Electric</form:option>
                                <form:option value="Hybrid">Hybrid</form:option>
                            </form:select>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label text-dark-gray">Seating Capacity</label>
                            <form:input path="seatingCapacity" type="number" class="form-control" required="true"/>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label text-dark-gray">Image</label>
                            <input type="file" name="imageFile" class="form-control" accept="image/*"/>
                        </div>
                        <div class="col-12">
                            <label class="form-label text-dark-gray">Description</label>
                            <form:textarea path="description" class="form-control" rows="4"/>
                        </div>
                        <div class="col-12">
                            <label class="form-label text-dark-gray">Features</label>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="features" value="Air Conditioning" id="feature1" ${selectedFeatures != null && selectedFeatures.contains('Air Conditioning') ? 'checked' : ''}>
                                <label class="form-check-label" for="feature1">Air Conditioning</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="features" value="GPS Navigation" id="feature2" ${selectedFeatures != null && selectedFeatures.contains('GPS Navigation') ? 'checked' : ''}>
                                <label class="form-check-label" for="feature2">GPS Navigation</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="features" value="Bluetooth" id="feature3" ${selectedFeatures != null && selectedFeatures.contains('Bluetooth') ? 'checked' : ''}>
                                <label class="form-check-label" for="feature3">Bluetooth</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="features" value="Sunroof" id="feature4" ${selectedFeatures != null && selectedFeatures.contains('Sunroof') ? 'checked' : ''}>
                                <label class="form-check-label" for="feature4">Sunroof</label>
                            </div>
                        </div>
                        <div class="col-12 d-flex gap-2">
                            <button type="submit" class="btn btn-primary">Add Vehicle</button>
                            <a href="/vehicle_list" class="btn btn-outline-secondary">Cancel</a>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="bg-dark text-white text-center py-4">
        <div class="custom-container">
            <div class="d-flex justify-content-center gap-3 mb-3">
                <a href="#" class="text-white text-decoration-none">About Us</a>
                <a href="#" class="text-white text-decoration-none">Contact</a>
                <a href="#" class="text-white text-decoration-none">Terms of Service</a>
                <a href="#" class="text-white text-decoration-none">Privacy Policy</a>
            </div>
            <p class="mb-0">© 2025 Drive LK. All rights reserved.</p>
        </div>
    </footer>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>