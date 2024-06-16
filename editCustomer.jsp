<%-- 
    Document   : editCustomer
    Created on : 13 Jun 2024, 10:26:35 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Sport.com.Customer"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Stardos+Stencil">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="css/general.css">
    <link rel="stylesheet" href="css/form.css">
    <title>Update Customer</title>
</head>
<header>
    <%@ include file="header.jsp" %>
</header>
<body>
    <form method="post" action="EditCustomerServlet2">
        <h1 class="title">Update Customer Details</h1>
        <table>
            <tr class="section">
                <td class="div">
                    <label for="cust_id">Customer ID:</label><br>
                    <input type="number" name="cust_id" value="${customer.cust_id}" readonly>
                </td>
                <td class="div">
                    <label for="cust_name">Customer Name:</label><br>
                    <input type="text" name="cust_name" value="${customer.cust_name}" required>
                </td>
            </tr>
            <tr class="section">
                <td class="div">
                    <label for="cust_email">Customer Email:</label><br>
                    <input type="text" name="cust_email" value="${customer.cust_email}" required>
                </td>
                <td class="div">
                    <label for="cust_phoneNo">Customer Phone Number:</label><br>
                    <input type="text" name="cust_phoneNo" value="${customer.cust_phoneNo}" required>
                </td>
            </tr>
        </table><br>
        <div class="button-container">
            <button id="cancelBtn" type="reset" class="submitBtn" onclick="window.location.href='customer.jsp'" style="background-color: grey;">CANCEL</button>
            <button id="submitBtn" type="submit" class="submitBtn">SAVE</button>
            <input type="hidden" name="cust_id" value="${customer.cust_id}">
        </div>
    </form>
</body>
<footer>
    <%@ include file="footer.jsp" %>
</footer>
</html>
