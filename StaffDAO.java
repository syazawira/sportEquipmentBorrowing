/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Sport.com;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import Sport.com.Staff;

/**
 *
 * @author LENOVO
 */
public class StaffDAO {
    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sportequipment", "root", "admin");
            System.out.println("Database connection successful.");
        } catch (Exception e) {
            System.out.println("Failed to connect to the database: " + e.getMessage());
            e.printStackTrace();
        }
        return con;
    }

    public static int save(Staff staff) {
        int status = 0;
        String query = "INSERT INTO staff(staff_name, username, password, staff_email, staff_phoneNo, role) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection con = StaffDAO.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, staff.getStaff_name());
            ps.setString(2, staff.getUsername());
            ps.setString(3, staff.getPassword());
            ps.setString(4, staff.getStaff_email());
            ps.setString(5, staff.getStaff_phoneNo());
            ps.setString(6, staff.getRole());
            status = ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return status;
    }

    public static int update(Staff staff) {
        int status = 0;
        String query = "UPDATE staff SET staff_name = ?, username = ?, password = ?, staff_email = ?, staff_phoneNo = ?, role = ? WHERE staff_id = ?";
        try (Connection con = StaffDAO.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, staff.getStaff_name());
            ps.setString(2, staff.getUsername());
            ps.setString(3, staff.getPassword());
            ps.setString(4, staff.getStaff_email());
            ps.setString(5, staff.getStaff_phoneNo());
            ps.setString(6, staff.getRole());
            ps.setInt(7, staff.getStaff_id());
            status = ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return status;
    }

    public static int delete(int staffID) {
        int status = 0;
        String query = "DELETE FROM staff WHERE staff_id=?";
        try (Connection con = StaffDAO.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, staffID);
            status = ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return status;
    }

    public static Staff getStaffById(int id) {
        Staff staff = new Staff();
        String query = "SELECT * FROM staff WHERE staff_id=?";
        try (Connection con = StaffDAO.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    staff.setStaff_id(rs.getInt("staff_id"));
                    staff.setStaff_name(rs.getString("staff_name"));
                    staff.setUsername(rs.getString("username"));
                    staff.setPassword(rs.getString("password"));
                    staff.setStaff_email(rs.getString("staff_email"));
                    staff.setStaff_phoneNo(rs.getString("staff_phoneNo"));
                    staff.setRole(rs.getString("role"));
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return staff;
    }

    public static List<Staff> getAllStaff() {
        List<Staff> list = new ArrayList<>();
        String query = "SELECT * FROM staff";
        try (Connection con = StaffDAO.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Staff staff = new Staff();
                staff.setStaff_id(rs.getInt("staff_id"));
                staff.setStaff_name(rs.getString("staff_name"));
                staff.setUsername(rs.getString("username"));
                staff.setPassword(rs.getString("password"));
                staff.setStaff_email(rs.getString("staff_email"));
                staff.setStaff_phoneNo(rs.getString("staff_phoneNo"));
                staff.setRole(rs.getString("role"));
                list.add(staff);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
