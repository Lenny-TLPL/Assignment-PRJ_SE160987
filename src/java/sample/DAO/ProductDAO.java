/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.DAO;

import sample.utils.DBUtils;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import sample.DTO.ProductDTO;

/**
 *
 * @author Phi Long
 */
public class ProductDAO {
    private static final String GETALLPRODUCT=" SELECT productID, productName, image, price, quantity, categoryName, importDate, usingDate FROM tblProduct p"
            + " JOIN tblCategory c ON p.categoryID = c.categoryID" ;
    private static final String SEARCHPRODUCT=" SELECT productID, productName, image, price, quantity, categoryName, importDate, usingDate FROM tblProduct p"
            + " JOIN tblCategory c ON p.categoryID = c.categoryID WHERE p.productName LIKE ? AND p.quantity >0 " ;
    private static final String PRODUCTDETAIL=" SELECT productID, productName, image, price, quantity, categoryName, importDate, usingDate FROM tblProduct p"
            + " JOIN tblCategory c ON p.categoryID = c.categoryID WHERE p.productID =? AND p.quantity >0 " ;
    private static final String GETPRODUCT=" SELECT productID, productName, image, price, quantity, categoryName, importDate, usingDate FROM tblProduct p"
            + " JOIN tblCategory c ON p.categoryID = c.categoryID WHERE p.productName COLLATE SQL_Latin1_General_CP1_CS_AS = ?" ;
    private static final String GETPRODUCTID=" SELECT productID, productName, image, price, quantity, categoryName, importDate, usingDate FROM tblProduct p"
            + " JOIN tblCategory c ON p.categoryID = c.categoryID WHERE p.productName COLLATE SQL_Latin1_General_CP1_CS_AS = ? AND p.productID <>?" ;
    private static final String GETREMAIN=" SELECT quantity FROM tblProduct WHERE productID=?";
    private static final String GETCATEGORY=" SELECT categoryID, categoryName FROM tblCategory";
    private static final String DELETEPRODUCT="DELETE FROM tblProduct WHERE productID=? AND productName COLLATE SQL_Latin1_General_CP1_CS_AS =?";
    private static final String ADDPRODUCT="EXEC addProduct ?, ?, ?, ?, ?, ?, ?";
    private static final String UPDATEPRODUCT="UPDATE tblProduct SET productName =?, image=?, price=?, quantity=?, categoryID=?, importDate=?, usingDate=? WHERE productID=? ";
    private static final String SELLPRODUCT="EXEC sellProduct ?,?";
    
    public ArrayList<ProductDTO> getListProduct() throws SQLException{ 
        ArrayList<ProductDTO>  list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GETALLPRODUCT);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int productID = rs.getInt("productID");
                    String productName= rs.getString("productName");
                    String image= rs.getString("image");
                    float price= rs.getFloat("price");
                    int quantity= rs.getInt("quantity");
                    String category= rs.getString("categoryName");
                    Date importDate = rs.getDate("importDate");                   
                    Date usingDate = rs.getDate("usingDate");                  
                    list.add(new ProductDTO(productID, productName, image, price, quantity, category, importDate, usingDate));
                    
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
    
    public ArrayList<ProductDTO> getListProduct(String searchValue) throws SQLException{ 
        ArrayList<ProductDTO>  list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCHPRODUCT);
                ptm.setString(1, "%"+ searchValue +"%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int productID = rs.getInt("productID");
                    String productName= rs.getString("productName");
                    String image= rs.getString("image");
                    float price= rs.getFloat("price");
                    int quantity= rs.getInt("quantity");
                    String category= rs.getString("categoryName");
                    Date importDate = rs.getDate("importDate");                   
                    Date usingDate = rs.getDate("usingDate");                  
                    list.add(new ProductDTO(productID, productName, image, price, quantity, category, importDate, usingDate));
                    
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
    
    public int getRemain(int ID) throws SQLException{ 
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        int quantity=0;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GETREMAIN);
                ptm.setInt(1,ID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    quantity= rs.getInt("quantity");    
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
        return quantity;
    }
        
    public ProductDTO getProduct(int ID) throws SQLException{ 
        ProductDTO product = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(PRODUCTDETAIL);
                ptm.setInt(1, ID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int productID = rs.getInt("productID");
                    String productName= rs.getString("productName");
                    String image= rs.getString("image");
                    float price= rs.getFloat("price");
                    int quantity= rs.getInt("quantity");
                    String category= rs.getString("categoryName");
                    Date importDate = rs.getDate("importDate");                   
                    Date usingDate = rs.getDate("usingDate");                  
                    product = new ProductDTO(productID, productName, image, price, quantity, category, importDate, usingDate);  
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
        return product;
    }
    
    public boolean getProduct(String productName) throws SQLException{ 
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GETPRODUCT);
                ptm.setString(1, productName);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    check=true;
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
        return check;
    }
    
    public boolean getProduct(String productName, int productID) throws SQLException{ 
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GETPRODUCTID);
                ptm.setString(1, productName);
                ptm.setInt(2,productID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    check=true;
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
        return check;
    }
    
    public ArrayList<String> getCategory() throws SQLException{
        ArrayList<String> categoryList = new ArrayList<>();
        String category="";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GETCATEGORY);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    category+= rs.getString("categoryID");
                    category+= "-";
                    category+= rs.getString("categoryName");
                    categoryList.add(category);
                    category="";
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
        return categoryList;
    }
    
    public boolean deleteProduct(int productID, String productName) throws SQLException{
        boolean check=false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETEPRODUCT);
                ptm.setInt(1,productID );
                ptm.setString(2, productName);
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
    
    public boolean addProduct(String productName, String productImage, float productPrice, int productQuantity, int productCategory, String importDate, String usingDate) throws SQLException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(ADDPRODUCT);
                ptm.setString(1,productName );
                ptm.setString(2,productImage );
                ptm.setFloat(3,productPrice );
                ptm.setInt(4,productQuantity );
                ptm.setInt(5, productCategory);
                ptm.setString(6,importDate );
                ptm.setString(7,usingDate );
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
    
    public boolean updateProduct(int productID, String productName, String productImage, float productPrice, int productQuantity, int productCategory, String importDate, String usingDate) throws SQLException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATEPRODUCT);
                ptm.setString(1,productName );
                ptm.setString(2,productImage );
                ptm.setFloat(3,productPrice );
                ptm.setInt(4,productQuantity );
                ptm.setInt(5, productCategory);
                ptm.setString(6,importDate );
                ptm.setString(7,usingDate );
                ptm.setInt(8, productID);
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
    
    public boolean sellProduct(int ID, int quantity) throws SQLException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SELLPRODUCT);
                ptm.setInt(1,ID );
                ptm.setInt(2, quantity);
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
