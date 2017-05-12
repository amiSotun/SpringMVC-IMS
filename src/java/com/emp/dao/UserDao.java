/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.emp.dao;

//import com.emp.model.UserInfo;

/**
 *
 * @author Humayun Kabir
 */
public interface UserDao {
   public void setDB();
   public boolean checkCustomerExist(String userid,int usertype,String password);
}
