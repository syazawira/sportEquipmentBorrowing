<%-- 
    Document   : addCustomer
    Created on : 10 Jun 2024, 10:10:49 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Stardos+Stencil">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="css/general.css">
        <link rel="stylesheet" href="css/form.css">
        <title>Customer Page</title>
    </head>
    <header>
        <%@include file="header.jsp"%>
    </header>
    <body>
        <form method="post"action="SaveCustomerServlet">
            <h1 class="title">Add Customer Details</h1>
            <table>
                <tr class="section">
                    <td class="div"><label for="cust_name">Name:</label><br><input type="text" name="cust_name" placeholder="Enter Name" required></td>
                </tr>
                <tr class="section">
                    <td class="div"><label for="cust_email">Email:</label><br><input type="text" name="cust_email" placeholder="Enter Email" required></td>
                </tr>
                <tr class="section">
                    <td class="div"><label for="cust_phoneNo">Phone Number:</label><br><input type="number" name="cust_phoneNo" placeholder="Enter Phone Number" required></td>
                </tr>
                
            </table><br>
             <div class="button-container">
                <button id="cancelBtn" type="reset" class="submitBtn" onclick="window.location.href='customer.jsp'"style="background-color: grey;">CANCEL</button>
                <button id="submitBtn" type="submit" class="submitBtn">SAVE</button>
            </div>
        </form>
    </body>
    <footer>
        <%@include file="footer.jsp"%>
    </footer>
</html>

