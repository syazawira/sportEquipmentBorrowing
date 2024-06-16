<%-- 
    Document   : equipment
    Created on : 10 Jun 2024, 10:43:31 PM
    Author     : LENOVO
--%>

<%@page import="Sport.com.Equipment"%>
<%@page import="java.util.List"%>
<%@page import="Sport.com.EquipmentDAO" %>

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
            <h1 class="listTitle">Equipment</h1>
            <div class="search-container">
                <input type="text" size="20" class="search-input" style="padding:2px;" placeholder="Search...">&nbsp;&nbsp;<button id="search" onclick="searchEquipment()"><i class="fa fa-search"></i></button>
            </div>
            <table id="details">
                <tr>
                    <th>Equipment ID</th>
                    <th>Equipment Name</th>
                    <th>Equipment Category</th>
                    <th>Available Quantity</th>
                    <th>Action</th>
                </tr>
                <%
                    List<Equipment> list = EquipmentDAO.getAllEquipments();
                    for (Equipment e : list) {
                %>
                <tr class="editable-row equipment-row" data-equipment-id="<%= e.getEquip_id()%>">
                    <td><%= e.getEquip_id()%></td>
                    <td><%= e.getEquip_name()%></td>
                    <td><%= e.getCategory()%></td>
                    <td><%= e.getAvailable_quantity()%></td>
                    <td>
                        <div id="action">
                            <button class="action-btn" onclick="editEquipment('<%= e.getEquip_id()%>')">Edit</button>
                            <button class="action-btn" id="deleteBtn" onclick="deleteEquipment('<%= e.getEquip_id()%>')">Delete</button>
                        </div>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
            <button class="addBtn" type="button" onclick="window.location.href = 'addEquipment.jsp';">Add</button>
        </div>
        <script>
            function editEquipment(equipmentId) {
                window.location.href = 'EditEquipmentServlet?equip_id=' + equipmentId;
            }

            function deleteEquipment(equipmentId) {
                if (confirm("Are you sure you want to delete this equipment?")) {
                    var xhr = new XMLHttpRequest();
                    xhr.open("POST", "DeleteEquipmentServlet", true);
                    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                    xhr.onreadystatechange = function () {
                        if (xhr.readyState === 4 && xhr.status === 200) {
                            if (xhr.responseText === "success") {
                                alert("Equipment deleted successfully.");
                                location.reload();
                            } else {
                                alert("Failed to delete equipment.");
                            }
                        }
                    };
                    xhr.send("equip_id=" + equipmentId);
                }
            }

            document.addEventListener('DOMContentLoaded', function () {
                document.querySelectorAll('.editable-row').forEach(function (row) {
                    row.addEventListener('click', function () {
                        var equipmentId = row.getAttribute('data-equipment-id');
                        window.location.href = 'EditEquipmentServlet?equip_id=' + equipmentId;
                    });
                });
            });


            function filterByEquipmentId(equipmentId) {
                var tableRows = document.querySelectorAll('.equipment-row');
                tableRows.forEach(function (row) {
                    if (equipmentId === 'all' || row.getAttribute('data-equipment-id') === equipmentId) {
                        row.style.display = 'table-row';
                    } else {
                        row.style.display = 'none';
                    }
                });
            }

            function searchEquipment() {
                var equipId = document.querySelector('.search-input').value.trim();
                filterByEquipmentId(equipId);
            }
        </script>
    </body>
    <footer>
        <%@ include file="footer.jsp" %>
    </footer>
</html>

