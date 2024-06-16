/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Sport.com;

/**
 *
 * @author LENOVO
 */

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import Sport.com.Customer;

public class CustomerDAO {
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

    public static int save(Customer customer) {
        int status = 0;
        try {
            Connection con = CustomerDAO.getConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO customer(cust_name, cust_email, cust_phoneNo) VALUES (?, ?, ?)");
            ps.setString(1, customer.getCust_name());
            ps.setString(2, customer.getCust_email());
            ps.setString(3, customer.getCust_phoneNo());
            status = ps.executeUpdate();
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return status;
    }

    public static int update(Customer customer) {
        int status = 0;
        try {
            Connection con = CustomerDAO.getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE customer SET cust_name=?, cust_email=?, cust_phoneNo=? WHERE cust_id=?");
            ps.setString(1, customer.getCust_name());
            ps.setString(2, customer.getCust_email());
            ps.setString(3, customer.getCust_phoneNo());
            ps.setInt(4, customer.getCust_id());
            status = ps.executeUpdate();
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return status;
    }

    public static int delete(int custID) {
        int status = 0;
        String query = "DELETE FROM customer WHERE cust_id=?";
        try (Connection con = StaffDAO.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, custID);
            status = ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return status;
    }

    public static Customer getCustomerById(int id) {
        Customer customer = new Customer();
        try {
            Connection con = CustomerDAO.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM customer WHERE cust_id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                customer.setCust_id(rs.getInt("cust_id"));
                customer.setCust_name(rs.getString("cust_name"));
                customer.setCust_email(rs.getString("cust_email"));
                customer.setCust_phoneNo(rs.getString("cust_phoneNo"));
            }
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return customer;
    }

    public static List<Customer> getAllCustomers() {
        List<Customer> list = new ArrayList<>();
        try {
            Connection con = CustomerDAO.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM customer");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Customer customer = new Customer();
                customer.setCust_id(rs.getInt("cust_id"));
                customer.setCust_name(rs.getString("cust_name"));
                customer.setCust_email(rs.getString("cust_email"));
                customer.setCust_phoneNo(rs.getString("cust_phoneNo"));
                list.add(customer);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}