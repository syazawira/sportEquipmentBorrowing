/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Sport.com;

import java.util.*;
import java.sql.*;
import java.sql.Date;

/**
 *
 * @author LENOVO
 */
public class BorrowingDAO {
    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sportequipment", "root", "admin");
            System.out.println("Database connection successful.");
        } catch (Exception e) {
            System.out.println("Failed to connect to the database: " + e.getMessage());
        }
        return con;
    }

    public static int save(Borrowing borrow) {
        int status = 0;
        try {
            Connection con = BorrowingDAO.getConnection();
            PreparedStatement myPS = con.prepareStatement("INSERT INTO borrowing(cust_id,equip_id,staff_id,quantity,borrowDate,returnDate,status)VALUES(?,?,?,?,?,?,?)");
            myPS.setInt(1, borrow.getCust_id());
            myPS.setInt(2, borrow.getEquip_id());
            myPS.setInt(3, borrow.getStaff_id());
            myPS.setInt(4, borrow.getQuantity());
            myPS.setString(5, borrow.getBorrowDate().toString());
            if (borrow.getReturnDate() == null) {
                myPS.setNull(6, java.sql.Types.DATE);
            } else {
                myPS.setDate(6, java.sql.Date.valueOf(borrow.getReturnDate()));
            }
            myPS.setString(7, borrow.getStatus());

            status = myPS.executeUpdate();

            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return status;
    }

    public static int update(Borrowing borrow) {
        int status = 0;
        try {
            Connection con = BorrowingDAO.getConnection();

            String currentStatus = null;
            PreparedStatement psCurrentStatus = con.prepareStatement("SELECT status FROM borrowing WHERE borrowing_id = ?");
            psCurrentStatus.setInt(1, borrow.getBorrowing_id());
            ResultSet rsCurrentStatus = psCurrentStatus.executeQuery();
            if (rsCurrentStatus.next()) {
                currentStatus = rsCurrentStatus.getString("status");
            }

            PreparedStatement myPS = con.prepareStatement("UPDATE borrowing SET cust_id=?, equip_id=?, staff_id=?, quantity=?, borrowDate=?, returnDate=?, status=? WHERE borrowing_id=?");
            myPS.setInt(1, borrow.getCust_id());
            myPS.setInt(2, borrow.getEquip_id());
            myPS.setInt(3, borrow.getStaff_id());
            myPS.setInt(4, borrow.getQuantity());
            myPS.setString(5, borrow.getBorrowDate().toString());
            if (borrow.getReturnDate() == null) {
                myPS.setNull(6, java.sql.Types.DATE);
            } else {
                myPS.setDate(6, java.sql.Date.valueOf(borrow.getReturnDate()));
            }
            myPS.setString(7, borrow.getStatus());
            myPS.setInt(8, borrow.getBorrowing_id());
            status = myPS.executeUpdate();

            if ("Borrowed".equals(currentStatus) && "Returned".equals(borrow.getStatus())) {
                updateAvailableQuantity(borrow.getEquip_id(), borrow.getQuantity());
            }

            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return status;
    }

    public static Borrowing getBorrowingByCustId(int id) {
        Borrowing borrow = new Borrowing();

        try {
            Connection con = BorrowingDAO.getConnection();
            PreparedStatement myPS = con.prepareStatement("select * from borrowing where cust_id=? ORDER BY borrow_date DESC");
            myPS.setInt(1, id);
            ResultSet rs = myPS.executeQuery();
            if (rs.next()) {
                borrow.setBorrowing_id(rs.getInt(1));
                borrow.setCust_id(rs.getInt(2));
                borrow.setEquip_id(rs.getInt(3));
                borrow.setStaff_id(rs.getInt(4));
                borrow.setQuantity(rs.getInt(5));
                borrow.setBorrowDate(rs.getDate(6).toLocalDate());
                Date returnDate = rs.getDate(7);
                if (returnDate != null) {
                    borrow.setReturnDate(returnDate.toLocalDate());
                } else {
                    borrow.setReturnDate(null);
                }
                borrow.setStatus(rs.getString(8));

            }
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return borrow;
    }

    public static Borrowing getBorrowingById(int id) {
        Borrowing borrow = new Borrowing();

        try {
            Connection con = BorrowingDAO.getConnection();
            PreparedStatement myPS = con.prepareStatement("select * from borrowing where borrowing_id=?");
            myPS.setInt(1, id);
            ResultSet rs = myPS.executeQuery();
            if (rs.next()) {
                borrow.setBorrowing_id(rs.getInt(1));
                borrow.setCust_id(rs.getInt(2));
                borrow.setEquip_id(rs.getInt(3));
                borrow.setStaff_id(rs.getInt(4));
                borrow.setQuantity(rs.getInt(5));
                borrow.setBorrowDate(rs.getDate(6).toLocalDate());
                Date returnDate = rs.getDate(7);
                if (returnDate != null) {
                    borrow.setReturnDate(returnDate.toLocalDate());
                } else {
                    borrow.setReturnDate(null);
                }
                borrow.setStatus(rs.getString(8));

            }
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return borrow;
    }

    public static List<Borrowing> getAllBorrowing() {
        List<Borrowing> list = new ArrayList<Borrowing>();

        try {
            Connection con = BorrowingDAO.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from borrowing");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Borrowing borrow = new Borrowing();
                borrow.setBorrowing_id(rs.getInt(1));
                borrow.setCust_id(rs.getInt(2));
                borrow.setEquip_id(rs.getInt(3));
                borrow.setStaff_id(rs.getInt(4));
                borrow.setQuantity(rs.getInt(5));
                borrow.setBorrowDate(rs.getDate(6).toLocalDate());
                Date returnDate = rs.getDate(7);
                if (returnDate != null) {
                    borrow.setReturnDate(returnDate.toLocalDate());
                } else {
                    borrow.setReturnDate(null);
                }
                borrow.setStatus(rs.getString(8));
                list.add(borrow);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static int getAvailableQuantity(int equipmentID) {
        int availableQuantity = 0;
        try {
            Connection con = BorrowingDAO.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT available_quantity FROM equipment WHERE equip_id = ?");
            ps.setInt(1, equipmentID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                availableQuantity = rs.getInt("available_quantity");
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return availableQuantity;
    }

    public static int updateAvailableQuantity(int equipmentID, int borrowedQuantity) {
        int status = 0;
        try {
            Connection con = BorrowingDAO.getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE equipment SET available_quantity = available_quantity + ? WHERE equip_id = ?");
            ps.setInt(1, borrowedQuantity);
            ps.setInt(2, equipmentID);
            status = ps.executeUpdate();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
}

