<%-- 
    Document   : doLogin
    Created on : 5 Jun 2024, 10:27:42 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <%
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sportequipment", "root", "admin");

                PreparedStatement staffPS = con.prepareStatement("SELECT staff_id,staff_name,role FROM staff WHERE username=? AND password=?");
                staffPS.setString(1, username);
                staffPS.setString(2, password);
                ResultSet staffRS = staffPS.executeQuery();

                if (staffRS.next()) {
                    String id = staffRS.getString("staff_id");
                    String name=staffRS.getString("staff_name");
                    String role = staffRS.getString("role");
                    session.setAttribute("userRole", role);
                    session.setAttribute("staff_name", name);
                    session.setAttribute("staff_id", id);
                    response.sendRedirect("home.jsp");
                } else {
                    out.println("<script>alert(\"Invalid username or password.\"); window.location.href='index.html';</script>");
                }
                con.close();
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                out.println("<script>alert(\"Invalid username or password.\"); window.location.href='index.html';</script>");
            }
        %>
    </body>
</html>
