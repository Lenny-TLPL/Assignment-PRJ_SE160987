/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.DTO;

/**
 *
 * @author Phi Long
 */
public class OrderDetailDTO {
    private int detailID;
    private float price;
    private int quantity;
    private int orderID;
    private int productID;

    public OrderDetailDTO(int detailID, float price, int quantity, int orderID, int productID) {
        this.detailID = detailID;
        this.price = price;
        this.quantity = quantity;
        this.orderID = orderID;
        this.productID = productID;
    }

    public OrderDetailDTO() {
        this.detailID = 0;
        this.price = 0;
        this.quantity = 0;
        this.orderID = 0;
        this.productID = 0;
    }

    public int getDetailID() {
        return detailID;
    }

    public void setDetailID(int detailID) {
        this.detailID = detailID;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }
         
    
}
