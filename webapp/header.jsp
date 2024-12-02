<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap" rel="stylesheet">
    
    <link rel="stylesheet" type="text/css" href="css/header.css">

 
</head>
<body>
    <!-- Sticky Header -->
    <header class="sticky-header large" id="header">
        <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container-fluid">
                <!-- Logo -->
                <a class="navbar-brand" href="home.jsp">
                    <img src="images/logo.png" alt="Logo">
                </a>
                <!-- Navbar toggle for mobile -->
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <!-- Navbar links -->
                <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                    <ul class="navbar-nav">
                        <%
                            String currentPage = request.getRequestURI();
                        %>
                        <li class="nav-item">
                            <a class="nav-link <%= currentPage.contains("home.jsp") ? "active" : "" %>" href="home.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link <%= currentPage.contains("appetizers.jsp") || currentPage.contains("beverages.jsp")
                            || currentPage.contains("mainCourse.jsp") || currentPage.contains("desserts.jsp") ? "active" : "" %>" href="appetizers.jsp">Products</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link <%= currentPage.contains("showFeedback") ? "active" : "" %>" href="showFeedback">Feedbacks</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link <%= currentPage.contains("aboutUs.jsp") ? "active" : "" %>" href="aboutUs.jsp">About Us</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link <%= currentPage.contains("contactUs.jsp") ? "active" : "" %>" href="contactUs.jsp">Contact Us</a>
                        </li>
                    </ul>
                    <!-- Profile Icon -->
                    <div class="navbar-icons">
                        <%
                            Integer userId = (Integer) session.getAttribute("user_id");
                        %>
                        <a class="profile-icon" href="<%= (userId != null) ? request.getContextPath() + "/editProfile.jsp" : request.getContextPath() + "/login.jsp" %>" title="Profile">
                            <i class="fas fa-user-circle fa-2x"></i>
                        </a>
                        <!-- Dropdown Menu for Logout (Only visible if user is logged in) -->
                        <%
                            if (userId != null) {
                        %>
                            <div class="dropdown">
                                <a href="<%= request.getContextPath() + "/LogoutServlet" %>" title="Logout">Logout</a>
                            </div>
                        <%
                            }
                        %>
                        <!-- Cart Icon (Visible only if user is logged in) -->
                        <%
                            if (userId != null) {
                        %>
                            <a href="${pageContext.request.contextPath}/ViewCartServlet" title="Cart">
                                <i class="fas fa-shopping-cart fa-2x"></i>
                            </a>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </nav>
    </header>

    <!-- JS for Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

    <!-- JavaScript for Shrink-on-Scroll -->
    <script>
        window.onscroll = function() {
            var header = document.getElementById("header");
            if (window.scrollY > 80) {  // Shrinks after scrolling down 80px
                header.classList.add("shrink");
                header.classList.remove("large");
            } else {
                header.classList.add("large");
                header.classList.remove("shrink");
            }
        };
    </script>
</body>
</html>
