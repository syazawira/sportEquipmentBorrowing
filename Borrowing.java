/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Sport.com;

import java.time.LocalDate;

/**
 *
 * @author LENOVO
 */
public class Borrowing {
    private int borrowing_id, cust_id, equip_id, staff_id, quantity;
    private LocalDate borrowDate, returnDate;
    private String status;

    /**
     * @return the borrowing_id
     */
    public int getBorrowing_id() {
        return borrowing_id;
    }

    /**
     * @param borrowing_id the borrowing_id to set
     */
    public void setBorrowing_id(int borrowing_id) {
        this.borrowing_id = borrowing_id;
    }

    /**
     * @return the cust_id
     */
    public int getCust_id() {
        return cust_id;
    }

    /**
     * @param cust_id the cust_id to set
     */
    public void setCust_id(int cust_id) {
        this.cust_id = cust_id;
    }

    /**
     * @return the equip_id
     */
    public int getEquip_id() {
        return equip_id;
    }

    /**
     * @param equip_id the equip_id to set
     */
    public void setEquip_id(int equip_id) {
        this.equip_id = equip_id;
    }

    /**
     * @return the staff_id
     */
    public int getStaff_id() {
        return staff_id;
    }

    /**
     * @param staff_id the staff_id to set
     */
    public void setStaff_id(int staff_id) {
        this.staff_id = staff_id;
    }

    /**
     * @return the quantity
     */
    public int getQuantity() {
        return quantity;
    }

    /**
     * @param quantity the quantity to set
     */
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    /**
     * @return the borrowDate
     */
    public LocalDate getBorrowDate() {
        return borrowDate;
    }

    /**
     * @param borrowDate the borrowDate to set
     */
    public void setBorrowDate(LocalDate borrowDate) {
        this.borrowDate = borrowDate;
    }

    /**
     * @return the returnDate
     */
    public LocalDate getReturnDate() {
        return returnDate;
    }

    /**
     * @param returnDate the returnDate to set
     */
    public void setReturnDate(LocalDate returnDate) {
        this.returnDate = returnDate;
    }

    /**
     * @return the status
     */
    public String getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }
    
    
}
