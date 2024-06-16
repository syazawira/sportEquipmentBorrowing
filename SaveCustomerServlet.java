/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Sport.com;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Sport.com.CustomerDAO;
import Sport.com.Customer;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "SaveCustomerServlet", urlPatterns = {"/SaveCustomerServlet"})
public class SaveCustomerServlet extends HttpServlet {

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

        // Retrieve form parameters
        String cust_name = request.getParameter("cust_name");
        String cust_email = request.getParameter("cust_email");
        String cust_phoneNo = request.getParameter("cust_phoneNo");

        // Create Customer object and set its properties
        Customer customer = new Customer();
        customer.setCust_name(cust_name);
        customer.setCust_email(cust_email);
        customer.setCust_phoneNo(cust_phoneNo);

        // Save customer details in the database
        int result = CustomerDAO.save(customer);

        if (result > 0) {
            out.print("<script>alert('Customer record saved successfully!');</script>");
            request.getRequestDispatcher("customer.jsp").include(request, response);
        } else {
            out.print("<script>alert('Sorry! Unable to save customer record.');</script>");
            request.getRequestDispatcher("addCustomer.jsp").include(request, response);
        }

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
