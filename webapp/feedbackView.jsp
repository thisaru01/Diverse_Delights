<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="feedback_management.Feedback" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Your Feedback</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/feedback-list.css">
</head>
<body>

    <jsp:include page="header.jsp" />

    <div class="container">
        <h2>Your Feedbacks</h2>
        <br>
        <br>
        <c:if test="${empty feedbackList}">
            <p>No feedback available.</p>
        </c:if>

        <c:forEach var="feedback" items="${feedbackList}">
            <div class="card">
                <div class="card-body">
                    <p class="card-text" style="font-weight: bold; font-size: 18px;">${feedback.feedbackText}</p>
                    
                    
                    <form method="post" action="editFeedback" class="edit-form" onsubmit="return confirmEdit();">
                        <input type="hidden" name="feedbackId" value="${feedback.id}">
                        <textarea name="feedbackText" class="form-control">${feedback.feedbackText}</textarea>
                        <button type="submit" class="btn edit-button">Edit</button>
                    </form>
                    
                   
                    <form method="post" action="deleteFeedback" class="delete-form">
                        <input type="hidden" name="feedbackId" value="${feedback.id}">
                        <button type="submit" class="btn delete-button" onclick="return confirmDelete()">Delete</button>
                    </form>
                </div>
            </div>
            <br>
            <br>
        </c:forEach>
    </div>
    
 
    <script>
       
        function confirmDelete() {
            return confirm("Are you sure you want to delete this feedback?");
        }

       
        function confirmEdit() {
            alert("Your feedback is being edited.");
            return true; 
        }
    </script>
    
    <jsp:include page="footer.jsp" />

</body>
</html>
