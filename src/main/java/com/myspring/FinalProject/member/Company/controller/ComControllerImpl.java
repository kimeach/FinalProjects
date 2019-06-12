package com.myspring.FinalProject.member.Company.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.FinalProject.member.Company.service.ComService;
import com.myspring.FinalProject.member.Company.vo.ComVO;
import com.myspring.FinalProject.member.General.vo.GenerVO;


@Controller("comController")
@RequestMapping("/Company")
public class ComControllerImpl implements ComController{
	
	@Autowired
	private ComService comService;
	@Autowired
	ComVO comVO;
	
	 
	
	//회원리스트
	@Override
	@RequestMapping(value="/comList.do", method=RequestMethod.GET)
	public ModelAndView ComListMember(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName=(String) request.getAttribute("viewName");
		List comList=comService.comListMember();
		ModelAndView mav=new ModelAndView(viewName);
		mav.addObject("comList",comList);
		/* System.out.print("email:"+generVO.getEmail().); */
		return mav;
	}

	@Override
	@RequestMapping(value="/comAdd.do", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView InsertCom(ComVO comVO,HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");
		int result=comService.insertCom(comVO);
		return new ModelAndView("redirect:/Company/comList.do");
	}
	
	@Override
	@RequestMapping(value="/*Form.do",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/comUpdateForm.do",method=RequestMethod.GET)
	public ModelAndView UpdateCompanyForm(@RequestParam("authNum") String authNum, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		ComVO member = comService.updateCompanyForm(authNum);
		mav.addObject("comVO", member);
		return mav;
	}

	@Override
	@RequestMapping(value="/comFix.do",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView UpdateCom(@ModelAttribute("comVO") ComVO comVO,HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		int result=comService.updateCom(comVO);
		return new ModelAndView("redirect:/Company/comList.do");
	}

	@Override
	@RequestMapping(value="/comRemove.do",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView DeleteCom(String authNum,HttpServletRequest request, HttpServletResponse response) throws Exception {
		comService.deleteCom(authNum);
		return new ModelAndView("redirect:/Company/comList.do");
	}

	
	@Override
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public ModelAndView login(ComVO comMember, RedirectAttributes rAttr, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
	   ComVO comVO = comService.login(comMember);
	    if(comMember!=null) {
	    	 HttpSession session = request.getSession();
	    	 session.setAttribute("comMember", comVO);
	    	 session.setAttribute("isLogOn", true);
	    	 String action=(String)session.getAttribute("action");
	    	 session.removeAttribute("action");
	    	 if(action!=null) {
	    		 mav.setViewName("redirect:"+action); 
	    	 }else{
	    		 mav.setViewName("redirect:/Company/comList.do");
	    	 }
	    }if(comMember==null) {
	    	rAttr.addAttribute("result", "loginFailed");
	    	mav.setViewName("redirect:/Company/loginForm.do");
	    }
		return mav;
	}
	@Override
	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		 session.removeAttribute("comMember");
    	 session.removeAttribute("isLogOn");
		return new ModelAndView("redirect:/Company/comList.do");
	}
	

	
	@Override
	@RequestMapping(value="/mypage.do" ,method = RequestMethod.GET)
	public ModelAndView myPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav=new ModelAndView();
		  mav.setViewName("/Company/mypage");
		  return mav;
	}
	
	
	
}
