/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.emp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Humayun Kabir
 */

@Controller
public class dashboardController {
    HttpSession session;
    
     @RequestMapping(value="/dashboard", method = RequestMethod.GET)    
    public ModelAndView dashboard(HttpServletRequest request){
        ModelAndView model;
        if(request.getSession(false) != null)
                session=request.getSession();
        
        if((session.getAttribute("sessionUserId")!=null)&&(session.getAttribute("sessionUserType")!=null)){
            model=new ModelAndView("dashboard");
            model.addObject("result","dashboard");
        }
        else {
            session.setAttribute("sessionLoginCheck",true);
            model=new ModelAndView("redirect:/loginform");
        }
        return model;
    }
}
