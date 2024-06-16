<%-- 
    Document   : editEquipment
    Created on : 13 Jun 2024, 10:21:14 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Sport.com.Equipment"%>
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
    <title>Update Equipment</title>
</head>
<header>
    <%@ include file="header.jsp" %>
</header>
<body>
    <form method="post" action="EditEquipmentServlet2">
        <h1 class="title">Update Equipment Details</h1>
        <table>
            <tr class="section">
                <td class="div">
                    <label for="equip_id">Equipment ID:</label><br>
                    <input type="number" name="equip_id" value="${equipment.equip_id}" readonly>
                </td>
                <td class="div">
                    <label for="equip_name">Equipment Name:</label><br>
                    <input type="text" name="equip_name" value="${equipment.equip_name}" required>
                </td>
            </tr>
            <tr class="section">
                <td class="div">
                    <label for="category">Category:</label><br>
                    <input type="text" name="category" value="${equipment.category}" required>
                </td>
                <td class="div">
                    <label for="available_quantity">Available Quantity:</label><br>
                    <input type="text" name="available_quantity" value="${equipment.available_quantity}" required>
                </td>
            </tr>
        </table><br>
        <div class="button-container">
            <button id="cancelBtn" type="reset" class="submitBtn" onclick="window.location.href='equipment.jsp'" style="background-color: grey;">CANCEL</button>
            <button id="submitBtn" type="submit" class="submitBtn">SAVE</button>
            <input type="hidden" name="equip_id" value="${equipment.equip_id}">
        </div>
    </form>
</body>
<footer>
    <%@ include file="footer.jsp" %>
</footer>
</html>
