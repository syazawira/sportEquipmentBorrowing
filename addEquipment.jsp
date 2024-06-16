<%-- 
    Document   : addEquipment
    Created on : 10 Jun 2024, 10:43:16 PM
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
        <title>Equipment Page</title>
    </head>
    <header>
        <%@include file="header.jsp"%>
    </header>
    <body>
        <form method="post"action="SaveEquipmentServlet">
            <h1 class="title">Add Equipment Details</h1>
            <table>
                <tr class="section">
                    <td class="div"><label for="equip_name">Equipment Name:</label><br><input type="text" name="equip_name" placeholder="Enter Equipment Name" required></td>
                </tr>
                <tr class="section">
                    <td class="div"><label for="category">Category:</label><br><input type="text" name="category" placeholder="Enter Category" required></td>
                </tr>
                <tr class="section">
                    <td class="div"><label for="available_quantity">Available Quantity:</label><br><input type="number" name="available_quantity" placeholder="Enter Available Quantity" required></td>
                </tr>
                
            </table><br>
             <div class="button-container">
                <button id="cancelBtn" type="reset" class="submitBtn" onclick="window.location.href='equipment.jsp'"style="background-color: grey;">CANCEL</button>
                <button id="submitBtn" type="submit" class="submitBtn">SAVE</button>
            </div>
        </form>
    </body>
    <footer>
        <%@include file="footer.jsp"%>
    </footer>
</html>


