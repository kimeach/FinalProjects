package com.myspring.FinalProject.member.General.controller;

import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.FinalProject.member.General.service.GenerService;
import com.myspring.FinalProject.member.General.vo.GenerVO;


@Controller("generController")
@RequestMapping("/General")
public class GenerControllerImpl implements GenerController {
	
	@Autowired
	private GenerService generService;
	@Autowired
	GenerVO generVO;
	
	 
	
	//회원리스트
	@Override
	@RequestMapping(value="/generList.do", method=RequestMethod.GET)
	public ModelAndView GenerListMember(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName=(String) request.getAttribute("viewName");
		List generList=generService.generListMember();
		ModelAndView mav=new ModelAndView(viewName);
		mav.addObject("generList",generList);
		/* System.out.print("email:"+generVO.getEmail().); */
		return mav;
	}

	@Override
	@RequestMapping(value="/generAdd.do", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView InsertGener(GenerVO generVO,HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		int result=generService.insertGener(generVO);
		return new ModelAndView("redirect:/General/generList.do");
	}
	
	@Override
	@RequestMapping(value="/*Form.do",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/generUpdateForm.do",method=RequestMethod.GET)
	public ModelAndView UpdateMemberForm(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		GenerVO member = generService.updateMemberForm(id);
		mav.addObject("generVO", member);
		return mav;
	}

	@Override
	@RequestMapping(value="/generFix.do",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView UpdateGener(@ModelAttribute("generVO") GenerVO generVO,HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		int result=generService.updateGener(generVO);
		return new ModelAndView("redirect:/General/generList.do");
	}

	@Override
	@RequestMapping(value="/generRemove.do",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView DeleteGener(String id,HttpServletRequest request, HttpServletResponse response) throws Exception {
		generService.deleteGener(id);
		return new ModelAndView("redirect:/General/generList.do");
	}
	
	
	@Override
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public ModelAndView login(GenerVO member, RedirectAttributes rAttr, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
	    GenerVO generVO = generService.login(member);
	    if(member!=null) {
	    	 HttpSession session = request.getSession();
	    	 session.setAttribute("member", generVO);
	    	 session.setAttribute("isLogOn", true);
	    	 String action=(String)session.getAttribute("action");
	    	 session.removeAttribute("action");
	    	 if(action!=null) {
	    		 mav.setViewName("redirect:"+action); 
	    	 }if(member.getId().equals("admin")&& member.getPwd().equals("1234")){
		    	 mav.setViewName("redirect:/General/generList.do");
	       	 }else{
	    		 mav.setViewName("redirect:/General/generList.do");
	    	 }
	    }if(member==null) {
	    	rAttr.addAttribute("result", "loginFailed");
	    	mav.setViewName("redirect:/General/loginForm.do");
	    }
		return mav;
	}
	@Override
	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		 session.removeAttribute("member");
    	 session.removeAttribute("isLogOn");
		return new ModelAndView("redirect:/General/generList.do");
	}
	

	@Override
	@RequestMapping(value="/mypage.do" ,method = RequestMethod.GET)
	public ModelAndView myPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav=new ModelAndView();
		  mav.setViewName("/General/mypage");
		  return mav;
	}
	
	
	} 

