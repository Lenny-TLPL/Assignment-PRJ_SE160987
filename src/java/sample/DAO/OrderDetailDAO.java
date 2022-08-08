/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import sample.utils.DBUtils;

/**
 *
 * @author Phi Long
 */
public class OrderDetailDAO {
    private static final String ADDORDERDETAIL="EXEC addOrderDetail ?,?,?,?";
    
    public boolean addOrderDetail(String date, float price, int quantity, int productID) throws SQLException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(ADDORDERDETAIL);
                ptm.setString(1, date);
                ptm.setFloat(2, price);
                ptm.setInt(3, quantity);
                ptm.setInt(4, productID);
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
