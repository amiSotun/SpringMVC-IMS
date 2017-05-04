/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.emp.dao;

import com.emp.model.CustomerInfo;
import java.util.List;

/**
 *
 * @author RuBaYeT
 */
public interface CustomerDao {   
    public void setDB();
    public int createCustomerId();
    public int addCustomer(CustomerInfo customerInfo);
    public List<CustomerInfo> getCustometsDetails();
    //public List<CustomerInfo> retriveCustomerInfo(String customerId);
    public CustomerInfo retriveCustomerInfo(String customerId);
    public int changeCustomeInfo(CustomerInfo customerInfo);
    public int deleteCustomerInfo(String customerId);
    
}
