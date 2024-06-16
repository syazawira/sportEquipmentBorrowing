/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Sport.com;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import Sport.com.Equipment;

/**
 *
 * @author LENOVO
 */
public class EquipmentDAO {
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

    public static int save(Equipment equipment) {
        int status = 0;
        try {
            Connection con = EquipmentDAO.getConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO equipment(equip_name, category, available_quantity) VALUES (?, ?, ?)");
            ps.setString(1, equipment.getEquip_name());
            ps.setString(2, equipment.getCategory());
            ps.setInt(3, equipment.getAvailable_quantity());
            status = ps.executeUpdate();
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return status;
    }

    public static int update(Equipment equipment) {
        int status = 0;
        try {
            Connection con = EquipmentDAO.getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE equipment SET equip_name=?, category=?, available_quantity=? WHERE equip_id=?");
            ps.setString(1, equipment.getEquip_name());
            ps.setString(2, equipment.getCategory());
            ps.setInt(3, equipment.getAvailable_quantity());
            ps.setInt(4, equipment.getEquip_id());
            status = ps.executeUpdate();
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return status;
    }

    public static int delete(int equipID) {
        int status = 0;
        String query = "DELETE FROM equipment WHERE equip_id=?";
        try (Connection con = EquipmentDAO.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, equipID);
            status = ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return status;
    }

    public static Equipment getEquipmentById(int id) {
        Equipment equipment = new Equipment();
        try {
            Connection con = EquipmentDAO.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM equipment WHERE equip_id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                equipment.setEquip_id(rs.getInt("equip_id"));
                equipment.setEquip_name(rs.getString("equip_name"));
                equipment.setCategory(rs.getString("category"));
                equipment.setAvailable_quantity(rs.getInt("available_quantity"));
            }
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return equipment;
    }

    public static List<Equipment> getAllEquipments() {
        List<Equipment> list = new ArrayList<>();
        try {
            Connection con = EquipmentDAO.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM equipment");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Equipment equipment = new Equipment();
                equipment.setEquip_id(rs.getInt("equip_id"));
                equipment.setEquip_name(rs.getString("equip_name"));
                equipment.setCategory(rs.getString("category"));
                equipment.setAvailable_quantity(rs.getInt("available_quantity"));
                list.add(equipment);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
