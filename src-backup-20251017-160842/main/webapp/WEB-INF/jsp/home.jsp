<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // If ?format=json is provided, emit the JSON and stop rendering the HTML.
    if ("json".equalsIgnoreCase(request.getParameter("format"))) {
        response.setContentType("application/json; charset=UTF-8");
%>{
"name": "my-v0-project",
"version": "0.1.0",
"private": true,
"scripts": {
"dev": "next dev",
"build": "next build",
"start": "next start",
"lint": "next lint"
},
"dependencies": {
"@hookform/resolvers": "^3.10.0",
"@radix-ui/react-accordion": "1.2.2",
"@radix-ui/react-alert-dialog": "1.1.4",
"@radix-ui/react-aspect-ratio": "1.1.1",
"@radix-ui/react-avatar": "1.1.2",
"@radix-ui/react-checkbox": "1.1.3",
"@radix-ui/react-collapsible": "1.1.2",
"@radix-ui/react-context-menu": "2.2.4",
"@radix-ui/react-dialog": "1.1.4",
"@radix-ui/react-dropdown-menu": "2.1.4",
"@radix-ui/react-hover-card": "1.1.4",
"@radix-ui/react-label": "2.1.1",
"@radix-ui/react-menubar": "1.1.4",
"@radix-ui/react-navigation-menu": "1.2.3",
"@radix-ui/react-popover": "1.1.4",
"@radix-ui/react-progress": "1.1.1",
"@radix-ui/react-radio-group": "1.2.2",
"@radix-ui/react-scroll-area": "1.2.2",
"@radix-ui/react-select": "2.1.4",
"@radix-ui/react-separator": "1.1.1",
"@radix-ui/react-slider": "1.2.2",
"@radix-ui/react-slot": "1.1.1",
"@radix-ui/react-switch": "1.1.2",
"@radix-ui/react-tabs": "1.1.2",
"@radix-ui/react-toast": "1.2.4",
"@radix-ui/react-toggle": "1.1.1",
"@radix-ui/react-toggle-group": "1.1.1",
"@vercel/analytics": "1.3.1",
"autoprefixer": "^10.4.20",
"class-variance-authority": "^0.7.1",
"clsx": "^2.1.1",
"cmdk": "1.0.4",
"date-fns": "4.1.0",
"embla-carousel-react": "8.5.1",
"geist": "^1.3.1",
"input-otp": "1.4.1",
"lucide-react": "^0.454.0",
"next": "14.2.25",
"next-themes": "^0.4.6",
"react": "^19",
"react-day-picker": "9.8.0",
"react-dom": "^19",
"react-hook-form": "^7.60.0",
"react-resizable-panels": "^2.1.7",
"recharts": "2.15.4",
"sonner": "^1.7.4",
"tailwind-merge": "^3.3.1",
"tailwindcss-animate": "^1.0.7",
"vaul": "^0.9.9",
"zod": "3.25.67"
},
"devDependencies": {
"@tailwindcss/postcss": "^4.1.9",
"@types/node": "^22",
"@types/react": "^18",
"@types/react-dom": "^18",
"postcss": "^8.5",
"tailwindcss": "^4.1.9",
"tw-animate-css": "1.3.3",
"typescript": "^5"
}
}
<%
        return; // stop further JSP processing after writing JSON
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DriveLK - Premium Vehicle Rental in Sri Lanka</title>

    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; line-height: 1.6; color: #4b5563; background-color: #ffffff; }
        .header { background: linear-gradient(135deg, #0891b2 0%, #0e7490 100%); color: white; padding: 1rem 0; position: fixed; width: 100%; top: 0; z-index: 1000; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        .nav-container { max-width: 1200px; margin: 0 auto; display: flex; justify-content: space-between; align-items: center; padding: 0 2rem; }
        .logo { font-size: 2rem; font-weight: bold; color: white; text-decoration: none; }
        .sign-in-btn { background: #f97316; color: white; padding: 0.75rem 1.5rem; border: none; border-radius: 0.5rem; text-decoration: none; font-weight: 600; transition: all 0.3s ease; cursor: pointer; }
        .sign-in-btn:hover { background: #ea580c; transform: translateY(-2px); box-shadow: 0 4px 15px rgba(249, 115, 22, 0.3); }
        .hero { background: linear-gradient(rgba(8, 145, 178, 0.8), rgba(14, 116, 144, 0.8)),
        url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 600"><rect fill="%23f0f9ff" width="1200" height="600"/><path fill="%230891b2" opacity="0.1" d="M0,300 Q300,200 600,300 T1200,300 L1200,600 L0,600 Z"/></svg>');
            background-size: cover; background-position: center; height: 100vh; display: flex; align-items: center; justify-content: center; text-align: center; color: white; margin-top: 80px; }
        .hero-content { max-width: 800px; padding: 0 2rem; }
        .hero h1 { font-size: 3.5rem; font-weight: bold; margin-bottom: 1rem; text-shadow: 2px 2px 4px rgba(0,0,0,0.3); }
        .hero p { font-size: 1.25rem; margin-bottom: 2rem; opacity: 0.95; }
        .cta-buttons { display: flex; gap: 1rem; justify-content: center; flex-wrap: wrap; }
        .btn-primary { background: #f97316; color: white; padding: 1rem 2rem; border: none; border-radius: 0.5rem; font-size: 1.1rem; font-weight: 600; text-decoration: none; transition: all 0.3s ease; cursor: pointer; }
        .btn-primary:hover { background: #ea580c; transform: translateY(-3px); box-shadow: 0 6px 20px rgba(249, 115, 22, 0.4); }
        .btn-secondary { background: transparent; color: white; padding: 1rem 2rem; border: 2px solid white; border-radius: 0.5rem; font-size: 1.1rem; font-weight: 600; text-decoration: none; transition: all 0.3s ease; cursor: pointer; }
        .btn-secondary:hover { background: white; color: #0891b2; transform: translateY(-3px); }
        .features { padding: 5rem 0; background: #f9fafb; }
        .container { max-width: 1200px; margin: 0 auto; padding: 0 2rem; }
        .section-title { text-align: center; font-size: 2.5rem; font-weight: bold; color: #0891b2; margin-bottom: 3rem; }
        .features-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 2rem; }
        .feature-card { background: white; padding: 2rem; border-radius: 1rem; text-align: center; box-shadow: 0 4px 15px rgba(0,0,0,0.1); transition: all 0.3s ease; }
        .feature-card:hover { transform: translateY(-5px); box-shadow: 0 8px 25px rgba(0,0,0,0.15); }
        .feature-icon { width: 80px; height: 80px; background: linear-gradient(135deg, #0891b2, #0e7490); border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: 0 auto 1rem; font-size: 2rem; color: white; }
        .feature-card h3 { font-size: 1.5rem; font-weight: bold; color: #0891b2; margin-bottom: 1rem; }
        .vehicles { padding: 5rem 0; background: white; }
        .vehicles-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 2rem; margin-top: 3rem; }
        .vehicle-card { background: white; border-radius: 1rem; overflow: hidden; box-shadow: 0 4px 15px rgba(0,0,0,0.1); transition: all 0.3s ease; }
        .vehicle-card:hover { transform: translateY(-5px); box-shadow: 0 8px 25px rgba(0,0,0,0.15); }
        .vehicle-image { height: 200px; background: linear-gradient(45deg, #0891b2, #f97316); display: flex; align-items: center; justify-content: center; color: white; font-size: 3rem; }
        .vehicle-info { padding: 1.5rem; }
        .vehicle-info h3 { font-size: 1.25rem; font-weight: bold; color: #0891b2; margin-bottom: 0.5rem; }
        .vehicle-price { font-size: 1.5rem; font-weight: bold; color: #f97316; margin: 1rem 0; }
        .about { padding: 5rem 0; background: #f9fafb; }
        .about-content { display: grid; grid-template-columns: 1fr 1fr; gap: 3rem; align-items: center; }
        .about-text h2 { font-size: 2.5rem; font-weight: bold; color: #0891b2; margin-bottom: 1.5rem; }
        .about-text p { font-size: 1.1rem; margin-bottom: 1.5rem; line-height: 1.8; }
        .about-image { height: 400px; background: linear-gradient(135deg, #0891b2, #f97316); border-radius: 1rem; display: flex; align-items: center; justify-content: center; color: white; font-size: 4rem; }
        .footer { background: #0891b2; color: white; padding: 3rem 0 1rem; }
        .footer-content { display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 2rem; margin-bottom: 2rem; }
        .footer-section h3 { font-size: 1.25rem; font-weight: bold; margin-bottom: 1rem; }
        .footer-section ul { list-style: none; }
        .footer-section ul li { margin-bottom: 0.5rem; }
        .footer-section ul li a { color: white; text-decoration: none; opacity: 0.8; transition: opacity 0.3s ease; }
        .footer-section ul li a:hover { opacity: 1; }
        .footer-bottom { border-top: 1px solid rgba(255,255,255,0.2); padding-top: 1rem; text-align: center; opacity: 0.8; }
        @media (max-width: 768px) {
            .hero h1 { font-size: 2.5rem; }
            .nav-container { padding: 0 1rem; }
            .about-content { grid-template-columns: 1fr; }
            .cta-buttons { flex-direction: column; align-items: center; }
        }
        @keyframes fadeInUp { from { opacity: 0; transform: translateY(30px); } to { opacity: 1; transform: translateY(0); } }
        .fade-in-up { animation: fadeInUp 0.8s ease-out; }
        html { scroll-behavior: smooth; }
    </style>
</head>
<body>
<header class="header">
    <div class="nav-container">
        <a href="/home" class="logo">DriveLK</a>
        <a href="/login" class="sign-in-btn">Sign In</a>
    </div>
</header>

<section class="hero">
    <div class="hero-content fade-in-up">
        <h1>Explore Sri Lanka at Your Own Pace</h1>
        <p>Premium vehicle rentals for your perfect Sri Lankan adventure. From economy cars to luxury SUVs, we have the perfect ride for every journey.</p>
        <div class="cta-buttons">
            <a href="#vehicles" class="btn-primary">Book Now</a>
            <a href="#about" class="btn-secondary">Learn More</a>
        </div>
    </div>
</section>

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
                <div class="feature-icon">🗺️</div>
                <h3>Local Expertise</h3>
                <p>Get insider tips and recommendations from our local team to make the most of your Sri Lankan adventure.</p>
            </div>
        </div>
    </div>
</section>

<section class="vehicles" id="vehicles">
    <div class="container">
        <h2 class="section-title">Our Vehicle Fleet</h2>
        <div class="vehicles-grid">
            <div class="vehicle-card">
                <div class="vehicle-image">🚙</div>
                <div class="vehicle-info">
                    <h3>Economy Cars</h3>
                    <p>Perfect for city driving and short trips. Fuel-efficient and easy to park.</p>
                    <div class="vehicle-price">From LKR 3,500/day</div>
                    <a href="/rental/vehicles" class="btn-primary" style="display: inline-block; padding: 0.5rem 1rem; font-size: 0.9rem;">View Details</a>
                </div>
            </div>
            <div class="vehicle-card">
                <div class="vehicle-image">🚗</div>
                <div class="vehicle-info">
                    <h3>Sedans</h3>
                    <p>Comfortable and spacious for family trips and business travel.</p>
                    <div class="vehicle-price">From LKR 5,500/day</div>
                    <a href="/rental/vehicles" class="btn-primary" style="display: inline-block; padding: 0.5rem 1rem; font-size: 0.9rem;">View Details</a>
                </div>
            </div>
            <div class="vehicle-card">
                <div class="vehicle-image">🚐</div>
                <div class="vehicle-info">
                    <h3>SUVs</h3>
                    <p>Ideal for adventure trips and rough terrain exploration.</p>
                    <div class="vehicle-price">From LKR 8,500/day</div>
                    <a href="/rental/vehicles" class="btn-primary" style="display: inline-block; padding: 0.5rem 1rem; font-size: 0.9rem;">View Details</a>
                </div>
            </div>
            <div class="vehicle-card">
                <div class="vehicle-image">🏎️</div>
                <div class="vehicle-info">
                    <h3>Luxury Cars</h3>
                    <p>Premium vehicles for special occasions and VIP transportation.</p>
                    <div class="vehicle-price">From LKR 15,000/day</div>
                    <a href="/rental/vehicles" class="btn-primary" style="display: inline-block; padding: 0.5rem 1rem; font-size: 0.9rem;">View Details</a>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="about" id="about">
    <div class="container">
        <div class="about-content">
            <div class="about-text">
                <h2>About DriveLK</h2>
                <p>DriveLK is Sri Lanka's premier vehicle rental service, dedicated to providing exceptional transportation solutions for both locals and tourists. With over a decade of experience in the industry, we understand the unique needs of travelers exploring the beautiful island of Sri Lanka.</p>
                <p>Our mission is to make your journey comfortable, safe, and memorable. We maintain a modern fleet of vehicles that undergo regular maintenance and safety checks, ensuring you have a reliable companion for your adventures.</p>
                <p>Whether you're planning a family vacation, a business trip, or an adventurous exploration of Sri Lanka's stunning landscapes, DriveLK has the perfect vehicle to match your needs and budget.</p>
                <a href="/login" class="btn-primary">Get Started</a>
            </div>
            <div class="about-image">🏝️</div>
        </div>
    </div>
</section>

<footer class="footer">
    <div class="container">
        <div class="footer-content">
            <div class="footer-section">
                <h3>DriveLK</h3>
                <p>Your trusted partner for vehicle rentals in Sri Lanka. Explore the island with confidence and comfort.</p>
            </div>
            <div class="footer-section">
                <h3>Quick Links</h3>
                <ul>
                    <li><a href="#vehicles">Our Fleet</a></li>
                    <li><a href="#features">Services</a></li>
                    <li><a href="#about">About Us</a></li>
                    <li><a href="/login">Sign In</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h3>Services</h3>
                <ul>
                    <li><a href="/rental/vehicles">Car Rental</a></li>
                    <li><a href="/rental/vehicles">SUV Rental</a></li>
                    <li><a href="/rental/vehicles">Luxury Cars</a></li>
                    <li><a href="/rental/vehicles">All Vehicles</a></li>
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
            <p>&copy; 2024 DriveLK. All rights reserved. | Privacy Policy | Terms of Service</p>
        </div>
    </div>
</footer>

<script>
    // Smooth scrolling for navigation links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            const href = this.getAttribute('href');
            // Only prevent default and scroll if href is not just '#'
            if (href && href !== '#') {
                e.preventDefault();
                const target = document.querySelector(href);
                if (target) target.scrollIntoView({ behavior: 'smooth', block: 'start' });
            }
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
