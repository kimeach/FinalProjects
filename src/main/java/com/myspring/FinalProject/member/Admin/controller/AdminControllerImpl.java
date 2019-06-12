package com.myspring.FinalProject.member.Admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.FinalProject.member.Admin.service.AdminService;
import com.myspring.FinalProject.member.Admin.vo.AdminVO;

@Controller("adminConroller")
@RequestMapping("/Admin")
public class AdminControllerImpl implements AdminController {
	
	

	@Autowired
	private AdminService adminService;
	@Autowired
	AdminVO adminVO;
	

	@Override
	@RequestMapping(value="/adminList.do", method=RequestMethod.GET)
	public ModelAndView AdminListMember(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName=(String) request.getAttribute("viewName");
		List adminList=adminService.adminListMember();
		ModelAndView mav=new ModelAndView(viewName);
		mav.addObject("adminList",adminList);
		/* System.out.print("email:"+generVO.getEmail().); */
		return mav;
	}

	
	@Override
	@RequestMapping(value="/adminAdd.do", method=RequestMethod.GET)
	public ModelAndView InsertAdmin(AdminVO adminVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		int result=adminService.insertAdmin(adminVO);
		return new ModelAndView("redirect:/Admin/adminList.do");
	}

	@Override
	@RequestMapping(value="/*Form.do", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}

	
	
	@Override
	@RequestMapping(value="/adminUpdateForm.do", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView UpdateAdminForm(String id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		AdminVO member = adminService.updateAdminForm(id);
		mav.addObject("adminVO", member);
		return mav;
	}

	@Override
	@RequestMapping(value="/adminFix.do", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView UpdateAdmin(AdminVO adminVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		int result=adminService.updateAdmin(adminVO);
		return new ModelAndView("redirect:/Admin/aminList.do");
	}

	@Override
	@RequestMapping(value="/adminRemove.do", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView DeleteAdmin(String id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		adminService.deleteAdmin(id);
		return new ModelAndView("redirect:/Admin/adminList.do");
	}

	@Override
	@RequestMapping(value="/login.do", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView login(AdminVO admember, RedirectAttributes rAttr, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
	    AdminVO adminVO = adminService.login(admember);
	    if(admember!=null) {
	    	 HttpSession session = request.getSession();
	    	 session.setAttribute("admember", adminVO);
	    	 session.setAttribute("isLogOn", true);
	    	 String action=(String)session.getAttribute("action");
	    	 session.removeAttribute("action");
	    	 if(action!=null) {
	    		 mav.setViewName("redirect:"+action); 
	    	 }else{
	    		 mav.setViewName("redirect:/Admin/adminList.do");
	    	 }
	    }if(admember==null) {
	    	rAttr.addAttribute("result", "loginFailed");
	    	mav.setViewName("redirect:/Admin/loginForm.do");
	    }
		return mav;
	}

	@Override
	@RequestMapping(value="/logout.do", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		 session.removeAttribute("member");
   	 session.removeAttribute("isLogOn");
		return new ModelAndView("redirect:/Admin/adminList.do");
	}

	@Override
	@RequestMapping(value="/mypage.do", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView myPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav=new ModelAndView();
		  mav.setViewName("/Admin/mypage");
		  return mav;
	}


	@Override
	@RequestMapping(value="/adminAuthNum.do", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView AdminAuthNum(AdminVO adminVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		int result=adminService.adminAuthNum(adminVO);
		return new ModelAndView("redirect:/Admin/adminList.do");
	}

}
