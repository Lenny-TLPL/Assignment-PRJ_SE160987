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
import sample.DTO.CartDTO;
import sample.DTO.ProductDTO;

/**
 *
 * @author Phi Long
 */
public class AddController extends HttpServlet {

    private static final String ERROR="error.jsp";
    private static final String SUCCESS="home.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {   
            HttpSession session = request.getSession();
            if(session.getAttribute("LOGIN_USER")==null){
                url="login.jsp";
            }else{
                int productID = Integer.parseInt(request.getParameter("ProductID"));
                String productName = request.getParameter("ProductName");
                int quantity =Integer.parseInt(request.getParameter("ProductQuantity"));
                String image = request.getParameter("ProductImage");
                float price =(float) (quantity * (Float.parseFloat(request.getParameter("ProductPrice"))));
             
                session.removeAttribute("MESSAGE");
                CartDTO cart=(CartDTO)session.getAttribute("CART");
                ProductDTO product = new ProductDTO(productID, productName, image, price, quantity, "",null, null);
                if(cart==null){
                    cart = new CartDTO();  
                } 
                if(cart.add(product)){
                    session.setAttribute("CART", cart);
                    session.setAttribute("MESSAGE", "ADDED: "+ productName+" - "+ quantity + "kg successfully!" );
                    url=SUCCESS;
                }else{
                    session.setAttribute("MESSAGE", "ADDED: "+ productName+" - "+ quantity + "kg failed!" );
                }
            }
            
        } catch (Exception e) {
            log("Error at AddController: "+e.toString());
        }finally{
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
