/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.DTO;

import java.sql.Date;

/**
 *
 * @author Phi Long
 */
public class OrderDTO {
    private int orderID;
    private Date orderDate;
    private float total;
    private int userID;
    private boolean status;
    public OrderDTO(int orderID, Date orderDate, float total, int userID, boolean status) {
        this.orderID = orderID;
        this.orderDate = orderDate;
        this.total = total;
        this.userID = userID;
        this.status=status;
    }

    public OrderDTO() {
        this.orderID = 0;
        this.orderDate = null;
        this.total = 0;
        this.userID = 0;
        this.status=false;
    }

    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }
    
    

}
