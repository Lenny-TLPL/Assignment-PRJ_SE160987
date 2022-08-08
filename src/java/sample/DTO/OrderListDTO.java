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
public class OrderListDTO {
    ArrayList<OrderDTO> list =new ArrayList<>();

    public OrderListDTO() {
    }
    
    public OrderListDTO(ArrayList<OrderDTO> list) {
        this.list=list;
    }

    public ArrayList<OrderDTO> getList() {
        return list;
    }

    public void setList(ArrayList<OrderDTO> list) {
        this.list = list;
    }
    
}
