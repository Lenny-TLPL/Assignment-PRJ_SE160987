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
import sample.DAO.UserDAO;
import sample.DTO.UserDTO;
import sample.DTO.UserError;
import sample.reCaptcha.VerifyUtils;

/**
 *
 * @author Phi Long
 */
public class SignInController extends HttpServlet {
    private static final String ERROR="login.jsp";
    private static final String US="US";
    private static final String USER_PAGE="home.jsp";
    private static final String AD="AD";
    private static final String ADMIN_PAGE="admin.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url=ERROR;
        try {
            String userName=request.getParameter("UserName");
            String password=request.getParameter("Password");
            String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
            boolean verify = VerifyUtils.verify(gRecaptchaResponse);
            UserError userError = new UserError();
            HttpSession session =request.getSession();
            if(verify){
                UserDAO dao =new UserDAO();
                UserDTO loginUser=dao.checkLogin(userName, password);                 
                session.setAttribute("LOGIN_USER", loginUser);            
                if(loginUser!=null){
                    String role= loginUser.getRole();
                    boolean status= loginUser.getStatus();  
                    if(!status){
                        userError.setErrorMessage("This account is currently banned from our system.");
                    }
                    else if(AD.equals(role)){
                        ProductDAO productDao=new ProductDAO();
                        ArrayList<String> categoryList =  productDao.getCategory();
                        session.setAttribute("CategoryList", categoryList);
                        url=ADMIN_PAGE;
                    }else if(US.equals(role)){
                        url=USER_PAGE;
                    }else{
                        userError.setErrorMessage("Your role is not supported");
                    }
                }else{
                    userError.setErrorMessage("Incorrect userName of password");
                }
                session.setAttribute("LOGIN_ERROR", userError);
            }else{
                userError.setErrorMessage("You failed the recaptcha!!!!");
                session.setAttribute("LOGIN_ERROR", userError);
            }
        } catch (Exception e) {
            log("Error at SignInController: "+e.toString());
        }finally{
            response.sendRedirect(url); 
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
