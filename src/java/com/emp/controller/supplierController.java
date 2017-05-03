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
 * @author RuBaYeT
 */
@Controller
public class supplierController {
    
    @RequestMapping(value = "/suppliers", method = RequestMethod.GET)
    public ModelAndView suppliers(HttpServletRequest request) {
        ModelAndView model=new ModelAndView("suppliers");
        model.addObject("result","suppliers");
        return model;
    }
}
