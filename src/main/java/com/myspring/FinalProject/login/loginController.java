package com.myspring.FinalProject.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller("loginController")
public class loginController {
	 @RequestMapping(value = "/login.do", method= {RequestMethod.GET,RequestMethod.POST})
	  public ModelAndView log(HttpServletResponse response,HttpServletRequest request) {	  
		  ModelAndView mav=new ModelAndView();
		  mav.setViewName("/login");
		  return mav;
	  }
	 
	 @RequestMapping(value = "/AddMember.do", method= {RequestMethod.GET,RequestMethod.POST})
	  public ModelAndView add(HttpServletResponse response,HttpServletRequest request) {	  
		  ModelAndView mav=new ModelAndView();
		  mav.setViewName("/AddMember");
		  return mav;
	  }
	 
}
