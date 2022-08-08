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
import sample.DAO.UserDAO;
import sample.DTO.UserError;
import static sample.utils.DateUtils.inputValidDate;

/**
 *
 * @author Phi Long
 */
public class SignUpController extends HttpServlet {
    private static final String ERROR="signUp.jsp";
    private static final String SUCCESS="signUp.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String userName= request.getParameter("UserName");
            String password= request.getParameter("Password");
            String confirm= request.getParameter("Confirm");
            String fullName= request.getParameter("FullName");
            String address= request.getParameter("Address");
            String birthday= request.getParameter("Birthday");
            String phone= request.getParameter("Phone");
            String email=request.getParameter("Email");
            boolean check = true;
            String phoneRegex= "[0-9]+";
            String emailRegex="^([\\w-\\.]+){1,64}@([\\w&&[^_]]+){2,255}.[a-z]{2,}$";
            UserError userError= new UserError();
            UserDAO userDao=new UserDAO();
            if(userDao.checkDuplicate(userName)){
                userError.setUserName("  |UserName has been used");
                check = false;
            }
            if(userName.length()>=40){
                userError.setUserName("  |User Name must be <40");
                check=false;
            }
            if(fullName.length()>=40){
                userError.setFullName("  |Full Name must be <40");
                check=false;
            }
            if(password.length()>=40){
                userError.setPassword("  |Password must be <40");
                check = false;
            }
            if(password.equals(confirm)==false){
                userError.setConfirm("  |Confirm password is not correct");
                check=false;
            }
            if(inputValidDate(birthday)==false){
                userError.setBirthdayError("  |Birthday is an invalid date");
                check=false;
            }
            if(phone.matches(phoneRegex)==false||phone.length()>=12||userDao.checkDuplicatePhone(phone)){
                userError.setPhone("  |Invalid phone number or this number has been used");
                check = false;
            }
            if(email.matches(emailRegex)==false||userDao.checkDuplicateEmail(email)){
                userError.setEmail("  |Invalid email or this email has been used");
                check=false;
            }
            if(check){
                boolean checkAdd=userDao.addUser(userName, fullName, password, address, birthday, phone, email);
                if(checkAdd){
                    url=SUCCESS;
                    request.setAttribute("CREATE_SUCCESS","  |New User has been create successfully.");
                }else{
                    userError.setErrorMessage("  |Error while adding new user.");
                }
            }else{
                userError.setErrorMessage("  |Error. Can not add user.");                
            }
            request.setAttribute("CREATE_ERROR", userError);
            
        } catch (Exception e) {
            log("Error at SignUpController: "+e.toString());
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
