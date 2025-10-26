<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%-- Define all navigation URLs for consistency --%>
<spring:url value="/admin/dashboard" var="dashboardUrl"/>
<spring:url value="/admin/list" var="adminListUrl"/>
<spring:url value="/driver/list" var="driverListUrl"/>
<spring:url value="/vehicle/list" var="vehicleListUrl"/>
<spring:url value="/rental/list" var="rentalListUrl"/>
<spring:url value="/payment/admin/payments" var="financeListUrl"/>
<spring:url value="/support/admin/tickets" var="customerListUrl"/>

<style>
    .sidebar { width: 250px; background: #2c3e50; color: white; height: 100vh; position: fixed; }
    .sidebar .logo { padding: 20px; text-align: center; background: #34495e; }
    .sidebar .logo h1 { margin: 0; font-size: 24px; }
    .sidebar nav ul { list-style: none; padding: 0; margin: 0; }
    .sidebar nav li a {
        display: block;
        padding: 15px 20px;
        color: #ecf0f1;
        text-decoration: none;
        transition: background 0.3s;
        border-left: 3px solid transparent;
    }
    .sidebar nav li a:hover { background: #34495e; }
    .sidebar nav li a.active {
        background: #1abc9c;
        border-left-color: #16a085;
        font-weight: bold;
    }
    .main-content { margin-left: 250px; }
</style>

<aside class="sidebar">
    <div class="logo">
        <h1>DriveLK Admin</h1>
    </div>
    <nav>
        <ul>
            <li><a href="${dashboardUrl}" class="${pageContext.request.requestURI.endsWith('/admin/dashboard') ? 'active' : ''}">Dashboard</a></li>
            <li><a href="${adminListUrl}" class="${pageContext.request.requestURI.contains('/admin/list') ? 'active' : ''}">Manage Admins</a></li>
            <li><a href="${driverListUrl}" class="${pageContext.request.requestURI.contains('/driver/') ? 'active' : ''}">Manage Drivers</a></li>
            <li><a href="${vehicleListUrl}" class="${pageContext.request.requestURI.contains('/vehicle/') ? 'active' : ''}">Manage Vehicles</a></li>
            <li><a href="${rentalListUrl}" class="${pageContext.request.requestURI.contains('/rental/list') ? 'active' : ''}">Manage Rentals</a></li>
            <li><a href="${financeListUrl}" class="${pageContext.request.requestURI.contains('/payment/admin') ? 'active' : ''}">Manage Finances</a></li>
            <li><a href="${customerListUrl}" class="${pageContext.request.requestURI.contains('/support/admin') ? 'active' : ''}">Customer Tickets</a></li>
        </ul>
    </nav>
</aside>