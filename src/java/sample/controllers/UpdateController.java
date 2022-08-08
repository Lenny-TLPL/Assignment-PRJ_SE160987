/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.DAO.ProductDAO;
import sample.DTO.ProductErrorDTO;
import sample.utils.DateUtils;

/**
 *
 * @author Phi Long
 */
public class UpdateController extends HttpServlet {

    private static final String ERROR="admin.jsp";
    private static final String SUCCESS="admin.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            int productID=Integer.parseInt(request.getParameter("ProductID"));
            String productName=request.getParameter("ProductName").toLowerCase();
            String productImage=request.getParameter("ProductImage");
            float productPrice=Float.parseFloat(request.getParameter("ProductPrice"));
            int productQuantity=Integer.parseInt(request.getParameter("ProductQuantity"));
            String[] category = request.getParameter("ProductCategory").split("-");
            int productCategory=Integer.parseInt(category[0]);
            String importDateS = request.getParameter("ProductImportDate");
            String usingDateS = request.getParameter("ProductUsingDate");
            HttpSession session = request.getSession();
            boolean check = true;   
            ProductDAO productDao = new ProductDAO();
            ProductErrorDTO productError = new ProductErrorDTO();
            if (productDao.getProduct(productName,productID)) {
                productError.setName(productName+" is already existed in the database.");
                check=false;
            }
            if(DateUtils.inputValidDate(importDateS)==false){
                productError.setImportDate("ImportDate is invalid");
                check=false;
            }
            if(DateUtils.inputValidDate(usingDateS)==false){
                productError.setUsingDate("UsingDate is invalid");
                check=false;
            }
            if(DateUtils.inputValidDate(importDateS)==true&&DateUtils.inputValidDate(usingDateS)==true){
                boolean checkDate=DateUtils.checkDateAfter(importDateS,usingDateS);
                if (checkDate){
                    productError.setUsingDate("Invalid. UsingDate can not be before importDate");
                    check=false;
                }
            }
            if(check){
                boolean checkUpdate=productDao.updateProduct(productID, productName, productImage, productPrice, productQuantity, productCategory, importDateS, usingDateS);
                if(checkUpdate){
                    url=SUCCESS;
                    session.setAttribute("UPDATE_SUCCESS", "Product has been update");
                }else{
                    productError.setErrorMessage("Error while updating product");
                }
            }else{
                productError.setErrorMessage("Error while updating product");   
                session.setAttribute("UPDATE_PRODUCT_ERROR", productError);
            }
        } catch (Exception e) {
            log("Error at UpdateController : " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
