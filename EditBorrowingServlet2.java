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
import Sport.com.Borrowing;
import Sport.com.BorrowingDAO;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "EditBorrowingServlet2", urlPatterns = {"/EditBorrowingServlet2"})
public class EditBorrowingServlet2 extends HttpServlet {

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
        
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        int staff_id = Integer.parseInt(request.getParameter("staff_id"));
        int cust_id = Integer.parseInt(request.getParameter("cust_id"));
        int equip_id = Integer.parseInt(request.getParameter("equip_id"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        LocalDate borrowDate = LocalDate.parse(request.getParameter("borrowDate"), formatter);
        LocalDate returnDate = LocalDate.parse(request.getParameter("returnDate"), formatter);
        /*String returnDateStr = request.getParameter("returnDate");
        LocalDate returnDate = (returnDateStr != null && !returnDateStr.isEmpty()) ? LocalDate.parse(returnDateStr, formatter) : null;*/
        String borrowStatus = request.getParameter("status");
        int borrowing_id=Integer.parseInt(request.getParameter("borrowing_id"));

        Borrowing borrow = new Borrowing();
        borrow.setCust_id(cust_id);
        borrow.setStaff_id(staff_id);
        borrow.setEquip_id(equip_id);
        borrow.setQuantity(quantity);
        borrow.setBorrowDate(borrowDate);
        borrow.setReturnDate(returnDate);
        borrow.setStatus(borrowStatus);
        borrow.setBorrowing_id(borrowing_id);

        int status=BorrowingDAO.update(borrow);
        if (status > 0) {
            out.print("<script>alert('Record updated successfully!');</script>");
            request.getRequestDispatcher("borrowing.jsp").include(request, response);
        } else {
            out.print("<script>alert('Sorry! Unable to update record.');</script>");
            request.getRequestDispatcher("Borrowing.java").include(request, response);
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
