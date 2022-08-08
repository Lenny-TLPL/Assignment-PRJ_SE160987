/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.DTO;

import java.util.ArrayList;

/**
 *
 * @author Phi Long
 */
public class CartDTO {
    private ArrayList<ProductDTO> cart;
    
    public CartDTO(){
        
    }

    public CartDTO(ArrayList<ProductDTO> cart) {
        this.cart = cart;
    }

    public ArrayList<ProductDTO> getCart() {
        return cart;
    }

    public void setCart(ArrayList<ProductDTO> cart) {
        this.cart = cart;
    }
    
    public boolean add(ProductDTO product){
        boolean check = false;
        boolean exist = false;
        if(this.cart==null){
            this.cart=new ArrayList<>();
        }
        for (ProductDTO productDTO : cart) {
            if (productDTO.getID()==product.getID()){
                int newQuantity = productDTO.getQuantity()+product.getQuantity();
                float newPrice = productDTO.getPrice()+product.getPrice();
                productDTO.setQuantity(newQuantity);
                productDTO.setPrice(newPrice);
                exist = true;
                return check = true;
            }
        }
        if(exist == false){
            this.cart.add(product);
            return check=true;
        }else{
            return check=false;
        }      
    }
    
    public boolean remove (int id){
        boolean check = false;
        int i = 0;     
        while(i < this.cart.size()){
            if(this.cart.get(i).getID()==id){
                this.cart.remove(this.cart.get(i));
                check=true;
                i--;
            }
            i++;
        }        
        return check;
    }
    
    public boolean edit(int ID , int quantity, float price){
        boolean check = false;
        if(this.cart!=null){
            for (ProductDTO productDTO : cart) {
                if (productDTO.getID()==ID){
                    float newPrice= (float) price*quantity;
                    productDTO.setQuantity(quantity);
                    productDTO.setPrice(newPrice);
                    return check = true;
                }
            }
        }
        return check;
    }
}
