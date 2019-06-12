package com.myspring.FinalProject.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.FinalProject.common.paging.Criteria;



public interface BoardController {
	public ModelAndView listArticles(HttpServletRequest request, HttpServletResponse response) throws Exception;
		
	public ModelAndView listArticles( @RequestParam("keyword") String keyword, Criteria criteria,
													 HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ResponseEntity addNewArticle(MultipartHttpServletRequest multipartRequest,HttpServletResponse response) throws Exception;
	
	public ModelAndView viewArticle(@RequestParam("articleNO") int articleNO,
											HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ResponseEntity removeArticle(@RequestParam("articleNO") int articleNO,
														HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception; 
	
	public ModelAndView replyForm(HttpServletRequest request, HttpServletResponse response) throws Exception; 	
	
	public ResponseEntity addReply(MultipartHttpServletRequest multipartRequest,HttpServletResponse response) throws Exception;
   
	public ResponseEntity modArticle(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;

	public  ModelAndView listPaging(HttpServletRequest request, com.myspring.FinalProject.common.paging.Criteria criteria,
			HttpServletResponse response) throws Exception;

	public  ModelAndView listCriteria(HttpServletRequest request, com.myspring.FinalProject.common.paging.Criteria criteria,
			HttpServletResponse response) throws Exception;


}
