<%-- 
    Document   : customer
    Created on : 10 Jun 2024, 10:11:33 PM
    Author     : LENOVO
--%>

<%@page import="Sport.com.Customer"%>
<%@page import="java.util.List"%>
<%@page import="Sport.com.CustomerDAO" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Customer</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Stardos+Stencil">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="css/general.css">
        <link rel="stylesheet" href="css/list.css">
        <style>
             @media screen and (max-width: 480px) {
                .search-container{
                    padding-left:5%;
                }
             }
        </style>
    </head>
    <header>
        <%@ include file="header.jsp" %>
    </header>
    <body>
        <div id="section">
            <h1 class="listTitle">Customer</h1>
            <div class="search-container">
                <input type="text" size="20" class="search-input" style="padding:2px;" placeholder="Search...">&nbsp;&nbsp;<button id="search" onclick="searchCustomer()"><i class="fa fa-search"></i></button>
            </div>
            <table id="details">
                <tr>
                    <th>Customer ID</th>
                    <th>Customer Name</th>
                    <th>Customer Email</th>
                    <th>Customer Phone Number</th>
                    <th>Action</th>
                </tr>
                <%
                    List<Customer> list = CustomerDAO.getAllCustomers();
                    for (Customer e : list) {
                %>
                <tr class="editable-row customer-row" data-customer-id="<%= e.getCust_id()%>">
                    <td><%= e.getCust_id()%></td>
                    <td><%= e.getCust_name()%></td>
                    <td><%= e.getCust_email()%></td>
                    <td><%= e.getCust_phoneNo()%></td>
                    <td>
                        <div id="action">   
                            <button class="action-btn" onclick="editCustomer('<%= e.getCust_id()%>')">Edit</button>
                            <button class="action-btn" id="deleteBtn" onclick="deleteCustomer('<%= e.getCust_id()%>')">Delete</button>
                        </div>
                    </td> 
                </tr>
                <%
                    }
                %>
            </table>
            <button class="addBtn" type="button" onclick="window.location.href = 'addCustomer.jsp';">Add</button>
        </div>
        <script>
            function editCustomer(customerId) {
                window.location.href = 'EditCustomerServlet?cust_id=' + customerId;
            }

            function deleteCustomer(customerId) {
                if (confirm("Are you sure you want to delete this customer?")) {
                    var xhr = new XMLHttpRequest();
                    xhr.open("POST", "DeleteCustomerServlet", true);
                    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                    xhr.onreadystatechange = function () {
                        if (xhr.readyState === 4 && xhr.status === 200) {
                            if (xhr.responseText === "success") {
                                alert("Customer deleted successfully.");
                                location.reload();
                            } else {
                                alert("Failed to delete customer.");
                            }
                        }
                    };
                    xhr.send("cust_id=" + customerId);
                }
            }

            document.addEventListener('DOMContentLoaded', function () {
                document.querySelectorAll('.editable-row').forEach(function (row) {
                    row.addEventListener('click', function () {
                        var customerId = row.getAttribute('data-customer-id');
                        window.location.href = 'EditCustomerServlet?cust_id=' + customerId;
                    });
                });
            });

            function filterByCustomerId(customerId) {
                var tableRows = document.querySelectorAll('.customer-row');
                tableRows.forEach(function (row) {
                    if (customerId === 'all' || row.getAttribute('data-customer-id') === customerId) {
                        row.style.display = 'table-row';
                    } else {
                        row.style.display = 'none';
                    }
                });
            }

            function searchCustomer() {
                var custId = document.querySelector('.search-input').value.trim();
                filterByCustomerId(custId);
            }
        </script>
    </body>
    <footer>
        <%@ include file="footer.jsp" %>
    </footer>
</html>

