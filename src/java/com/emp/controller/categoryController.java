/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.emp.controller;
import com.emp.dao.CategoryDao;
import com.emp.model.CategoryInfo;
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
 * @author RuBaYeT
 */

@Controller
public class categoryController {
    public String str="";
    private final CategoryDao categoryDao;
    DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
    HttpSession session;
    
     @Autowired 
    public categoryController(CategoryDao categoryDao){
        this.categoryDao=categoryDao;
        categoryDao.setDB();
    }
    
     @RequestMapping(value = "/category", method = RequestMethod.GET)
    public ModelAndView category(HttpServletRequest request) {
        str="";
         ModelAndView model;
        if(request.getSession(false) != null)
                session=request.getSession();
        List<CategoryInfo> list=categoryDao.getCategoryDetails(); 
        if((session.getAttribute("sessionUserId")!=null)&&(session.getAttribute("sessionUserType")!=null)){
            model=new ModelAndView("category");
            model.addObject("result","category");
            model.addObject("list",list);
        }
        else {
            session.setAttribute("sessionLoginCheck",true);
            model=new ModelAndView("redirect:/loginform");
        }
        return model;
    }
    
     @RequestMapping(value = "/newCategoryID", method = RequestMethod.POST)
    public @ResponseBody String newCategoryID(HttpServletRequest request) {
        int row=categoryDao.createCategoryId();
        String str=String.valueOf(row);
        str="CAT-0"+str;
        return str;
    }
    
        @RequestMapping(value = "/insertCategory", method = RequestMethod.POST)
    public ModelAndView insertCategory(HttpServletRequest request) {
        if(request.getSession(false) != null)
                session=request.getSession();
        String sessionUserId=(String)session.getAttribute("sessionUserId"); 
        int row=categoryDao.createCategoryId();
        String catid=String.valueOf(row);
        catid="CAT-0"+catid;
        String catName=request.getParameter("catName");
        String description=request.getParameter("description");
        Date date = new Date();
        CategoryInfo categoryInfo = new CategoryInfo(catid, catName, description, sessionUserId, dateFormat.format(date));
        str= String.valueOf(categoryDao.addCategory(categoryInfo));
        session.setAttribute("sessionSuccessMsg",str);
        return new ModelAndView("redirect:/category");
    }
    
     @RequestMapping(value = "/retriveCategoryInfo", method = RequestMethod.POST)
    public @ResponseBody String retriveCategoryInfo(HttpServletRequest request) {
        Gson gson = new Gson();
        String catId=request.getParameter("catId");
        CategoryInfo categoryInfo= categoryDao.retriveCategoryInfo(catId);
        String json = gson.toJson(categoryInfo);
        return json;
    }
    
       @RequestMapping(value = "/editCategory", method = RequestMethod.POST)
    public ModelAndView editCategory(@ModelAttribute CategoryInfo categoryInfo,HttpServletRequest request) {
        if(request.getSession(false) != null)
                session=request.getSession();
        str= String.valueOf(categoryDao.changeCategoryInfo(categoryInfo));
        session.setAttribute("sessionSuccessMsg",str);
        return new ModelAndView("redirect:/category");
    }
    
     @RequestMapping(value = "/deleteCategory", method = RequestMethod.POST)
    public ModelAndView deleteCategory(HttpServletRequest request){
        if(request.getSession(false) != null)
                session=request.getSession();
        String catId=request.getParameter("catid");       
        str= String.valueOf(categoryDao.deleteCategoryInfo(catId));
        session.setAttribute("sessionSuccessMsg",str);
        return new ModelAndView("redirect:/category");
    }
    
    @RequestMapping(value = "/searchCategory", method = RequestMethod.GET)
    public @ResponseBody String searchCategory(HttpServletRequest request) {
        Gson gson = new Gson();
        String searchVal=request.getParameter("searchVal").trim();
            List<CategoryInfo> categoryInfo=categoryDao.searchCategoryInfo(searchVal); 
            String json = gson.toJson(categoryInfo);
            return json;
    }
}

