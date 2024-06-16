<%-- 
    Document   : staff
    Created on : 14 Jun 2024, 11:12:29 PM
    Author     : LENOVO
--%>

<%@page import="Sport.com.StaffDAO"%>
<%@page import="Sport.com.Staff"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Staff</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Stardos+Stencil">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="css/general.css">
        <link rel="stylesheet" href="css/list.css">
        <style>
            @media screen and (max-width: 768px) {
                .search-container{
                    font-size:14px;
                    padding-left:5%;
                }
                table {
                    width: 90%;
                }
                th, td {
                    font-size: 11px;
                    padding: 6px;
                }
                #action{
                    padding:2px 4px;
                }
                .action-btn{
                    font-size:10px;
                    padding:5px 6px;
                }
            }
            @media screen and (max-width: 600px) {
                th, td {
                    font-size: 10px;
                    padding: 4px;
                }
            }
            @media screen and (max-width: 480px) {
                .search-container{
                    font-size:10px;
                    padding-left:0.5%;
                }
                th, td {
                    font-size: 10px;
                    padding: 2px;
                }
                #action{
                    padding:2px;
                }
                .action-btn{
                    font-size:8px;
                    padding:5px 2px;
                }
            }
        </style>
    </head>
    <header>
        <%@include file="header.jsp"%>
    </header>

    <body>
        <h1 class="listTitle">Staff</h1>
        <div id="section">
            <div class="search-container">
                <input type="text" size="20" class="search-input" style="padding:2px;" placeholder="Search...">&nbsp;&nbsp;<button id="search"onclick="searchStaff()"><i class="fa fa-search"></i></button>
            </div>
            <table id="details">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Username</th>
                    <th>Password</th>
                    <th>Email</th>
                    <th>Phone No</th>
                    <th>Role</th>
                    <th>Action</th>
                </tr>
                <%
                    List<Staff> list = StaffDAO.getAllStaff();
                    for (Staff e : list) {
                %>
                <tr class="editable-row staff-row" data-staff-id="<%= e.getStaff_id()%>" data-staff-id="<%= e.getStaff_id()%>">
                    <!-- Your existing table cells -->
                    <td><%= e.getStaff_id()%></td>
                    <td><%= e.getStaff_name()%></td>
                    <td><%= e.getUsername()%></td>
                    <td><%= e.getPassword()%></td>
                    <td><%= e.getStaff_email()%></td>
                    <td><%= e.getStaff_phoneNo()%></td>
                    <td><%= e.getRole()%></td>
                    <td>
                        <div id="action">
                            <button class="action-btn" onclick="editStaff('<%= e.getStaff_id()%>')">Edit</button>
                            <button class="action-btn" id="deleteBtn" onclick="deleteStaff('<%= e.getStaff_id()%>')">Delete</button>
                        </div>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
            <button class="addBtn" type="button" onclick="window.location.href = 'addStaff.jsp';">Add</button>

            <script>

                function editStaff(staffId) {
                    window.location.href = 'EditStaffServlet?staff_id=' + staffId;
                }

                function deleteStaff(staffId) {
                    if (confirm("Are you sure you want to delete this staff member?")) {
                        var xhr = new XMLHttpRequest();
                        xhr.open("POST", "DeleteStaffServlet", true);
                        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                        xhr.onreadystatechange = function () {
                            if (xhr.readyState === 4 && xhr.status === 200) {
                                if (xhr.responseText === "success") {
                                    alert("Staff member deleted successfully.");
                                    location.reload();
                                } else {
                                    alert("Failed to delete staff member.");
                                }
                            }
                        };
                        xhr.send("staff_id=" + staffId);
                    }
                }

                document.addEventListener('DOMContentLoaded', function () {
                    document.querySelectorAll('.editable-row').forEach(function (row) {
                        row.addEventListener('click', function () {
                            var staffId = row.getAttribute('data-staff-id');
                            window.location.href = 'EditStaffServlet?staff_id=' + staffId;
                        });
                    });
                });

                function filterByStaffId(staffId) {
                    var tableRows = document.querySelectorAll('.staff-row');
                    tableRows.forEach(function (row) {
                        if (staffId === 'all' || row.dataset.staffId === staffId) {
                            row.style.display = 'table-row';
                        } else {
                            row.style.display = 'none';
                        }
                    });
                }

                function searchStaff() {
                    var staffId = document.querySelector('.search-input').value.trim();
                    filterByStaffId(staffId);
                }
            </script>
        </div>
    </body>

    <footer>
        <%@ include file="footer.jsp" %>
    </footer>

</html>

