<%-- 
    Document   : header
    Created on : 5 Jun 2024, 10:24:33 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" >
        <title>Header Page</title>
        <style>
            li a {
                display: block;
                color: white;
                text-align: center;
                padding: 15px 30px;
                text-decoration: none;
                font-size: 13px;
                font-weight: bold;
            }
            nav a:hover {
                background-color: #189294;
            }
            .dropdown {
                float: left;
            }

            .dropdown .dropbtn {
                border: none;
                outline: none;
                color: white;
                text-align: center;
                padding: 15px 20px;
                background-color: inherit;
                font-family: inherit;
                margin: 0;
                width: fit-content;
                font-size:13px;
                font-weight: bold;
            }

            .dropbtn:hover {
                background-color: #189294;
            }

            nav a:hover {
                background-color: #189294;
            }

            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #f9f9f9;
                min-width: fit-content;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                z-index: 1;
            }

            .dropdown-content a {
                float: none;
                color: black;
                padding: 12px 25px;
                text-decoration: none;
                display: block;
                text-align: left;
                font-weight: normal;
            }

            .dropdown-content a:hover {
                background-color: #afe8f0;
            }

            .dropdown:hover .dropdown-content {
                display: block;
            }
            @media only screen and (max-width: 1200px) {
                nav a {
                    padding: 12px 20px;
                    font-size: 12px;
                }
                .dropdown .dropbtn {
                    padding: 12px 20px;
                    font-size: 12px;
                }
                .dropdown-content a {
                    padding: 10px 14px;
                }
            }

            @media only screen and (max-width: 992px) {
                nav ul {
                    flex-direction: column;
                }
                nav a {
                    padding: 10px 15px;
                }
                .dropdown .dropbtn {
                    padding: 10px 15px;
                }
                .dropdown-content a {
                    padding: 8px 10px;
                }
                #profile .dropbtn {
                    padding: 10px 15px;
                    font-size: 11px;
                }
            }

            @media only screen and (max-width: 768px) {
                nav a {
                    padding: 8px 10px;
                }
                .dropdown .dropbtn {
                    padding: 8px 10px;
                }
                #profile .dropdown-content {
                    right:0;
                }

                .dropdown-content a {
                    padding: 6px 8px;
                    font-size: 10px;

                }
                #profile .dropbtn {
                    padding: 8px 10px;
                    font-size: 10px;
                }
            }

            @media only screen and (max-width: 576px) {
                nav a,.dropdown .dropbtn{
                    padding: 6px 3px;
                    font-size: 9.5px;
                }
                .dropdown-content a {
                    padding: 5px 6px;
                    font-size: 8px;

                }
                #profile .dropbtn {
                    padding: 6px 3px;

                }
            }
        </style>
    </head>
    <body>
        <h1 id="logo"><span id="logo1">Borrow</span>Play</h1>
        <nav>
            <ul id="nav-list">
                <li><a href="home.jsp">HOME</a></li>
                    <% if (session.getAttribute("userRole").equals("employee")) {%>
                <li><a href="customer.jsp">USERS</a></li>
                    <%} else {%>
                <li class="dropdown">
                    <a class="dropbtn">USERS</a>
                    <div class="dropdown-content">
                        <a href="customer.jsp">CUSTOMER</a>
                        <a href="staff.jsp">STAFF</a>
                    </div>
                </li>
                <%}%>

                <li><a href="equipment.jsp">EQUIPMENTS</a></li>
                <li><a href="borrowing.jsp">BORROWING</a></li>
            </ul>  
        </nav>
        <div id="profile"class="dropdown">
            <button class="dropbtn"><i class="far fa-user-circle fa-lg"></i><span id="user"><%= session.getAttribute("staff_name")%></span></button>
            <div class="dropdown-content">
                <a href="index.html">LOG OUT</a>
            </div>
        </div>
    </body>
</html>
