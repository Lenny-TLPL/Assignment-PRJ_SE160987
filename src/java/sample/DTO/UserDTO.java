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
public class UserDTO {
    private int userID;
    private String userName;
    private String fullName;
    private String password;
    private String role;
    private String address;
    private Date birthday;
    private String phone;
    private String email;
    private boolean status;

    public UserDTO() {
        this.userID = 0;
        this.userName = "";
        this.fullName = "";
        this.password = "";
        this.role = "";
        this.address = "";
        this.birthday = null;
        this.phone = "";
        this.email = "";
        this.status = false;
    }

    public UserDTO(int userID, String userName, String fullName, String password, String role, String address, Date birthday, String phone, String email, boolean status) {
        this.userID = userID;
        this.userName = userName;
        this.fullName = fullName;
        this.password = password;
        this.role = role;
        this.address = address;
        this.birthday = birthday;
        this.phone = phone;
        this.email = email;
        this.status = status;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    

}
