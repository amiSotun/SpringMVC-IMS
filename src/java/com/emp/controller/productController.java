/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.emp.controller;

import com.emp.dao.ProductDao;
import com.emp.model.ModelInfo;
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
 * @author Humayun Kabir
 */

@Controller
public class productController {
     public String str="";
    private final ProductDao productDao;
    DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
    HttpSession session;
    
    
    @Autowired 
    public productController(ProductDao productDao){
        this.productDao=productDao;
        productDao.setDB();
    }
    
    
     @RequestMapping(value = "/product", method = RequestMethod.GET)
    public ModelAndView product(HttpServletRequest request) {
        str="";
         ModelAndView model;
        if(request.getSession(false) != null)
                session=request.getSession();
        //List<ModelInfo> list=modelDao.getModelDetails(); 
        if((session.getAttribute("sessionUserId")!=null)&&(session.getAttribute("sessionUserType")!=null)){
            model=new ModelAndView("product");
            model.addObject("result","product");
            //model.addObject("list",list);
        }
        else {
            session.setAttribute("sessionLoginCheck",true);
            model=new ModelAndView("redirect:/loginform");
        }
        return model;
    }
    
      @RequestMapping(value = "/newStockID", method = RequestMethod.POST)
    public @ResponseBody String newSupplierID(HttpServletRequest request) {
        int row=productDao.createStockId();
        String str=String.valueOf(row);
        str="STK-0"+str;
        return str;
    }
    
    @RequestMapping(value = "/newEntryID", method = RequestMethod.POST)
    public @ResponseBody String newEntryID(HttpServletRequest request) {
        int row=productDao.createEntryId();
        String str=String.valueOf(row);
        str="ENT-0"+str;
        return str;
    }
    
    @RequestMapping(value = "/retriveSupplierList", method = RequestMethod.POST)
    public @ResponseBody String retriveSupplierList(HttpServletRequest request) {
        Gson gson = new Gson();
            List<SupplierInfo> brandInfo=productDao.retriveSupplier(); 
            String json = gson.toJson(brandInfo);
            return json;
    }
    
    @RequestMapping(value = "/retriveModelList", method = RequestMethod.POST)
    public @ResponseBody String retriveModelList(HttpServletRequest request) {
        String brandId=request.getParameter("brandId");
        String catId=request.getParameter("catId");
        Gson gson = new Gson(); 
            List<ModelInfo> modelInfo=productDao.retriveModel(brandId,catId);
            String json = gson.toJson(modelInfo);
            return json;
    }
    
}
