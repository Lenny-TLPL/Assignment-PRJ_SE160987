/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.DAO.ProductDAO;
import sample.DTO.CartDTO;
import sample.DTO.UserError;

/**
 *
 * @author Phi Long
 */
public class CheckOutController extends HttpServlet {

    private static final String ERROR = "cart.jsp";
    private static final String SUCCESS = "order.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            CartDTO cart = (CartDTO) session.getAttribute("CART");
            ProductDAO productDao = new ProductDAO();
            UserError userError=new UserError();
            userError.setErrorMessage("Please lower your quantity.");
            ArrayList<Integer> invalidProduct = new ArrayList<>();
            for (int i = 0; i < cart.getCart().size(); i++) {
                if (cart.getCart().get(i).getQuantity() > productDao.getRemain(cart.getCart().get(i).getID())) {
                    invalidProduct.add(cart.getCart().get(i).getID());
                }
            }
            if(invalidProduct.size()>0){
                for (int i = 0; i <invalidProduct.size(); i++) {
                    String name=productDao.getProduct(invalidProduct.get(i)).getName();
                    int quantity=productDao.getProduct(invalidProduct.get(i)).getQuantity();    
                    userError.setErrorMessage(userError.getErrorMessage()+" Only "+quantity+"kg " +name+" left.");   
                }
                request.setAttribute("CHECKOUT_ERROR",userError.getErrorMessage());
            }else{
                url=SUCCESS;
            }
            
        } catch (Exception e) {
            log("Errot at  CheckOutController : " + e.toString());
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
