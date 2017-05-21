/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.emp.controller;

import com.emp.dao.SupplierDao;
import com.emp.model.SupplierInfo;
import com.google.gson.Gson;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
/**
 *
 * @author Humayun
 */
@Controller
public class supplierController {
    public String str="";
    private final SupplierDao supplierDao;
    DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
    HttpSession session;
    
    @Autowired 
    public supplierController(SupplierDao supplierDao){
        this.supplierDao=supplierDao;
        supplierDao.setDB();
    }
    
    @RequestMapping(value = "/suppliers", method = RequestMethod.GET)
    public ModelAndView suppliers(HttpServletRequest request) {
        str="";
         ModelAndView model;
        if(request.getSession(false) != null)
                session=request.getSession();
        List<SupplierInfo> list=supplierDao.getSuppliersDetails(); 
        if((session.getAttribute("sessionUserId")!=null)&&(session.getAttribute("sessionUserType")!=null)){
            model=new ModelAndView("suppliers");
            model.addObject("result","suppliers");
            model.addObject("list",list);
        }
        else {
            session.setAttribute("sessionLoginCheck",true);
            model=new ModelAndView("redirect:/loginform");
        }
        return model;
    }
    
    
    @RequestMapping(value = "/newSupplierID", method = RequestMethod.POST)
    public @ResponseBody String newSupplierID(HttpServletRequest request) {
        int row=supplierDao.createSupplierId();
        String str=String.valueOf(row);
        str="SUP-0"+str;
        return str;
    }
    
    @RequestMapping(value = "/insertSupplier", method = RequestMethod.POST)
    public ModelAndView insertSupplier(HttpServletRequest request) {
        if(request.getSession(false) != null)
                session=request.getSession();
        String sessionUserId=(String)session.getAttribute("sessionUserId");
        int row=supplierDao.createSupplierId();
        String supplierid=String.valueOf(row);
        supplierid="SUP-0"+supplierid;
        String suppliername=request.getParameter("name");
        String supplieremail=request.getParameter("email");
        String supplierphone=request.getParameter("phone");
        String supplieraddress=request.getParameter("address");
        Date date = new Date();
        SupplierInfo supplierInfo = new SupplierInfo(0,supplierid, suppliername, supplieraddress, supplieremail, supplierphone, sessionUserId, dateFormat.format(date));
        str= String.valueOf(supplierDao.addSupplier(supplierInfo));
        session.setAttribute("sessionSuccessMsg",str);
        return new ModelAndView("redirect:/suppliers");
    }
    
      @RequestMapping(value = "/retriveSupplierInfo", method = RequestMethod.POST)
    public @ResponseBody String retriveSupplierInfo(HttpServletRequest request) {
        Gson gson = new Gson();
        String supplierId=request.getParameter("supplierId");
        SupplierInfo supplierInfo= supplierDao.retriveSupplierInfo(supplierId);
        String json = gson.toJson(supplierInfo);
        return json;
    }
    
    
    @RequestMapping(value = "/editSupplier", method = RequestMethod.POST)
    public ModelAndView editSupplier(@ModelAttribute SupplierInfo supplierInfo,HttpServletRequest request) {
        if(request.getSession(false) != null)
             session=request.getSession();
        str= String.valueOf(supplierDao.changeSupplierInfo(supplierInfo));
        session.setAttribute("sessionSuccessMsg",str);
        return new ModelAndView("redirect:/suppliers");
    }
    
     @RequestMapping(value = "/deleteSupplier", method = RequestMethod.POST)
    public ModelAndView deleteSupplier(HttpServletRequest request){
        if(request.getSession(false) != null)
                session=request.getSession();
        String supplierId=request.getParameter("supplierid");       
        str= String.valueOf(supplierDao.deleteSupplierInfo(supplierId));
        session.setAttribute("sessionSuccessMsg",str);
        return new ModelAndView("redirect:/suppliers");
    }
    
    @RequestMapping(value = "/searchSupplier", method = RequestMethod.GET)
    public @ResponseBody String searchSupplier(HttpServletRequest request) {
        Gson gson = new Gson();
        String searchVal=request.getParameter("searchVal").trim();
        //return searchVal;
            List<SupplierInfo> supplierInfo=supplierDao.searchSupplierInfo(searchVal); 
            String json = gson.toJson(supplierInfo);
            return json;
    }
}
