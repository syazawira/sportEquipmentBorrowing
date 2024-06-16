<%-- 
    Document   : borrowing
    Created on : 10 Jun 2024, 9:52:56 PM
    Author     : LENOVO
--%>

<%@page import="java.util.List"%>
<%@page import="Sport.com.Borrowing" %>
<%@page import="Sport.com.BorrowingDAO" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Borrowing Page</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Stardos+Stencil">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="css/general.css">
        <title>Manage Borrowing</title>
        <style>
            #manageBorrowing {
                text-align: left;
                font-size: 40px;
                margin: 20px;
                margin-left: 50px;
                text-shadow:
                    2.5px 2.5px 0px #1fb1c4,
                    5px 5px 2px rgba(255, 255, 255);
            }
            table {
                width: 95%;
                border-collapse: collapse;
                margin: 20px auto;
            }
            table, th, td {
                border: 1.5px solid #1fb1c4;
            }
            th, td {
                padding: 10px;
                text-align: left;
                font-size: 15px;
            }
            th {
                background-color: #1fb1c4;
                text-align: center;
                font-size: 15px;
            }
            tr:nth-child(even) {
                background-color: #acebf2;
            }
            tr:nth-child(even) {
                background-color: #c8f4f7;
            }
            tr:hover {
                background-color: #ddd;
            }
            .addBtn{
                background-color: #1fbfdb;
                color:white;
                border: 0px;
                border-radius:10px;
                padding:8px 5px;
                font-size:15px;
                margin-bottom: 20px;
                width:10%;
                float: right;
                margin-right:2.5%;
            }
            .addBtn:hover{
                opacity:0.8;
            }
            #section{
                margin-bottom: 30px;
            }
            #search{
                width:fit-content;
                font-size:12px;
                margin:auto;
                background-color: #1fbfdb;
                color: white;
                border:none;
                box-shadow: 2px 2px 2px black;
            }
            #search:hover{
                opacity:0.6;
            }

        </style>
        <link rel="stylesheet" href="css/list.css">

    </head>

    <header>
        <%@include file="header.jsp"%>
    </header>

    <body>
        <div id="section">
            <h1 class="listTitle">Borrowing</h1>
            <div class="search-container">
                <input type="text" size="20" class="search-input" style="padding:2px;" placeholder="Search...">&nbsp;&nbsp;<button id="search"onclick="searchBorrowing()"><i class="fa fa-search"></i></button>

            </div>
            <table id="details">
                <tr>
                    <th>Borrowing ID</th>
                    <th>Customer ID</th>
                    <th>Equipment ID</th>
                    <th>Staff ID</th>
                    <th>Quantity</th>
                    <th>Borrow Date</th>
                    <th>Return Date</th>
                    <th>Status</th>
                </tr>
                <%
                    List<Borrowing> list = BorrowingDAO.getAllBorrowing();
                    for (Borrowing e : list) {
                %>
                <tr class="editable-row borrowing-row" data-borrow-id="<%= e.getBorrowing_id()%>" data-cust-id="<%= e.getCust_id()%>">
                    <!-- Your existing table cells -->
                    <td><%= e.getBorrowing_id()%></td>
                    <td><%= e.getCust_id()%></td>
                    <td><%= e.getEquip_id()%></td>
                    <td><%= e.getStaff_id()%></td>
                    <td><%= e.getQuantity()%></td>
                    <td><%= e.getBorrowDate()%></td>
                    <td><%= (e.getReturnDate() != null) ? e.getReturnDate() : "Not yet returned"%></td>
                    <td><%= e.getStatus()%></td>
                </tr>
                <%
                    }
                %>
            </table>
            <button class="addBtn"type="button" onclick="window.location.href = 'addBorrowing.jsp';">Add</button>
        </div>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                document.querySelectorAll('.editable-row').forEach(function (row) {
                    row.addEventListener('click', function () {
                        var borrowingId = row.getAttribute('data-borrow-id');
                        window.location.href = 'EditBorrowingServlet?borrowing_id=' + borrowingId;
                    });
                });
            });

            function filterByCustomerId(customerId) {
                var tableRows = document.querySelectorAll('.borrowing-row');
                tableRows.forEach(function (row) {
                    if (customerId === 'all' || row.dataset.custId === customerId) {
                        row.style.display = 'table-row';
                    } else {
                        row.style.display = 'none';
                    }
                });
            }

            function searchBorrowing() {
                var custId = document.querySelector('.search-input').value.trim();
                filterByCustomerId(custId);
            }
        </script>

    </body>

    <footer>
        <%@ include file="footer.jsp" %>
    </footer>

</html>

