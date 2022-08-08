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
public class ProductDTO {
    private int ID;
    private String name;
    private String image;
    private float price;
    private int quantity;
    private String category;
    private Date importDate;
    private Date usingDate;

    public ProductDTO() {
        this.ID=0;
        this.name = "";
        this.image = "";
        this.price =0;
        this.quantity = 0;
        this.category = "";
        this.importDate = null;
        this.usingDate = null;
    }

    public ProductDTO(int ID, String name, String image, float price, int quantity, String category, Date importDate, Date usingDate) {
        this.ID = ID;
        this.name = name;
        this.image = image;
        this.price = price;
        this.quantity = quantity;
        this.category = category;
        this.importDate = importDate;
        this.usingDate = usingDate;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
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

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public Date getImportDate() {
        return importDate;
    }

    public void setImportDate(Date importDate) {
        this.importDate = importDate;
    }

    public Date getUsingDate() {
        return usingDate;
    }

    public void setUsingDate(Date usingDate) {
        this.usingDate = usingDate;
    }   
}
