/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.emp.controller;

import com.emp.dao.CustomerDao;
import com.emp.model.CustomerInfo;
import com.google.gson.Gson;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import static java.util.Collections.list;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
/**
 *
 * @author RuBaYeT
 */



@Controller
public class customerController {
    public String str="";
    private final CustomerDao customerDao;
    DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
    private Object JsonRequestBehavior;
    
    @Autowired 
    public customerController(CustomerDao customerDao){
        this.customerDao=customerDao;
        customerDao.setDB();
    }

    @RequestMapping(value = "/customers", method = RequestMethod.GET)
    public ModelAndView customers(HttpServletRequest request) {
        str="";
        List<CustomerInfo> list=customerDao.getCustometsDetails(); 
        str=request.getParameter("queryRst");
        ModelAndView model=new ModelAndView("customers");
        model.addObject("result","customers");
        model.addObject("queryResult",str);
        model.addObject("list",list);
        return model;
    }
    
    @RequestMapping(value = "/newCustomerID", method = RequestMethod.POST)
    public @ResponseBody String newCustomerID(HttpServletRequest request) {
        int row=customerDao.createCustomerId();
        String str=String.valueOf(row);
        str="CUS-0"+str;
        return str;
    }
    
    @RequestMapping(value = "/insertCustomer", method = RequestMethod.POST)
    public ModelAndView insertCustomer(HttpServletRequest request) {
        //List<CustomerInfo> list=customerDao.getCustometsDetails(); 
        int row=customerDao.createCustomerId();
        String customerid=String.valueOf(row);
        customerid="CUS-0"+customerid;
        String customername=request.getParameter("name");
        String customeremail=request.getParameter("email");
        String customerphone=request.getParameter("phone");
        String customeraddress=request.getParameter("address");
        Date date = new Date();
        CustomerInfo customerInfo = new CustomerInfo(0,customerid, customername, customeraddress, customeremail, customerphone, "kabir", dateFormat.format(date));
        str= String.valueOf(customerDao.addCustomer(customerInfo));
        ModelAndView model= new ModelAndView("redirect:/customers");
        model.addObject("queryRst",str);
         return model;
    }
    
    
     @RequestMapping(value = "/retriveCustomerInfo", method = RequestMethod.POST)
    public @ResponseBody String retriveCustomerInfo(HttpServletRequest request) {
        Gson gson = new Gson();
        String customerId=request.getParameter("customerId");
        CustomerInfo customerInfo= customerDao.retriveCustomerInfo(customerId);
        String json = gson.toJson(customerInfo);
        return json;
    }
}
