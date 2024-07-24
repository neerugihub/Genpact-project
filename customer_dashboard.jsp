<%@ page import="java.sql.*, javax.sql.*" %>
<%@ page session="true" %>
<%
    String accountNo = (String) session.getAttribute("customer");
    if (accountNo == null) {
        response.sendRedirect("customer_login.html");
        return;
    }

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank_db", "root", "root");

        stmt = conn.prepareStatement("SELECT * FROM Customer WHERE account_no = ?");
        stmt.setString(1, accountNo);
        rs = stmt.executeQuery();

        if (rs.next()) {
%>
 <style>
        .dashboard {
            text-align: center;
            margin-top: 50px;
        }

        .dashboard h2 {
            margin-bottom: 40px;
        }

        .dashboard .info {
            margin-bottom: 20px;
            color: #333;
            font-size: 18px;
        }

        .dashboard form {
            margin-bottom: 20px;
        }

        .dashboard form label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #555;
        }

        .dashboard form input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .dashboard form input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .dashboard form input[type="submit"]:hover {
            background-color: #218838;
        }

        .dashboard a {
            display: inline-block;
            padding: 10px 20px;
            margin: 20px 0;
            background-color: #28a745;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .dashboard a:hover {
            background-color: #218838;
        }
    </style>
    <h2>Customer Dashboard</h2>
    <p>Account No: <%= rs.getString("account_no") %></p>
    <p>Full Name: <%= rs.getString("full_name") %></p>
    <p>Address: <%= rs.getString("address") %></p>
    <p>Mobile No: <%= rs.getString("mobile_no") %></p>
    <p>Email ID: <%= rs.getString("email_id") %></p>
    <p>Account Type: <%= rs.getString("account_type") %></p>
    <p>Initial Balance: <%= rs.getBigDecimal("initial_balance") %></p>
    <form action="deposit" method="post">
        <label for="amount">Deposit Amount:</label>
        <input type="number" id="amount" name="amount" step="0.01" required><br><br>
        <input type="submit" value="Deposit">
    </form>
    <form action="withdraw" method="post">
        <label for="amount">Withdraw Amount:</label>
        <input type="number" id="amount" name="amount" step="0.01" required><br><br>
        <input type="submit" value="Withdraw">
    </form>
    <a href="generatePDF">Download Last 10 Transactions</a>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) {}
        if (stmt != null) try { stmt.close(); } catch (SQLException e) {}
        if (conn != null) try { conn.close(); } catch (SQLException e) {}
    }
%>
