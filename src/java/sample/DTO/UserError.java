/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.DTO;

import java.sql.Date;

/**
 *
 * @author Phi Long
 */
public class UserError extends UserDTO {
    
    private String confirm;
    private String errorMessage;
    private String userIDError;
    private String dateError;
    private String statusError;
    private String birthdayError;

    public UserError() {
    }

    public UserError(String confirm, String errorMessage, String userIDError, String dateError, String statusError, String birthdayError, int userID, String userName, String fullName, String password, String role, String address, Date birthday, String phone, String email, boolean status) {
        super(userID, userName, fullName, password, role, address, birthday, phone, email, status);
        this.confirm = confirm;
        this.errorMessage = errorMessage;
        this.userIDError = userIDError;
        this.dateError = dateError;
        this.statusError = statusError;
        this.birthdayError = birthdayError;
    }

    public String getBirthdayError() {
        return birthdayError;
    }

    public void setBirthdayError(String birthdayError) {
        this.birthdayError = birthdayError;
    }

    public String getConfirm() {
        return confirm;
    }

    public void setConfirm(String confirm) {
        this.confirm = confirm;
    }

    public String getErrorMessage() {
        return errorMessage;
    }

    public void setErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage;
    }

    public String getUserIDError() {
        return userIDError;
    }

    public void setUserIDError(String userIDError) {
        this.userIDError = userIDError;
    }

    public String getDateError() {
        return dateError;
    }

    public void setDateError(String dateError) {
        this.dateError = dateError;
    }

    public String getStatusError() {
        return statusError;
    }

    public void setStatusError(String statusError) {
        this.statusError = statusError;
    }
    
    
   
}
