package com.myspring.FinalProject.member.General.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.FinalProject.member.General.vo.GenerVO;

public interface GenerController {

	public ModelAndView GenerListMember(HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ModelAndView InsertGener(GenerVO generVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	
	public ModelAndView UpdateMemberForm(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception ;
	public ModelAndView UpdateGener(@ModelAttribute("generVO") GenerVO generVO,HttpServletRequest request, HttpServletResponse response) throws Exception ;
	public ModelAndView DeleteGener(String id,HttpServletRequest request, HttpServletResponse response)throws Exception;
	
	public ModelAndView login(GenerVO member, RedirectAttributes rAttr, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception ;
	
	public ModelAndView myPage(HttpServletRequest request, HttpServletResponse response) throws Exception ;
	
}
