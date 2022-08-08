/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import sample.DTO.OrderDTO;
import sample.DTO.OrderListDTO;
import sample.utils.DBUtils;

/**
 *
 * @author Phi Long
 */
public class OrderDAO {

    private static final String ADDORDER = " EXEC addOrder ?,?,?,?";
    private static final String GETALLORDER = "SELECT orderID, orderDate, total, userID, status FROM tblOrder WHERE userID=?";
    private static final String CONFIRMORDER = "UPDATE tblOrder SET status=1 WHERE orderID=?";

    public boolean addOrder(String orderDate, float total, int userID, boolean status) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(ADDORDER);
                ptm.setString(1, orderDate);
                ptm.setFloat(2, total);
                ptm.setInt(3, userID);
                ptm.setBoolean(4, check);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    
    public OrderListDTO getListOrder(int userID) throws SQLException{ 
        OrderListDTO  list = new OrderListDTO();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GETALLORDER);
                ptm.setInt(1, userID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int orderID=rs.getInt("orderID");
                    Date orderDate=rs.getDate("orderDate");
                    float total=rs.getFloat("total");
                    boolean status=rs.getBoolean("status");                   
                    list.getList().add(new OrderDTO(orderID, orderDate, total, userID, status));                   
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }
    
    public boolean confirmOrder(int orderID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CONFIRMORDER);
                ptm.setInt(1, orderID);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
}
