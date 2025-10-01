<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Drive LK</title>
    <link rel="icon" type="image/x-icon" href="data:image/x-icon;base64," />
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;500;700;900&family=Space+Grotesk:wght@400;500;700&display=swap" rel="stylesheet">
    <style>

        :root{
            --header-bg: #2f81cd;   /* header background */
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
        w
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
        .text-muted-gray {
            color: #5c738a;
        }
        .bg-light-gray {
            background-color: #ffffff;
        }
        .custom-container {
            max-width: 960px;
            margin: 0 auto;
        }
        .vehicle-card img {
            aspect-ratio: 16 / 9;
            object-fit: cover;
            border-radius: 0.75rem;
        }
        .pagination-circle {
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
        }
        .add-button {
            background-color: #000a3a;
            color: #fff;
            border-radius: 9999px;
            padding: 0.5rem 1.5rem;
            font-weight: bold;
        }
        .btn-outline-primary, .btn-outline-secondary, .btn-outline-danger, .btn-outline-warning, .btn-outline-success {
            border-radius: 1.5rem;
        }
        .custom-padding-x {
            padding-left: 40px;
            padding-right: 40px;
        }
        .filters {
            background-color: white;
            border-radius: 0.75rem;
            padding: 1rem;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
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
            <div class="d-flex align-items-center gap-4">
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
        </div>
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
            <a href="/vehicle_add" class="add-button">Add Vehicle</a>
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
                            <p class="card-text text-muted-gray">Pricing($): ${vehicle.pricing}</p>
                            <div class="d-flex gap-2 flex-wrap">
                                <a href="/vehicle_details/${vehicle.id}" class="btn btn-outline-primary btn-sm">Details</a>
                                <a href="/vehicle_edit/${vehicle.id}" class="btn btn-outline-secondary btn-sm">Edit</a>
                                <c:if test="${vehicle.status == 'Available'}">
                                    <a href="/vehicle_rent/${vehicle.id}" class="btn btn-outline-success btn-sm">Rent Now</a>
                                </c:if>
                                <c:if test="${vehicle.status != 'Pending Deletion'}">
                                    <a href="/vehicle_delete/${vehicle.id}" class="btn btn-outline-danger btn-sm">Request Delete</a>
                                </c:if>
                                <c:if test="${vehicle.status == 'Pending Deletion'}">
                                    <a href="/vehicle_confirm_delete/${vehicle.id}" class="btn btn-outline-warning btn-sm">Confirm Delete (Admin)</a>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <!-- Pagination (Placeholder, as per original design) -->
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