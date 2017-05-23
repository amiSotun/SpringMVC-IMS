/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.emp.controller;
import com.emp.dao.BrandDao;
import com.emp.model.BrandInfo;
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
public class brandController {
    public String str="";
    private final BrandDao brandDao;
    DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
    HttpSession session;
    
    @Autowired 
    public brandController(BrandDao brandDao){
        this.brandDao=brandDao;
        brandDao.setDB();
    }
    
    @RequestMapping(value = "/brand", method = RequestMethod.GET)
    public ModelAndView brand(HttpServletRequest request) {
        str="";
         ModelAndView model;
        if(request.getSession(false) != null)
                session=request.getSession();
        List<BrandInfo> list=brandDao.getBrandDetails(); 
        if((session.getAttribute("sessionUserId")!=null)&&(session.getAttribute("sessionUserType")!=null)){
            model=new ModelAndView("brand");
            model.addObject("result","brand");
            model.addObject("list",list);
        }
        else {
            session.setAttribute("sessionLoginCheck",true);
            model=new ModelAndView("redirect:/loginform");
        }
        return model;
    }
    
    @RequestMapping(value = "/newBrandID", method = RequestMethod.POST)
    public @ResponseBody String newBrandID(HttpServletRequest request) {
        int row=brandDao.createBrandId();
        String str=String.valueOf(row);
        str="BND-0"+str;
        return str;
    }
    
    @RequestMapping(value = "/insertBrand", method = RequestMethod.POST)
    public ModelAndView insertBrand(HttpServletRequest request) {
        if(request.getSession(false) != null)
                session=request.getSession();
        String sessionUserId=(String)session.getAttribute("sessionUserId");
        //List<BrandInfo> list=brandDao.getBrandDetails(); 
        int row=brandDao.createBrandId();
        String brandid=String.valueOf(row);
        brandid="CUS-0"+brandid;
        String brandName=request.getParameter("brandName");
        String description=request.getParameter("description");
        Date date = new Date();
        BrandInfo brandInfo = new BrandInfo(brandid, brandName, description, sessionUserId, dateFormat.format(date));
        str= String.valueOf(brandDao.addBrand(brandInfo));
        session.setAttribute("sessionSuccessMsg",str);
        return new ModelAndView("redirect:/brand");
    }
    
    
     @RequestMapping(value = "/retriveBrandInfo", method = RequestMethod.POST)
    public @ResponseBody String retriveBrandInfo(HttpServletRequest request) {
        Gson gson = new Gson();
        String brandId=request.getParameter("brandId");
        BrandInfo brandInfo= brandDao.retriveBrandInfo(brandId);
        String json = gson.toJson(brandInfo);
        return json;
    }
    
      @RequestMapping(value = "/editBrand", method = RequestMethod.POST)
    public ModelAndView editBrand(@ModelAttribute BrandInfo brandInfo,HttpServletRequest request) {
        if(request.getSession(false) != null)
                session=request.getSession();
        str= String.valueOf(brandDao.changeBrandInfo(brandInfo));
        session.setAttribute("sessionSuccessMsg",str);
        return new ModelAndView("redirect:/brand");
    }
    
    
    @RequestMapping(value = "/deleteBrand", method = RequestMethod.POST)
    public ModelAndView deleteBrand(HttpServletRequest request){
        if(request.getSession(false) != null)
                session=request.getSession();
        String brandId=request.getParameter("brandid");       
        str= String.valueOf(brandDao.deleteBrandInfo(brandId));
        session.setAttribute("sessionSuccessMsg",str);
        return new ModelAndView("redirect:/brand");
    }
    
    @RequestMapping(value = "/searchBrand", method = RequestMethod.GET)
    public @ResponseBody String searchBrand(HttpServletRequest request) {
        Gson gson = new Gson();
        String searchVal=request.getParameter("searchVal").trim();
            List<BrandInfo> brandInfo=brandDao.searchBrandInfo(searchVal); 
            String json = gson.toJson(brandInfo);
            return json;
    }
    
}
