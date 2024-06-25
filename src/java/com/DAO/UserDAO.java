/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.DAO;



import com.entity.User;

/**
 *
 * @author Shree
 */
public interface UserDAO {
    public boolean UserRegister(User us);
//    to checking user is valid or not
    public User Login(String email , String password);
    public boolean checkPassword(int id, String ps);
    public boolean UpdateProfile(User us);
    public boolean checkUser(String em);
    
    public User getUser(int id);
    
}
