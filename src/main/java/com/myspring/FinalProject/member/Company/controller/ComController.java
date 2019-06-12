package com.myspring.FinalProject.member.Company.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.FinalProject.member.Company.vo.ComVO;



public interface ComController {
public ModelAndView ComListMember(HttpServletRequest request, HttpServletResponse response)throws Exception;

	public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception;
public ModelAndView InsertCom(ComVO comVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView UpdateCompanyForm(@RequestParam("authNum") String authNum, HttpServletRequest request, HttpServletResponse response) throws Exception ;
	public ModelAndView UpdateCom(@ModelAttribute("comVO") ComVO comVO,HttpServletRequest request, HttpServletResponse response) throws Exception ;
	public ModelAndView DeleteCom(String id,HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ModelAndView login(ComVO comMember, RedirectAttributes rAttr, HttpServletRequest request,
			HttpServletResponse response) throws Exception ;
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView myPage(HttpServletRequest request, HttpServletResponse response) throws Exception ;

}
