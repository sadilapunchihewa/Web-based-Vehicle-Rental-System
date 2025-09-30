<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DriveLK - Premium Vehicle Rental in Sri Lanka</title>

    <style>
        /* Global Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: #4b5563;
            background-color: #ffffff;
        }

        /* Header Styles */
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

        .sign-in-btn {
            background: #f97316;
            color: white;
            padding: 0.75rem 1.5rem;
            border: none;
            border-radius: 0.5rem;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .sign-in-btn:hover {
            background: #ea580c;
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(249, 115, 22, 0.3);
        }

        /* Hero Section Styles */
        .hero {
            background: linear-gradient(rgba(8, 145, 178, 0.29), rgba(14, 116, 144, 0.6)), url('images/front11.jpg') no-repeat center center/cover;
            background-size: cover;
            background-position: center;
            height: 100vh;
            display: flex;
            align-items: flex-start;
            justify-content: center;
            padding-top: 50px;
            text-align: center;
            color: white;
            margin-top: 70px;
        }

        .hero-content {
            max-width: 800px;
            padding: 0 2rem;
        }

        .hero h1 {
            font-size: 3.5rem;
            font-weight: bold;
            margin-bottom: 1rem;
            margin: 0.5rem 0 1rem 0;
            opacity: 1;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.8);
        }

        .hero p {
            font-size: 1.5rem;
            margin-bottom: 2rem;
            line-height: 1.8;
            opacity: 0.95;
            color: #ffffff;
            text-shadow: 2px 2px 3px rgba(0,0,0,3.0);
            font-weight: 470;
            display: inline-block;
        }

        .cta-buttons {
            display: flex;
            gap: 1rem;
            justify-content: center;
            flex-wrap: wrap;
        }

        .btn-primary {
            background: #f97316;
            color: white;
            padding: 1rem 2rem;
            border: none;
            border-radius: 0.5rem;
            font-size: 1.1rem;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .btn-primary:hover {
            background: #ea580c;
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(249, 115, 22, 0.4);
        }

        .btn-secondary {
            background: transparent;
            color: white;
            padding: 1rem 2rem;
            border: 2px solid white;
            border-radius: 0.5rem;
            font-size: 1.1rem;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .btn-secondary:hover {
            background: white;
            color: #0891b2;
            transform: translateY(-3px);
        }

        /* Features Section Styles */
        .features {
            padding: 4rem 0;
            background: #f9fafb;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 2rem;
        }

        .section-title {
            text-align: center;
            font-size: 2.5rem;
            font-weight: bold;
            color: #0891b2;
            margin-bottom: 3rem;
        }

        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
        }

        .feature-card {
            background: white;
            padding: 2rem;
            border-radius: 1rem;
            text-align: center;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
        }

        .feature-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
        }

        .feature-icon {
            width: 80px;
            height: 80px;
            background: linear-gradient(135deg, #0891b2, #0e7490);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1rem;
            font-size: 2rem;
            color: white;
        }

        .feature-card h3 {
            font-size: 1.5rem;
            font-weight: bold;
            color: #0891b2;
            margin-bottom: 1rem;
        }

        /* Vehicles Section Styles */
        .vehicles {
            padding: 4rem 0;
            background: white;
        }

        .vehicles-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 2rem;
            margin-top: 2rem;
        }

        .vehicle-card {
            background: white;
            border-radius: 1rem;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
        }

        .vehicle-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
        }

        .vehicle-image {
            height: 200px;
            background-size: cover;
            background-position: center;
            position: relative;
        }

        .vehicle-image::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.2);
        }

        .vehicle-info {
            padding: 1.5rem;
        }

        .vehicle-info h3 {
            font-size: 1.25rem;
            font-weight: bold;
            color: #0891b2;
            margin-bottom: 0.5rem;
        }

        .vehicle-price {
            font-size: 1.5rem;
            font-weight: bold;
            color: #f97316;
            margin: 1rem 0;
        }

        /* About Section Styles */
        .about {
            padding: 4rem 0;
            background: #f9fafb;
        }

        .about-content {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 3rem;
            align-items: center;
        }

        .about-text h2 {
            font-size: 2.5rem;
            font-weight: bold;
            color: #0891b2;
            margin-bottom: 1.5rem;
        }

        .about-text p {
            font-size: 1.1rem;
            margin-bottom: 1.5rem;
            line-height: 1.8;
        }

        .about-image {
            height: 400px;
            background: url('images/e.jpg') no-repeat center center/cover;
            border-radius: 1rem;
            position: relative;
        }

        .about-image::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.3);
            border-radius: 1rem;
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

        /* Responsive Design */
        @media (max-width: 768px) {
            .hero h1 { font-size: 2.5rem; }
            .nav-container { padding: 0 1rem; }
            .about-content { grid-template-columns: 1fr; }
            .cta-buttons { flex-direction: column; align-items: center; }
        }

        /* Animations */
        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .fade-in-up {
            animation: fadeInUp 0.8s ease-out;
        }

        html {
            scroll-behavior: smooth;
        }
    </style>
