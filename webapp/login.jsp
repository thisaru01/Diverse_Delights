<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <style>
        /* General body styling */
        body {
            font-family: Arial, sans-serif;
            background: #f0f0f0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        /* Modal background */
        .modal-background {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.6);
            display: flex;
            justify-content: center;
            align-items: center;
        }

        /* Login form container */
        .login-form {
            background: #fff;
            padding: 20px 30px;
            border-radius: 10px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            max-width: 400px;
            width: 100%;
        }

        /* Input fields styling */
        .login-form input[type="email"],
        .login-form input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ddd;
            font-size: 14px;
        }

        /* Submit button styling */
        .login-form input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #333;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        /* Hover effect for submit button */
        .login-form input[type="submit"]:hover {
            background-color: #555;
        }

        /* Placeholder color */
        ::placeholder {
            color: #aaa;
        }

        /* Registration link styling */
        .register-text {
            display: block;
            margin-top: 15px;
            text-align: center;
            font-size: 14px;
        }

        /* Blue part of the registration link */
        .register-link {
            color: #007bff;
            text-decoration: none;
            transition: color 0.3s;
        }

        /* Hover effect for blue part */
        .register-link:hover {
            color: #0056b3;
        }
    </style>
</head>
<body>

<div class="modal-background">
    <form action="LoginServlet" method="post" class="login-form">
        <input type="email" name="email" placeholder="Email" required>
        <input type="password" name="password" placeholder="Password" required>
        <input type="submit" value="Login">
        <!-- Registration Text and Link -->
        <div class="register-text">
            Don't have an account? 
            <a href="register.jsp" class="register-link">Register here</a>
        </div>
    </form>
</div>

</body>
</html>
