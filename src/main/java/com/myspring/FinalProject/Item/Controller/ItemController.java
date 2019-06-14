package com.myspring.FinalProject.Item.Controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.FinalProject.Item.VO.primaryVO;

public interface ItemController {

public ModelAndView ItemAdd(HttpServletRequest request,HttpServletResponse response) throws Exception;
public ModelAndView ItemUpdate(HttpServletRequest request,HttpServletResponse response,@RequestParam("authNum") String authNum,@RequestParam("autoNum") String autoNum) throws Exception;
public ResponseEntity<String> AddItem(primaryVO vo,MultipartHttpServletRequest mr,HttpServletResponse response, @RequestParam("authNum") String authNum) throws Exception;
public ModelAndView ItemView(@RequestParam("authNum") String authnum,@RequestParam("autoNum") String autoNum,HttpServletRequest request,HttpServletResponse response) throws Exception;

}

