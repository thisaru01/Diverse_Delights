<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
    <style>
        /* General body styling */
        body {
            font-family: Arial, sans-serif;
            background: #e0e0e0; /* Darkened background */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        /* Container styling */
        .container {
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            max-width: 500px;
            width: 100%;
        }

        /* Heading styling */
        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        /* Form elements styling */
        .form-label {
            display: block;
            margin-bottom: 5px;
            color: #555;
            font-weight: bold;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 5px;
            border: 1px solid #ddd;
            font-size: 14px;
            box-sizing: border-box;
        }

        textarea.form-control {
            resize: vertical;
            min-height: 80px;
        }

        /* Button styling */
        button {
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

        /* Hover effect for the button */
        button:hover {
            background-color: #555;
        }

        /* Login link styling */
        .login-text {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
        }

        .login-link {
            color: #007bff;
            text-decoration: none;
            transition: color 0.3s;
        }

        .login-link:hover {
            color: #0056b3;
        }

        /* Error message styling */
        .error-message {
            color: red;
            font-size: 12px;
            margin-top: -10px;
            margin-bottom: 10px;
            display: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>User Registration</h2>
        <form id="registrationForm" action="register" method="post">
            <div class="mb-3">
                <label for="name" class="form-label">Name</label>
                <input type="text" class="form-control" name="name" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" name="email" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" id="password" class="form-control" name="password" 
                       required 
                       pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[\W_]).{8,}" 
                       title="Password must be at least 8 characters long, contain one uppercase letter, one lowercase letter, one number, and one special character.">
                <div class="error-message" id="passwordError">Password must be at least 8 characters long, contain one uppercase letter, one lowercase letter, one number, and one special character.</div>
            </div>
            <div class="mb-3">
                <label for="phone" class="form-label">Phone</label>
                <input type="text" id="phone" class="form-control" name="phone" 
                       required
                       pattern="\d{10}" 
                       maxlength="10" 
                       title="Phone number must be exactly 10 digits.">
                <div class="error-message" id="phoneError">Phone number must be exactly 10 digits.</div>
            </div>
            <div class="mb-3">
                <label for="address" class="form-label">Address</label>
                <textarea class="form-control" name="address"></textarea>
            </div>
            <button type="submit">Register</button>
        </form>
        <div class="login-text">
            Already have an account? <a href="login.jsp" class="login-link">Login here</a>
        </div>
    </div>

    <script>
        document.getElementById('registrationForm').addEventListener('submit', function(event) {
            // Password validation
            const password = document.getElementById('password').value;
            const passwordError = document.getElementById('passwordError');
            const passwordPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[\W_]).{8,}$/;

            if (!passwordPattern.test(password)) {
                passwordError.style.display = 'block';
                event.preventDefault(); // Prevent form submission
            } else {
                passwordError.style.display = 'none';
            }

            // Phone validation
            const phone = document.getElementById('phone').value;
            const phoneError = document.getElementById('phoneError');
            const phonePattern = /^\d{10}$/;

            if (!phonePattern.test(phone)) {
                phoneError.style.display = 'block';
                event.preventDefault(); // Prevent form submission
            } else {
                phoneError.style.display = 'none';
            }
        });
    </script>
</body>
</html>
