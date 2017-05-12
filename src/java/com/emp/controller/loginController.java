/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.emp.controller;


import com.emp.dao.UserDao;
import com.emp.model.UserInfo;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Kabir
 */
@Controller
public class loginController {
    private final UserDao userDao;
    DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
     HttpSession session;
    
    @Autowired 
    public loginController(UserDao userDao){
        this.userDao=userDao;
        userDao.setDB();
    }

    
    @RequestMapping(value="/index", method = RequestMethod.GET)    
    public ModelAndView index(){ 
        ModelAndView model=new ModelAndView("index");  
        return model;
    }
    
     @RequestMapping(value="/loginform", method = RequestMethod.GET)    
    public ModelAndView loginform(){ 
        ModelAndView model=new ModelAndView("loginform");  
        return model;
    }
    
    @RequestMapping(value = "/loginCheck", method = RequestMethod.POST)
    public ModelAndView loginCheck(HttpServletRequest request) {
        session=request.getSession();
        boolean loginCheck=false;
        String userid="";
        int usertype=0;
        String password="";
        ModelAndView model;
        if(!"".equals(request.getParameter("userid").trim()))
            userid=request.getParameter("userid").trim();
        if(!"".equals(request.getParameter("usertype").trim()))
            usertype=Integer.parseInt((request.getParameter("usertype")).trim());
        if(!"".equals(request.getParameter("password").trim()))
            password=request.getParameter("password").trim();
        
        if(!"".equals(password) && !"".equals(userid) && 0!=usertype){
           loginCheck=userDao.checkCustomerExist(userid,usertype,password);
        }
        if(!loginCheck){
            model=new ModelAndView("redirect:/loginform");
            session.setAttribute("sessionLoginCheck",loginCheck); 
            //model.addObject("loginCheck",loginCheck);
        }  
        else{
            session.setAttribute("sessionUserId",userid); 
            session.setAttribute("sessionUserType",usertype);
            model=new ModelAndView("redirect:/dashboard");
        }
         return model;
    }
    
   
    
}