<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="css/home.css">
    
    <title>Diverse Delights</title>
    
</head>
<body>
    <!-- header -->
    <jsp:include page="header.jsp" />

    <!-- Custom Slide show -->
    <section id="home" class="slideshow-container">
        <!-- Slide 1 -->
        <div class="mySlides" style="background-image: url('images/banner1.png');">
            <div class="caption">
                
            </div>
        </div>

        <!-- Slide 2 -->
        <div class="mySlides" style="background-image: url('images/banner2.png');">
            <div class="caption">
                
            </div>
        </div>

        <!-- Slide 3 -->
        <div class="mySlides" style="background-image: url('images/banner3.png');">
            <div class="caption">
                
            </div>
        </div>

        <!-- Navigation buttons -->
        <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
        <a class="next" onclick="plusSlides(1)">&#10095;</a>
    </section>

    <!-- Dots (Indicators) -->
    <div class="dot-container">
        <span class="dot" onclick="currentSlide(1)"></span>
        <span class="dot" onclick="currentSlide(2)"></span>
        <span class="dot" onclick="currentSlide(3)"></span>
    </div>

<section class="categories">
    <div class="container">
    
        <h2>Our Specialties</h2>
        <br>
        <br>
        <div class="row">
            <div class="col-md-3"> 
                <div class="category-card">
                    <a href="desserts.jsp" class="category-link">
                        <img src="images/cake.jpg" alt="Desserts" class="img-fluid">
                    </a>
                </div>
            </div>
            <div class="col-md-3"> 
                <div class="category-card">
                    <a href="beverages.jsp" class="category-link">
                        <img src="images/drink.jpg" alt="Beverages" class="img-fluid">
                    </a>
                </div>
            </div>
            <div class="col-md-3"> 
                <div class="category-card">
                    <a href="mainCourse.jsp" class="category-link">
                        <img src="images/burger.jpg" alt="Main Course" class="img-fluid">
                    </a>
                </div>
            </div>
            <div class="col-md-3"> 
                <div class="category-card">
                    <a href="appetizers.jsp" class="category-link"> 
                        <img src="images/appetizer.jpeg" alt="appetizer" class="img-fluid"> 
                    </a>
                </div>
            </div>
        </div>
    </div>
</section>


<section class="testimonials">
    <div class="container">
        <h2>What Our Customers Say</h2>
        <div class="testimonial-card">
            <p>"Absolutely loved the food! The flavors are out of this world!"</p>
            <h5>- Jane Doe</h5>
        </div>
        <div class="testimonial-card">
            <p>"Great service and a cozy atmosphere. Will definitely come back!"</p>
            <h5>- John Smith</h5>
        </div>
        <div class="testimonial-card">
            <p>"A delightful experience from start to finish. Highly recommend!"</p>
            <h5>- Emily Davis</h5>
        </div>
    </div>
</section>
<section class="image-text-section">
    <div class="container">
        <div class="image-text-container">
            <div class="image">
                <img src="images/map.jpg" alt="Description of image" class="img-fluid">
            </div>
            <div class="text">
                <p>At Diverse Delights, we take pride in our international footprint, with locations across several countries. 
                Our commitment to delivering authentic culinary experiences knows no borders. Whether you're in Sri Lanka, India, or any of our other international venues,
                 you can enjoy the same high-quality dishes and exceptional service. 
                Explore our locations on the map and discover where you can indulge in the flavors that unite us all!</p>
            </div>
        </div>
    </div>
</section>

    
    <jsp:include page="footer.jsp" />

    <script>
        let slideIndex = 1;
        showSlides(slideIndex);

        // Next/previous controls
        function plusSlides(n) {
            showSlides(slideIndex += n);
        }

        // Thumbnail image controls
        function currentSlide(n) {
            showSlides(slideIndex = n);
        }

        function showSlides(n) {
            let i;
            let slides = document.getElementsByClassName("mySlides");
            let dots = document.getElementsByClassName("dot");
            if (n > slides.length) {slideIndex = 1}
            if (n < 1) {slideIndex = slides.length}
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            for (i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace(" active", "");
            }
            slides[slideIndex-1].style.display = "block";
            dots[slideIndex-1].className += " active";
        }

        
        setInterval(() => {
            plusSlides(1); // Go to next slide every 5 seconds
        }, 8000);

    </script>
</body>
</html>
