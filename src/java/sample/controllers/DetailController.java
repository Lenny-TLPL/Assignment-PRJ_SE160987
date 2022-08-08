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
import sample.DAO.ProductDAO;
import sample.DTO.ProductDTO;
import sample.DTO.UserError;


/**
 *
 * @author Phi Long
 */
public class DetailController extends HttpServlet {

    private static final String ERROR = "productDetail.jsp";
    private static final String SUCCESS = "productDetail.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            UserError detailError = new UserError();
            int productID =Integer.parseInt(request.getParameter("ProductID")) ;
            ProductDAO dao = new ProductDAO();
            ProductDTO product = dao.getProduct(productID);
            if(product!=null){
                request.setAttribute("PRODUCT_DETAIL",product);
                url=SUCCESS;
            }else{
                detailError.setErrorMessage("Sorry this product is not availble or something went wrong so we can not show you");
                request.setAttribute("SEARCH_ERROR", detailError);
            }
        } catch (Exception e) {
            log("Error at DetailController: "+e.toString());
        }finally{
            request.getRequestDispatcher(url).forward(request,response);
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
