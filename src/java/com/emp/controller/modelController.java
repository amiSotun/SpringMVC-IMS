/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.emp.controller;

import com.emp.dao.ModelDao;
import com.emp.model.BrandInfo;
import com.emp.model.CategoryInfo;
import com.emp.model.ModelInfo;
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
public class modelController {
    public String str="";
    private final ModelDao modelDao;
    DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
    HttpSession session;
    
     @Autowired 
    public modelController(ModelDao modelDao){
        this.modelDao=modelDao;
        modelDao.setDB();
    }
    
    @RequestMapping(value = "/model", method = RequestMethod.GET)
    public ModelAndView model(HttpServletRequest request) {
        str="";
         ModelAndView model;
        if(request.getSession(false) != null)
                session=request.getSession();
        List<ModelInfo> list=modelDao.getModelDetails(); 
        if((session.getAttribute("sessionUserId")!=null)&&(session.getAttribute("sessionUserType")!=null)){
            model=new ModelAndView("model");
            model.addObject("result","model");
            model.addObject("list",list);
        }
        else {
            session.setAttribute("sessionLoginCheck",true);
            model=new ModelAndView("redirect:/loginform");
        }
        return model;
    }
    
    @RequestMapping(value = "/retriveBrandList", method = RequestMethod.POST)
    public @ResponseBody String retriveBrandList(HttpServletRequest request) {
        Gson gson = new Gson();
            List<BrandInfo> brandInfo=modelDao.retriveBrand(); 
            String json = gson.toJson(brandInfo);
            return json;
    }
    
    @RequestMapping(value = "/retriveCategoryList", method = RequestMethod.POST)
    public @ResponseBody String retriveCategoryList(HttpServletRequest request) {
        Gson gson = new Gson();
            List<CategoryInfo> categoryInfo=modelDao.retriveCategory(); 
            String json = gson.toJson(categoryInfo);
            return json;
    }
    
    @RequestMapping(value = "/insertModel", method = RequestMethod.POST)
    public ModelAndView insertModel(HttpServletRequest request) {
        ModelAndView model;
        String details=null;
        if(request.getSession(false) != null)
                session=request.getSession();
        String sessionUserId=(String)session.getAttribute("sessionUserId");
        String modelid=request.getParameter("modelid");
        String brandid=request.getParameter("brandid");
        String catid=request.getParameter("catid");
        if(request.getParameter("details").trim()!=null)
         details=request.getParameter("details");
        Date date = new Date();
        ModelInfo modelInfo = new ModelInfo(modelid, brandid, catid,sessionUserId, details, dateFormat.format(date));
        str= String.valueOf(modelDao.addModel(modelInfo));
        session.setAttribute("sessionSuccessMsg",str);
        model=new ModelAndView("redirect:/model");
        return model;
    }
    
    @RequestMapping(value = "/retriveModelInfo", method = RequestMethod.POST)
    public @ResponseBody String retriveModelInfo(HttpServletRequest request) {
        Gson gson = new Gson();
        String modelId=request.getParameter("modelId");
        ModelInfo modelInfo= modelDao.retriveModelInfo(modelId);
        String json = gson.toJson(modelInfo);
        return json;
    }
    
    @RequestMapping(value = "/editModel", method = RequestMethod.POST)
    public ModelAndView editModel(@ModelAttribute ModelInfo modelInfo,HttpServletRequest request) {
        if(request.getSession(false) != null)
             session=request.getSession();
        str= String.valueOf(modelDao.changeModelInfo(modelInfo));
        session.setAttribute("sessionSuccessMsg",str);
        return new ModelAndView("redirect:/model");
    }
    
    @RequestMapping(value = "/deleteModel", method = RequestMethod.POST)
    public ModelAndView deleteModel(HttpServletRequest request){
        if(request.getSession(false) != null)
                session=request.getSession();
        String modelId=request.getParameter("modelid");       
        str= String.valueOf(modelDao.deleteModelInfo(modelId));
        session.setAttribute("sessionSuccessMsg",str);
        return new ModelAndView("redirect:/model");
    }
    
       @RequestMapping(value = "/searchModel", method = RequestMethod.GET)
    public @ResponseBody String searchModel(HttpServletRequest request) {
        Gson gson = new Gson();
        String searchVal=request.getParameter("searchVal").trim();
        //return searchVal;
            List<ModelInfo> modelInfo=modelDao.searchModelInfo(searchVal); 
            String json = gson.toJson(modelInfo);
            return json;
    }
    
    
}
