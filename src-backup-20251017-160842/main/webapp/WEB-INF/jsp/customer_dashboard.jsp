<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DriveLK - Customer Dashboard</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        /* --- Header Styles --- */
        .header {
            background: linear-gradient(135deg, #0891b2 0%, #0e7490 100%);
            color: white;
            padding: 1rem 0;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .nav-container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 2rem;
        }
        .logo {
            font-size: 2rem;
            font-weight: bold;
            color: white;
            text-decoration: none;
        }
        .nav-links a {
            color: white;
            text-decoration: none;
            font-weight: 500;
            margin-left: 2rem;
            transition: 0.3s;
        }
        .nav-links a:hover {
            opacity: 0.8;
        }
        .btn-logout {
            background-color: #f97316; /* orange */
            color: white;
            border-radius: 8px;
            padding: 0.5rem 1rem;
            font-weight: 500;
            transition: 0.3s;
        }
        .btn-logout:hover {
            background-color: #ea580c;
            color: white;
        }

        /* --- Body Styles --- */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #ffffff;
            padding-top: 90px; /* space for fixed header */
        }

        /* --- Filters & Vehicles Styles --- */
        .custom-container {
            max-width: 960px;
            margin: 0 auto;
            padding: 2rem 1rem;
        }
        .filters {
            background-color: white;
            border-radius: 0.75rem;
            padding: 1rem;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }
        .vehicle-card img {
            aspect-ratio: 16 / 9;
            object-fit: cover;
            border-radius: 0.75rem;
        }
        .add-button {
            background-color: #0891b2;
            color: #fff;
            border-radius: 9999px;
            padding: 0.5rem 1.5rem;
            font-weight: bold;
        }
        .btn-outline-primary, .btn-outline-secondary, .btn-outline-danger, .btn-outline-warning, .btn-outline-success {
            border-radius: 1.5rem;
        }

        /* Footer Styles */
        .footer {
            background: #0891b2;
            color: white;
            padding: 3rem 0 1rem;
        }

        .footer-content {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 2rem;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
            margin-bottom: 2rem;
        }

        .footer-section h3 {
            font-size: 1.25rem;
            font-weight: bold;
            margin-bottom: 1rem;
        }

        .footer-section ul {
            list-style: none;
        }

        .footer-section ul li {
            margin-bottom: 0.5rem;
        }

        .footer-section ul li a {
            color: white;
            text-decoration: none;
            opacity: 0.8;
            transition: opacity 0.3s ease;
        }

        .footer-section ul li a:hover {
            opacity: 1;
        }

        .footer-bottom {
            border-top: 1px solid rgba(255,255,255,0.2);
            padding-top: 1rem;
            text-align: center;
            opacity: 0.8;
        }
    </style>
</head>
<body>

<!-- Header -->
<header class="header">
    <nav class="nav-container">
        <a href="/" class="logo">DriveLK</a>
        <div class="nav-links d-flex align-items-center gap-3">
            <a href="/vehicle_list">Our Vehicles</a>
            <a href="#about">About Us</a>
            <a href="#">Drivers</a>
            <a href="#">Contact</a>
            <a href="/logout" class="btn-logout">Logout</a>
        </div>
    </nav>
</header>

