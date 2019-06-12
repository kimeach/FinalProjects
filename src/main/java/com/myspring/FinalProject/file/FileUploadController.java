package com.myspring.FinalProject.file;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller("comFile")
public class FileUploadController {
	private static String CURR_IMAGE_REPO_PATH = "c:\\spring\\Image_repo";
	
	@RequestMapping(value="/uploadForm.do")
	public String FileForm(HttpServletRequest request,HttpServletResponse response) {

		return "/uploadForm";
	}
	
	
	//업로드 처리 경로
	@RequestMapping(value="/upload.do", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView upload(MultipartHttpServletRequest multipartRequest,
			                                  HttpServletResponse response) throws Exception{
		multipartRequest.setCharacterEncoding("utf-8");  
		Map map = new HashMap();
        		
		Enumeration enu = multipartRequest.getParameterNames();
		
        while(enu.hasMoreElements()) {
        	String name = (String) enu.nextElement();
        	String value = multipartRequest.getParameter(name);
        	map.put(name, value);
        }
        
        List fileList = fileProcess(multipartRequest);
		
        ModelAndView mav = new ModelAndView();
		//view로 결과를 보내기 위한 처리
		map.put("fileList", fileList);
		mav.addObject("map",map);
	    mav.setViewName("/Company/comMemberForm");
	    
		return mav;
	}

	
	private List<String> fileProcess(MultipartHttpServletRequest multipartRequest) 
			                                                                                      throws Exception{
        List<String> fileList = new ArrayList<String>();
        Iterator<String> fileNames = multipartRequest.getFileNames();
        while(fileNames.hasNext()) {
        	String fileName = fileNames.next();
        	MultipartFile mFile = multipartRequest.getFile(fileName);
        	String originalFileName = mFile.getOriginalFilename();
        	fileList.add(originalFileName);//파일명 저장
        	File file = new File(CURR_IMAGE_REPO_PATH+ "\\" + fileName);
        	if(mFile.getSize()!=0) {//첨부파일 존재여부 확인
        		if(!file.exists()) {//경로에 파일이 없으면 해당 디렉토리 생성 후 파일생성
        			if(file.getParentFile().mkdirs()) {
        				file.createNewFile();
        			}
        		}
        		mFile.transferTo(new File(CURR_IMAGE_REPO_PATH+ "\\" + originalFileName));
        	}
        	
        }
		return fileList;
	}
	
	
	@RequestMapping(value="/location.do")
	public String location(HttpServletRequest request,HttpServletResponse response) {

		return "/location";
	}
	
	
	
	}
	
	
	
