<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Foodie Haven</title>
    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Global Styles */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #fffaf0;
            color: #333;
            overflow-x: hidden;
            scroll-behavior: smooth;
            
        }

        /* Container */
        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
        }

        /* About and Vision Sections */
        .about-section, .vision-section, .mission-section, .values-section {
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 10px;
            margin: 20px 0;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transform: scale(0.9);
            transition: transform 0.3s;
        }

        .about-section:hover, .vision-section:hover, .mission-section:hover, .values-section:hover {
            transform: scale(1);
        }

        .about-section h2, .vision-section h2, .mission-section h2, .values-section h2 {
            font-size: 1.8rem;
            color: #e94e1b;
            margin-bottom: 10px;
        }

        .about-section p, .vision-section p, .mission-section p, .values-section p {
            font-size: 1rem;
            line-height: 1.6;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>

<jsp:include page="header.jsp" />

    <div class="container">
        <section class="about-section">
            <h2>About Us</h2>
            <p>Diverse Delights is your ultimate online food ordering platform, designed to bring a variety of cuisines right to your doorstep. Whether you crave classic comfort food or the latest culinary trends, we connect you with the best local restaurants and chefs, ensuring a delightful experience every time you order.</p>
            <p>Founded in 2022, Diverse Delights has quickly become a favorite for food lovers across the city. We pride ourselves on our user-friendly platform and excellent customer service, ensuring a seamless experience from browsing menus to enjoying your meal.</p>
        </section>

        <section class="mission-section">
            <h2>Our Mission</h2>
            <p>Our mission is to transform the way people experience food by offering an unparalleled variety of options, convenience, and top-quality service. We aim to create a community where food lovers can connect with local restaurants and share their dining experiences.</p>
        </section>

        <section class="vision-section">
            <h2>Our Vision</h2>
            <p>We aim to revolutionize the food delivery industry by setting new standards for quality and service. Our vision is to expand our reach and bring the joy of food to more cities and communities, making every meal an opportunity to explore flavors and cultures.</p>
        </section>

        <section class="values-section">
            <h2>Our Values</h2>
            <p>At Diverse Delights, we value quality, transparency, and customer satisfaction above all. We believe in supporting local businesses and ensuring every meal delivered is fresh, delicious, and safely prepared. We are committed to sustainability and eco-friendly practices in all our operations.</p>
        </section>
    </div>

<jsp:include page="footer.jsp" />
</body>
</html>
