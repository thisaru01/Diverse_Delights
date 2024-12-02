<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Footer</title>
    <link rel="stylesheet" href="css/footer.css"> <!-- Link to external CSS file -->
</head>
<body>
    <footer class="footer">
        <div class="footer-column">
            <h3>Quick Links</h3>
            <ul>
                <li><a href="aboutUs.jsp">About Us</a></li>
                <li><a href="appetizers.jsp">Products</a></li>
                <li><a href="#">Privacy Policy</a></li>
            </ul>
        </div>
        <div class="footer-column">
            <h3>Products</h3>
            <ul>
                <li><a href="appetizers.jsp">Appetizers</a></li>
                <li><a href="beverages.jsp">Beverages</a></li>
                <li><a href="mainCourse.jsp">Main Course</a></li>
                <li><a href="desserts.jsp">Desserts</a></li>

            </ul>
        </div>
        <div class="footer-column contact-info">
            <h3>Contact Us</h3>
            <p><img src="https://img.icons8.com/color/48/000000/address.png" alt="Address"> A-911, Industrial Estate, Sri Lanka.</p>
            <p><img src="https://img.icons8.com/color/48/000000/phone.png" alt="Phone"> +94 (0) 11 223 6999</p>
            <p><img src="https://img.icons8.com/color/48/000000/email.png" alt="Email"> diversedelights@gmail.com</p>
            <div class="social-icons">
                <a href="#"><img src="https://img.icons8.com/color/48/000000/facebook.png" alt="Facebook"></a>
                <a href="#"><img src="https://img.icons8.com/color/48/000000/youtube-play.png" alt="YouTube"></a>
                <a href="#"><img src="https://img.icons8.com/color/48/000000/instagram-new.png" alt="Instagram"></a>
            </div>
        </div>
    </footer>

    <script>
        // Interactive social icon scaling
        document.querySelectorAll('.social-icons img').forEach(icon => {
            icon.addEventListener('mouseover', () => {
                icon.style.transform = 'scale(1.3)';
                icon.style.transition = 'transform 0.3s';
            });

            icon.addEventListener('mouseout', () => {
                icon.style.transform = 'scale(1)';
            });
        });

        // Interactive contact information fade effect
        const contactInfo = document.querySelectorAll('.contact-info p');
        contactInfo.forEach(info => {
            info.addEventListener('mouseover', () => {
                info.style.opacity = '0.7';
            });
            info.addEventListener('mouseout', () => {
                info.style.opacity = '1';
            });
        });
    </script>
</body>
</html>
