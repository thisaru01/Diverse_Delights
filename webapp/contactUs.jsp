<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <!-- Link to external CSS -->
    <link rel="stylesheet" type="text/css" href="css/contactUs.css">
</head>
<body>
<jsp:include page="header.jsp" />
    <div class="contact-page">
        <div class="image-container">
            <img src="images/contactUs.png" alt="Contact Us" />
        </div>
        <div class="contact-container">
            <h2>SEND US YOUR ENQUIRY</h2>
            <form action="contactServlet" method="post">
                <label for="firstName">First Name:</label>
                <input type="text" id="firstName" name="firstName" required>

                <label for="lastName">Last Name:</label>
                <input type="text" id="lastName" name="lastName" required>

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>

                <label for="phone">Phone Number:</label>
                <input type="text" id="phone" name="phone" required>

                <label for="comments">Comments:</label>
                <textarea id="comments" name="comments" rows="5" required></textarea>

                <button type="submit">Submit</button>
            </form>
        </div>
    </div>
    <jsp:include page="footer.jsp" />
</body>
</html>
