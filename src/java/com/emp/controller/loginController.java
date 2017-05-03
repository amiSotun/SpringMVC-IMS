/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.emp.controller;


import java.util.Date;
import javax.servlet.http.HttpServletRequest;
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
        String userid=request.getParameter("userid").trim();
        int usertype=Integer.parseInt((request.getParameter("usertype")).trim());
        String password=request.getParameter("password").trim();
        ModelAndView model=new ModelAndView("dashboard");
        model.addObject("result","dashboard");
        return model;
    }
    
    @RequestMapping(value="/dashboard", method = RequestMethod.GET)    
    public ModelAndView dashboard(){ 
        ModelAndView model=new ModelAndView("dashboard");
        model.addObject("result","dashboard");
        return model;
    }
    
}