</head>
<body>
<!-- Header Section -->
<header class="header">
    <nav class="nav-container">
        <a href="#" class="logo">DriveLK</a>
        <a href="/login" class="sign-in-btn">Sign In</a>
    </nav>
</header>

<!-- Hero Section -->
<section class="hero">
    <div class="hero-content fade-in-up">
        <h1>Rent Your <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            Ideal Vehicle...</h1><br><br>
        <p>Explore our vast collection of cars, bikes, and more.<br>
            Find your perfect ride for any journey.<br>
            Book now & hit the road with ease.</p><br><br>
        <div class="cta-buttons">
            <a href="/login" class="btn-primary">Book Now</a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="#about" class="btn-secondary">Learn More</a>
        </div>
    </div>
</section>

<!-- Features Section -->
<section class="features" id="features">
    <div class="container">
        <h2 class="section-title">Why Choose DriveLK?</h2>
        <div class="features-grid">
            <div class="feature-card">
                <div class="feature-icon">🚗</div>
                <h3>Premium Fleet</h3>
                <p>Choose from our extensive collection of well-maintained, modern vehicles ranging from compact cars to luxury SUVs.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">💰</div>
                <h3>Best Prices</h3>
                <p>Competitive rates with no hidden fees. Get the best value for your money with our transparent pricing.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">🛡️</div>
                <h3>Full Insurance</h3>
                <p>Drive with confidence knowing you're fully covered with our comprehensive insurance packages.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">📞</div>
                <h3>24/7 Support</h3>
                <p>Round-the-clock customer support and roadside assistance to ensure your journey is worry-free.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">📱</div>
                <h3>Easy Booking</h3>
                <p>Simple online booking process. Reserve your vehicle in just a few clicks and get instant confirmation.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">⚡</div>
                <h3>Fast Pick-Up & Drop-Off</h3>
                <p>Save time with our efficient pick-up and drop-off process at multiple convenient locations.</p>
            </div>
        </div>
    </div>
</section>

<!-- Vehicles Section -->
<section class="vehicles" id="vehicles">
    <div class="container">
        <h2 class="section-title">Our Premium Fleet</h2>
        <div class="vehicles-grid">

            <!-- Compact Car -->
            <div class="vehicle-card">
                <div class="vehicle-image" style="background-image: url('images/cc.jpg');"></div>
                <div class="vehicle-info">
                    <h3>Compact Car</h3>
                    <p>Perfect for city driving</p>
                    <div class="vehicle-price">From Rs. 3,500/day</div>
                </div>
            </div>

            <!-- SUV -->
            <div class="vehicle-card">
                <div class="vehicle-image" style="background-image: url('images/suuv.png');"></div>
                <div class="vehicle-info">
                    <h3>SUV</h3>
                    <p>Ideal for adventures</p>
                    <div class="vehicle-price">From Rs. 7,500/day</div>
                </div>
            </div>

            <!-- Luxury Car -->
            <div class="vehicle-card">
                <div class="vehicle-image" style="background-image: url('images/lcar.jpg');"></div>
                <div class="vehicle-info">
                    <h3>Luxury Car</h3>
                    <p>Elegance on wheels</p>
                    <div class="vehicle-price">From Rs. 15,000/day</div>
                </div>
            </div>

            <!-- Van -->
            <div class="vehicle-card">
                <div class="vehicle-image" style="background-image: url('images/vn.jpg');"></div>
                <div class="vehicle-info">
                    <h3>Van</h3>
                    <p>Great for groups</p>
                    <div class="vehicle-price">From Rs. 9,000/day</div>
                </div>
            </div>

            <!-- Three Wheeler -->
            <div class="vehicle-card">
                <div class="vehicle-image" style="background-image: url('images/th.jpg');"></div>
                <div class="vehicle-info">
                    <h3>Three Wheeler</h3>
                    <p>Local transport experience</p>
                    <div class="vehicle-price">From Rs. 2,000/day</div>
                </div>
            </div>

            <!-- Motorcycle -->
            <div class="vehicle-card">
                <div class="vehicle-image" style="background-image: url('images/bk.jpg');"></div>
                <div class="vehicle-info">
                    <h3>Motorcycle</h3>
                    <p>For thrilling rides</p>
                    <div class="vehicle-price">From Rs. 1,500/day</div>
                </div>
            </div>

        </div>
        <div style="text-align: center; margin-top: 2rem;">
            <a href="/login" class="btn-primary">View Full Fleet</a>
        </div>
    </div>
