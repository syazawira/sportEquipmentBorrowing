/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Sport.com;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "EditCustomerServlet", urlPatterns = {"/EditCustomerServlet"})
public class EditCustomerServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String customerId = request.getParameter("cust_id");
        int id = Integer.parseInt(customerId);
        Customer customer = CustomerDAO.getCustomerById(id);
        
        request.setAttribute("customer", customer);
        request.getRequestDispatcher("/editCustomer.jsp").forward(request, response);

        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>");
        out.println("<meta name='viewport' content='width=device-width, initial-scale=1.0'>");
        out.println("<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Stardos Stencil'>");
        out.println("<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>");
        out.println("<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css'>");
        out.println("<link rel='stylesheet' href='css/general.css'>");
        out.println("<link rel='stylesheet' href='css/form.css'>");
        out.println("<title>Update Customer</title>");
        out.println("</head>");
        out.println("<header>");
        RequestDispatcher dispatcher = request.getRequestDispatcher("/header.jsp");
        dispatcher.include(request, response);
        out.println("</header>");
        out.println("<body>");
        out.println("<form method='post' action='EditCustomerServlet2'>");
        out.println("<h1 class='title'>Update Customer Details</h1>");
        out.println("<table>");
        out.println("<tr class='section'>");
        out.println("<td class='div'><label for='cust_id'>Customer ID:</label><br><input type='number' name='cust_id' value='" + customer.getCust_id() + "' readonly></td>");
        out.println("<td class='div'><label for='cust_name'>Name:</label><br><input type='text' name='cust_name' value='" + customer.getCust_name() + "' required></td>");
        out.println("</tr>");
        out.println("<tr class='section'>");
        out.println("<td class='div'><label for='cust_email'>Email:</label><br><input type='email' name='cust_email' value='" + customer.getCust_email() + "' required></td>");
        out.println("<td class='div'><label for='cust_phoneNo'>Phone Number:</label><br><input type='text' name='cust_phoneNo' value='" + customer.getCust_phoneNo() + "' required></td>");
        out.println("</tr>");
        out.println("</table><br>");
        out.println("<div class='button-container'>");
        out.println("<button id=\"cancelBtn\" type=\"reset\" class=\"submitBtn\" onclick=\"window.location.href='customer.jsp'\" style=\"background-color: grey;\">CANCEL</button>");
        out.println("<button id=\"submitBtn\" type=\"submit\" class=\"submitBtn\">SAVE</button>");
        out.println("<input type='hidden' name='cust_id' value='" + customer.getCust_id() + "'>");
        out.println("</form>");
        out.println("</body>");
        out.println("<footer>");
        RequestDispatcher dispatcherb = request.getRequestDispatcher("/footer.jsp");
        dispatcherb.include(request, response);
        out.println("</footer>");
        out.println("</html>");

        out.close();
    }


    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
