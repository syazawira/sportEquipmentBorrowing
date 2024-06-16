<%-- 
    Document   : addStaff
    Created on : 14 Jun 2024, 11:09:27 PM
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
        <title>Staff Page</title>


    </head>
    <header>
        <%@include file="header.jsp"%>
    </header>
    <body>
        <form method="post" action="SaveStaffServlet">
            <h1 class="title">Add Staff Details</h1>
            <table>
                <tr class="section">
                    <td class="div"><label for="staff_name">Name</label><br><input type="text" name="staff_name" placeholder="Enter Name" required></td>
                    <td class="div"><label for="staff_email">Email</label><br><input type="email" name="staff_email" placeholder="Enter Email" required></td>
                </tr>
                <tr class="section">
                    <td class="div"><label for="username">Username</label><br><input type="text" name="username" placeholder="Enter Username" required></td>
                    <td class="div"><label for="staff_phoneNo">Phone No</label><br><input type="text" name="staff_phoneNo" placeholder="Enter Phone Number" required></td>
                </tr>
                <tr class="section">
                    <td class="div"><label for="password">Password</label><br><input type="password" name="password" placeholder="Enter Password" required></td>
                    <td class="div"><label for="role">Role</label><br>
                        <select name="role">
                            <option value ="manager">Manager</option>
                            <option value ="employee">Employee</option>
                        </select>
                    </td>
                </tr>
            </table><br>
            <div class="button-container">
                <button id="cancelBtn" type="reset" class="submitBtn" onclick="window.location.href = 'staff.jsp'" style="background-color: grey;">CANCEL</button>
                <button id="submitBtn" type="submit" class="submitBtn">SAVE</button>
            </div>
        </form>
    </body>
    <footer>
        <%@include file="footer.jsp"%>
    </footer>
</html>


