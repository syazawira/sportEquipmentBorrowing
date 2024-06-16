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
import Sport.com.StaffDAO;
import Sport.com.Staff;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "SaveStaffServlet", urlPatterns = {"/SaveStaffServlet"})
public class SaveStaffServlet extends HttpServlet {

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
        String name = request.getParameter("staff_name");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("staff_email");
        String phoneNo = request.getParameter("staff_phoneNo");
        String role = request.getParameter("role");

        // Create Customer object and set its properties
        Staff staff = new Staff();
        staff.setStaff_name(name);
        staff.setUsername(username);
        staff.setPassword(password);
        staff.setStaff_email(email);
        staff.setStaff_phoneNo(phoneNo);
        staff.setRole(role);

        // Save customer details in the database
        int result = StaffDAO.save(staff);

        if (result > 0) {
            out.print("<script>alert('Staff record saved successfully!');</script>");
            request.getRequestDispatcher("staff.jsp").include(request, response);
        } else {
            out.print("<script>alert('Sorry! Unable to save staff record.');</script>");
            request.getRequestDispatcher("addStaff.jsp").include(request, response);
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
