/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.DAO.OrderDAO;
import sample.DAO.OrderDetailDAO;
import sample.DAO.ProductDAO;
import sample.DTO.CartDTO;
import sample.DTO.OrderListDTO;
import sample.DTO.UserDTO;
import sample.confirmMail.ConfirmMail;

/**
 *
 * @author Phi Long
 */
@WebServlet(name = "OrderController", urlPatterns = {"/OrderController"})
public class OrderController extends HttpServlet {

    private static final String ERROR="order.jsp";
    private static final String SUCCESS="myOrder.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            float price = Float.parseFloat(request.getParameter("TotalPrice"));
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
            LocalDateTime now = LocalDateTime.now();  
            String date=dtf.format(now);
            OrderDAO orderDao= new OrderDAO();
            HttpSession session =request.getSession();
            UserDTO user=(UserDTO)session.getAttribute("LOGIN_USER");
            CartDTO cart=(CartDTO)session.getAttribute("CART");
            int userID=user.getUserID();
            boolean check=orderDao.addOrder(date, price, userID, false);
            if(check){
                ProductDAO productDao=new ProductDAO();
                OrderDetailDAO detailDao = new OrderDetailDAO();
                for (int i =0;i<cart.getCart().size();i++) {
                    productDao.sellProduct(cart.getCart().get(i).getID(), cart.getCart().get(i).getQuantity());
                    detailDao.addOrderDetail(date, cart.getCart().get(i).getPrice(), cart.getCart().get(i).getQuantity(), cart.getCart().get(i).getID());
                }
                url=SUCCESS;
                session.removeAttribute("CART");
                OrderDAO dao=new OrderDAO();
                OrderListDTO orderList=dao.getListOrder(user.getUserID());
                session.setAttribute("ORDER_LIST",orderList);
                ConfirmMail.send(user.getEmail(), "Thank for buying our product","Your order at "+date+" with total price of: "+price+"$ will soon be delivered right to your house", "longtlpse160987@fpt.edu.vn", "1q2w3e4r5t@@");
            }else{
                request.setAttribute("ORDER_ERROR", "FAIL TO SUBMIT YOUR ORDER");
            }          
        } catch (Exception e) {
            log("Errot at OrderController : " + e.toString());
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
