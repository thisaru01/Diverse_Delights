<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="feedback_management.Feedback" %>
<html>
<head>
    <title>Feedback List</title>
    <style>
    
	/* General Styles */
body {
    font-family: 'Helvetica Neue', Arial, sans-serif;
    background-color: #f0f0f0;
    color: #333;
    margin: 0;
    padding: 0;
}

/* Container styling */
.container {
    margin-top: 50px;
    padding: 20px;
    max-width: 900px;
    margin-left: auto;
    margin-right: auto;
    padding: 40px; /
}

/* Table styles */
.table {
    width: 100%;
    margin-bottom: 20px;
    border-collapse: separate;
    border-spacing: 0;
    border-radius: 8px;
    overflow: hidden;
}

.table th, .table td {
    padding: 15px;
    text-align: left;
    border-bottom: 1px solid #e0e0e0;
}

.table thead th {
    background-color: #333;
    color: #ffffff;
    font-weight: 600;
}

.table tbody tr:hover {
    background-color: #f5f5f5;
}


/* Button styles */
.btnfeed {
    background-color: #000; 
    border: none;
    color: #ffffff; 
    padding: 12px 24px;
    text-decoration: none;
    border-radius: 5px;
    display: inline-block;
    transition: background-color 0.3s, transform 0.2s;
    font-weight: 500;
}

.btnfeed:hover {
    background-color: #333; 
    transform: translateY(-2px);
}


/* Title styling */
h2 {
    color: #333;
    margin-bottom: 20px;
    font-size: 28px;
    text-transform: uppercase;
    letter-spacing: 1px;
    font-weight: 700;
}
	
    </style>
    
    
</head>
<body>

<jsp:include page="header.jsp" />

<div class="container mt-5">
    <h2 class="mb-4">Feedback List</h2>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Username</th>
                <th>Feedback</th>
                <th>Created At</th>
            </tr>
        </thead>
        <tbody>
            <%
            	
                List<Feedback> feedbackList = (List<Feedback>) request.getAttribute("feedbackList");
                if (feedbackList != null) {
                    for (Feedback feedback : feedbackList) {
            %>
                <tr>
                    <td><%= feedback.getUsername() %></td> 
                    <td><%= feedback.getFeedbackText() %></td>
                    <td><%= feedback.getCreatedAt() %></td>
                </tr>
            <%
                    }
                } else {
            %>
                <tr>
                    <td colspan="3" class="text-center">No feedback available</td>
                </tr>
            <%
                }
            %>
        </tbody>
    </table>
    
    
    <div class="mb-3">
        <a href="feedback.jsp" class="btnfeed">Add Feedback</a> 
    </div>
</div>

<jsp:include page="footer.jsp" />

</body>
</html>
