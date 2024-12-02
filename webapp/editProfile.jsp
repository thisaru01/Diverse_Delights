<%@ page session="true" %>
<%@ page import="user_management.User" %>
<%@ page import="user_management.UserDAO" %>
<%
    // Retrieve user_id from the session
    Integer userId = (Integer) session.getAttribute("user_id"); 
    if (userId == null) {
        response.sendRedirect("login.jsp"); // Redirect to login if user is not logged in
        return; // Prevent further execution
    }

    UserDAO userDAO = new UserDAO();
    User user = userDAO.getUserById(userId); // Fetch user details based on user_id
    if (user == null) {
        response.sendRedirect("login.jsp"); // Redirect if user not found
        return; // Prevent further execution
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" type="text/css" href="css/userProfile.css"> 
    <title>Edit Profile</title>
</head>
<body>

<jsp:include page="header.jsp" />
    <div class="main-container">

        <!-- Additional Card for Order and Feedback History -->
        <div class="card-container">
            <h4 class="card-heading">Your History</h4>
            <button class="btn-history" onclick="location.href='ViewOrderHistoryServlet'">Order History</button>
            <button class="btn-history" onclick="location.href='ViewFeedbackServlet'">Feedback History</button>
        </div><br><br>
        
        <h2>Edit Profile</h2>
        <br>
        <form action="UpdateUserServlet" method="post" class="form-container">
            <input type="hidden" name="id" value="<%= user.getId() %>">
            <div class="form-group">
                <label for="name" class="form-label">Name</label>
                <input type="text" class="input-field" id="name" name="name" value="<%= user.getName() %>" required>
            </div>
            <div class="form-group">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="input-field" id="email" name="email" value="<%= user.getEmail() %>" required>
            </div>
            <div class="form-group">
                <label for="phone" class="form-label">Phone</label>
                <input type="text" class="input-field" id="phone" name="phone" value="<%= user.getPhone() %>">
            </div>
            <div class="form-group">
                <label for="address" class="form-label">Address</label>
                <textarea class="input-field" id="address" name="address"><%= user.getAddress() %></textarea>
            </div>
            <button type="submit" class="btn-submit">Update Profile</button>
        </form>

        <!-- Delete Account Form -->
        <h4 class="delete-heading">Delete Account</h4>
        <form action="DeleteAccountServlet" method="post" onsubmit="return confirm('Are you sure you want to delete your account? This action cannot be undone.');" class="form-container">
            <button type="submit" class="btn-danger">Delete Account</button>
        </form>
    </div>
<jsp:include page="footer.jsp" />

    
</body>
</html>