<!-- Main Content -->
<div class="custom-container custom-padding-x py-5">
    <!-- Filters Section -->
    <div class="filters mb-4">
        <div class="row g-3">
            <div class="col-md-4">
                <label class="form-label">Sort By</label>
                <select class="form-select" name="sortBy" onchange="applyFilters()">
                    <option value="none" ${sortBy == 'none' ? 'selected' : ''}>None</option>
                    <option value="type" ${sortBy == 'type' ? 'selected' : ''}>Type then Model</option>
                    <option value="model" ${sortBy == 'model' ? 'selected' : ''}>Model</option>
                </select>
            </div>
            <div class="col-md-4">
                <label class="form-label">Status Filter</label>
                <select class="form-select" name="statusFilter" onchange="applyFilters()">
                    <option value="all" ${statusFilter == 'all' ? 'selected' : ''}>All</option>
                    <option value="Rented" ${statusFilter == 'Rented' ? 'selected' : ''}>Rented</option>
                    <option value="Available" ${statusFilter == 'Available' ? 'selected' : ''}>Not Rented</option>
                    <option value="Under Maintenance" ${statusFilter == 'Under Maintenance' ? 'selected' : ''}>Under Maintenance</option>
                    <option value="Pending Deletion" ${statusFilter == 'Pending Deletion' ? 'selected' : ''}>Pending Deletion</option>
                </select>
            </div>
            <div class="col-md-4 d-flex align-items-end">
                <button class="btn btn-outline-secondary" onclick="applyFilters()">Apply Filters</button>
            </div>
        </div>
    </div>

    <div class="d-flex justify-content-between align-items-center mb-5">
        <h2 class="fs-2 fw-bold">Vehicles</h2>
    </div>

    <div class="row">
        <c:forEach var="vehicle" items="${vehicles}">
            <div class="col-md-4 mb-4">
                <div class="vehicle-card card border-0 shadow-sm">
                    <img src="${vehicle.imageBase64}" class="card-img-top" alt="${vehicle.brand} ${vehicle.model}">
                    <div class="card-body">
                        <h5 class="card-title text-dark-gray">${vehicle.brand} ${vehicle.model}</h5>
                        <p class="card-text text-muted-gray">Vehicle ID: ${vehicle.id}</p>
                        <p class="card-text text-muted-gray">Year: ${vehicle.year}</p>
                        <p class="card-text text-muted-gray">Type: ${vehicle.type}</p>
                        <p class="card-text text-muted-gray">Status: ${vehicle.status}</p>
                        <p class="card-text text-muted-gray">Pricing(LKR): ${vehicle.pricing}</p>
                        <div class="d-flex gap-2 flex-wrap">
                            <a href="/vehicle_details/${vehicle.id}" class="btn btn-outline-primary btn-sm">Details</a>
                            <c:if test="${vehicle.status == 'Available'}">
                                <a href="/vehicle_rent/${vehicle.id}" class="btn btn-outline-success btn-sm">Rent Now</a>
                            </c:if>
                        </div>

                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <!-- Pagination -->
    <nav aria-label="Page navigation">
        <ul class="pagination justify-content-center">
            <li class="page-item disabled">
                <a class="page-link pagination-circle" href="#" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <li class="page-item active"><a class="page-link pagination-circle" href="#">1</a></li>
            <li class="page-item"><a class="page-link pagination-circle" href="#">2</a></li>
            <li class="page-item"><a class="page-link pagination-circle" href="#">3</a></li>
            <li class="page-item">
                <a class="page-link pagination-circle" href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>
</div>

<!-- Footer -->
<footer class="footer">
    <div class="container footer-content">
        <div class="footer-section">
            <h3>DriveLK</h3>
            <p>Your trusted partner for vehicle rentals in Sri Lanka. Explore the island with confidence and comfort.</p>
        </div>
        <div class="footer-section">
            <h3>Quick Links</h3>
            <ul>
                <li><a href="/vehicle_list">Our Vehicles</a></li>
                <li><a href="#about">About Us</a></li>
                <li><a href="#">Drivers</a></li>
                <li><a href="#">Contact</a></li>
            </ul>
        </div>
        <div class="footer-section">
            <h3>Services</h3>
            <ul>
                <li><a href="#">Car Rental</a></li>
                <li><a href="#">SUV Rental</a></li>
                <li><a href="#">Luxury Cars</a></li>
                <li><a href="#">Long-term Rental</a></li>
            </ul>
        </div>
        <div class="footer-section">
            <h3>Contact Info</h3>
            <ul>
                <li>📞 +94 11 234 5678</li>
                <li>✉ info@drivelk.com</li>
                <li>📍 Colombo, Sri Lanka</li>
                <li>🕒 24/7 Support</li>
            </ul>
        </div>
    </div>
    <div class="footer-bottom">
        <p>&copy; 2025 DriveLK. All rights reserved.</p>
    </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<script>
    function applyFilters() {
        const sortBy = document.querySelector('select[name="sortBy"]').value;
        const statusFilter = document.querySelector('select[name="statusFilter"]').value;
        const url = new URL(window.location);
        url.searchParams.set('sortBy', sortBy);
        url.searchParams.set('statusFilter', statusFilter);
        window.location = url;
    }
</script>

</body>
</html>