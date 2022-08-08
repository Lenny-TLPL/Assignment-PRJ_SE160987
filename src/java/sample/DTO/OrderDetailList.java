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
public class OrderDetailList {
    ArrayList<OrderDetailDTO> detailList= new ArrayList<>();

    public OrderDetailList() {
    }
    
    public OrderDetailList(ArrayList<OrderDetailDTO> detailList){
        this.detailList=detailList;
    }

    public ArrayList<OrderDetailDTO> getDetailList() {
        return detailList;
    }

    public void setDetailList(ArrayList<OrderDetailDTO> detailList) {
        this.detailList = detailList;
    }
    
    public boolean add(OrderDetailDTO detail){
        boolean check = false;
        boolean exist = false;
        if(this.detailList==null){
            this.detailList=new ArrayList<>();
        }
        for (OrderDetailDTO orderDetailDTO : detailList) {
            if(orderDetailDTO.getProductID()==detail.getProductID()){
                exist=true;
                return check=false;
            }
        }
        if(exist==false){
            this.detailList.add(detail);
            return check =true;
        }else{
            return check =false;
        }  
    }
}
