<%-- 
    Document   : addBorrowing
    Created on : 10 Jun 2024, 9:52:19 PM
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
        <title>Borrowing Page</title>
    </head>
    <header>
        <%@include file="header.jsp"%>
    </header>
    <body>
        <form method="post"action="SaveBorrowingServlet">
            <h1 class="title">Add Borrowing Details</h1>
            <table>
                <tr class="section">
                    <td class="div"><label for="staff_id">Staff_ID:</label><br><input type="number" name="staff_id" value="<%=session.getAttribute("staff_id")%>"readonly></td>
                    <td class="div"><label for="quantity">Quantity:</label><br><input type="number"name="quantity" required></td>
                    <td class="div"><label for="staff_id">Staff_ID:</label><br><select name="status">
                            <option value="Borrowed">Borrowed</option>
                            <option value="Returned">Returned</option>
                        </select></td>
                </tr>
                <tr class="section">
                    <td class="div"><label for="equipment_id">Equipment ID:</label><br><input type="number"name="equip_id" required></td>
                    <td class="div"><label for="borrowDate">Borrow Date:</label><br><input type="date"name="borrowDate" required></td>
                </tr>  
                <tr class="section">
                    <td class="div"><label for="cust_id">Customer ID:</label><br><input type="number"name="cust_id" required></td>
                    <td class="div"><label for="returnDate">Return Date:</label><br><input type="date"name="returnDate"required></td>
                </tr>  
               
               
            </table><br>
             <div class="button-container">
                <button id="cancelBtn" type="reset" class="submitBtn" onclick="window.location.href='borrowing.jsp'">CANCEL</button>
                <button id="submitBtn" type="submit" class="submitBtn">SAVE</button>
            </div>
        </form>
    </body>
    <footer>
        <%@include file="footer.jsp"%>
    </footer>
</html>

