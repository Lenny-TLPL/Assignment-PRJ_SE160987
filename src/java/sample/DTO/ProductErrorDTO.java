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
public class ProductErrorDTO {
    private String errorMessage;
    private String ID;
    private String name;
    private String image;
    private String price;
    private String quantity;
    private String category;
    private String importDate;
    private String usingDate;

    public ProductErrorDTO(String errorMessage, String ID, String name, String image, String price, String quantity, String category, String importDate, String usingDate) {
        this.errorMessage = errorMessage;
        this.ID = ID;
        this.name = name;
        this.image = image;
        this.price = price;
        this.quantity = quantity;
        this.category = category;
        this.importDate = importDate;
        this.usingDate = usingDate;
    }

    public ProductErrorDTO() {
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
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

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getImportDate() {
        return importDate;
    }

    public void setImportDate(String importDate) {
        this.importDate = importDate;
    }

    public String getUsingDate() {
        return usingDate;
    }

    public void setUsingDate(String usingDate) {
        this.usingDate = usingDate;
    }


    public String getErrorMessage() {
        return errorMessage;
    }

    public void setErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage;
    }
    
    
}
