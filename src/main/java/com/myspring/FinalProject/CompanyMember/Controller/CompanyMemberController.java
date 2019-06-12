package com.myspring.FinalProject.CompanyMember.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface CompanyMemberController {
public ModelAndView getallview(HttpServletResponse response,HttpServletRequest request,
		@RequestParam("pg") int pg) throws Exception;

}