</section>

<!-- About Section -->
<section class="about" id="about">
    <div class="container">
        <div class="about-content">
            <div class="about-text">
                <h2>About DriveLK</h2>
                <p>DriveLK is Sri Lanka's premier vehicle rental service, dedicated to providing exceptional transportation solutions for both locals and tourists. With over a decade of experience in the industry, we understand the unique needs of travelers exploring the beautiful island of Sri Lanka.</p>
                <p>Our mission is to make your journey comfortable, safe, and memorable. We maintain a modern fleet of vehicles that undergo regular maintenance and safety checks, ensuring you have a reliable companion for your adventures.</p>
                <p>Whether you're planning a family vacation, a business trip, or an adventurous exploration of Sri Lanka's stunning landscapes, DriveLK has the perfect vehicle to match your needs and budget.</p>
            </div>
            <div class="about-image"></div>
        </div>
    </div>
</section>

<!-- Footer Section -->
<footer class="footer">
    <div class="container footer-content">
        <div class="footer-section">
            <h3>DriveLK</h3>
            <p>Your trusted partner for vehicle rentals in Sri Lanka. Explore the island with confidence and comfort.</p>
        </div>
        <div class="footer-section">
            <h3>Quick Links</h3>
            <ul>
                <li>Our Fleet</li>
                <li>Services</li>
                <li><a href="#about">About Us</a></li>
                <li>Contact</li>
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
                <li>✉️ info@drivelk.com</li>
                <li>📍 Colombo, Sri Lanka</li>
                <li>🕒 24/7 Support</li>
            </ul>
        </div>
    </div>
    <div class="footer-bottom">
        <p>&copy; 2025 DriveLK. All rights reserved. | <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a></p>
    </div>
</footer>

<script>
    // Smooth scrolling for navigation links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) target.scrollIntoView({ behavior: 'smooth', block: 'start' });
        });
    });

    // Add scroll effect to header
    window.addEventListener('scroll', function() {
        const header = document.querySelector('.header');
        if (window.scrollY > 100) {
            header.style.background = 'rgba(8, 145, 178, 0.95)';
            header.style.backdropFilter = 'blur(10px)';
        } else {
            header.style.background = 'linear-gradient(135deg, #0891b2 0%, #0e7490 100%)';
            header.style.backdropFilter = 'none';
        }
    });

    // Animate on scroll
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.style.opacity = '1';
                entry.target.style.transform = 'translateY(0)';
            }
        });
    }, { threshold: 0.1, rootMargin: '0px 0px -50px 0px' });

    document.querySelectorAll('.feature-card, .vehicle-card, .about-text').forEach(el => {
        el.style.opacity = '0';
        el.style.transform = 'translateY(30px)';
        el.style.transition = 'all 0.6s ease-out';
        observer.observe(el);
    });

    // Page fade-in
    window.addEventListener('load', () => { document.body.style.opacity = '1'; });
    document.body.style.opacity = '0';
    document.body.style.transition = 'opacity 0.5s ease-in';
</script>
</body>
</html>