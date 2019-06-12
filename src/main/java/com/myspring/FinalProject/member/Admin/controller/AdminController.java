package com.myspring.FinalProject.member.Admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.FinalProject.member.Admin.vo.AdminVO;
import com.myspring.FinalProject.member.General.vo.GenerVO;

public interface AdminController {

	public ModelAndView AdminListMember(HttpServletRequest request, HttpServletResponse response)throws Exception;

	
	public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView InsertAdmin(AdminVO adminVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView UpdateAdminForm(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception ;
	public ModelAndView UpdateAdmin(@ModelAttribute("adminVO") AdminVO adminVO,HttpServletRequest request, HttpServletResponse response) throws Exception ;
	public ModelAndView DeleteAdmin(String id,HttpServletRequest request, HttpServletResponse response)throws Exception;
	
	public ModelAndView login(AdminVO admember, RedirectAttributes rAttr, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception ;
	
	public ModelAndView myPage(HttpServletRequest request, HttpServletResponse response) throws Exception ;
	public ModelAndView AdminAuthNum(AdminVO adminVO, HttpServletRequest request, HttpServletResponse response)throws Exception;
	
}
