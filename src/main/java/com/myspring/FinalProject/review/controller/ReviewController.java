package com.myspring.FinalProject.review.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface ReviewController {
	// 후기 리스트
	public ModelAndView listReview(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	/*public ModelAndView listReview(
			@RequestParam(defaultValue="name")String searchOption,@RequestParam(defaultValue="") String keyword, 
			HttpServletRequest request, HttpServletResponse response) throws Exception;*/
	
	// 후기 작성
	public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception; 
	public ResponseEntity addNewReview(MultipartHttpServletRequest multipartRequest,
			HttpServletResponse response) throws Exception;
	// 후기 수정
	public ModelAndView viewReview(@RequestParam("reviewNO") int reviewNO,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity modeReview(MultipartHttpServletRequest multipartRequest,
			HttpServletResponse response) throws Exception;
	// 후기 삭제
	public ModelAndView removeReview(@RequestParam("reviewNO") int reviewNO,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
}
