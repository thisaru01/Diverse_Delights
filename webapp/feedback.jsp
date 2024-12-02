<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Post Feedback</title>
   
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/feedback.css">
    <script>
        function validateFeedback() {
            const feedbackText = document.querySelector('textarea[name="feedback_text"]').value;
            const errorMessage = document.getElementById('error-message');

           
            if (/^\d+$/.test(feedbackText)) {
                errorMessage.textContent = 'Error: Feedback cannot contain only numbers.';
                errorMessage.style.color = 'red';
                return false; 
            } else {
                errorMessage.textContent = ''; 
            }

            return true; 
        }
    </script>
    
</head>
<body>
    <jsp:include page="header.jsp" />
    <div class="container">
        <div class="image-side">
            <img src="${pageContext.request.contextPath}/images/feedback.jpg" alt="Feedback Image">
        </div>
        <div class="form-side">
            <div class="feedback-popup">
                <h1>What do you think about our service</h1>
                
                <form action="addFeedback" method="post" onsubmit="return validateFeedback();">
                    <textarea name="feedback_text" required maxlength="500"></textarea>
                    <br>
                    <div id="error-message"></div>
                    <button type="submit">Submit Feedback</button>
                </form>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp" />
</body>
</html>
