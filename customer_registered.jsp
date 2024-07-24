<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Registered</title>
     <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 50px;
        }
        .details {
            color: green;
            font-size: 20px;
            margin-bottom: 20px;
        }
        .button {
            margin-top: 20px;
        }
        .button a {
            text-decoration: none;
        }
        .button button {
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .button button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <h1>Customer Registration Successful</h1>
    <p class="details">Customer has been successfully registered with the following details:</p>
    <p><strong>Account Number:</strong> <%= request.getAttribute("accountNo") %></p>
    <p><strong>Temporary Password:</strong> <%= request.getAttribute("tempPassword") %></p>
    <div class="button">
        <a href="register_customer.html">
            <button type="button">Back to Dashboard</button>
        </a>
    </div>
</body>
</html>
