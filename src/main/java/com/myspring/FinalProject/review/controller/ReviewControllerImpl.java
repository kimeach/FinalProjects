package com.myspring.FinalProject.review.controller;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.FinalProject.review.service.ReviewService;
import com.myspring.FinalProject.review.vo.ReviewVO;



@Controller("reviewController")
public class ReviewControllerImpl implements ReviewController{
	private static final String REVIEW_IMAGE_REPO="C:\\Users\\Administrator\\git\\FinalProjects\\src\\main\\webapp\\resources\\reviewImage";
	
	@Autowired
	ReviewService reviewService;
	@Autowired
	ReviewVO reviewVO;
	
	/** 후기 리스트 페이지 **/
	@Override
	@RequestMapping(value="/review/reviewList.do", 
			method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView listReview(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		List reviewList=reviewService.listReivew();
		
		ModelAndView mav=new ModelAndView(viewName);
		mav.addObject("reviewList",reviewList);
		return mav;
	}
	
	
	/** 후기 작성 폼 페이지 **/
	@Override
	@RequestMapping(value="/review/*Form.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}


	/** 후기 추가 페이지 **/
	@Override
	@RequestMapping(value="/review/addNewReview.do", method=RequestMethod.POST)
	public ResponseEntity addNewReview(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		Map<String, Object> reviewMap=new HashMap<String, Object>();
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String) enu.nextElement();
			String value=multipartRequest.getParameter(name);
			reviewMap.put(name, value);
		}
		
		String imageFileName=upload(multipartRequest);
		HttpSession session=multipartRequest.getSession();
		/*MemberVO memberVO=(MemberVO)session.getAttribute("member");*/
		/*String id=reviewVO.getId();*/
		/*reviewMap.put("id", id); // 작성자..*/		
		reviewMap.put("imageFileName", imageFileName); // 첨부파일..

		String message;
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders=new HttpHeaders();
		responseHeaders.add("Content-type", "text/html;charset=utf-8");
		
		try {
			// DB에서 삽입처리..
			int reviewNO=reviewService.addNewReview(reviewMap);
			// upload파일에서 파일 추가
			if(imageFileName!=null&&imageFileName.length()!=0) {
				File srcFile=new File(REVIEW_IMAGE_REPO+"\\"+imageFileName);
				File destFile=new File(REVIEW_IMAGE_REPO+"\\"+reviewNO);
				FileUtils.moveToDirectory(srcFile, destFile, true);
			}
			
			message ="<script>";
		    message+="alert('후기 추가 성공!!');";
		    message+="location.href='"+multipartRequest.getContextPath()+"/review/reviewList.do';";
		    message+="</script>";
		    resEnt = new ResponseEntity(message,responseHeaders,HttpStatus.CREATED);
		}catch(Exception e) {
			File srcFile=new File(REVIEW_IMAGE_REPO+"\\"+imageFileName);
			srcFile.delete();
			
			message ="<script>";
		    message+="alert('후기 추가 실패!!ㅠㅠ');";
		    message+="location.href='"+multipartRequest.getContextPath()+"/review/reviewForm.do';";
		    message+="</script>";
		    resEnt = new ResponseEntity(message,responseHeaders,HttpStatus.CREATED);
		    e.printStackTrace();
		}
		
		return resEnt;
	}

	// 이미지파일 업로드 함수
	private String upload(MultipartHttpServletRequest multipartRequest) throws Exception{
		String imageFileName=null;
		Map<String, String> reviewMap=new HashMap<String, String>();
		Iterator<String> fileNames=multipartRequest.getFileNames();
		
		while(fileNames.hasNext()) {
			String fileName=fileNames.next();
			MultipartFile mfile=multipartRequest.getFile(fileName);
			imageFileName=mfile.getOriginalFilename();
			File file=new File(REVIEW_IMAGE_REPO+"\\"+imageFileName);
			if(mfile.getSize()!=0) { // 파일이 Null값인지 체크!
				if(!file.exists()) { // 경로 상에 파일이 존재하지 않으면
					if(file.getParentFile().mkdirs()) { // 경로에 해당 파일이 없으면
						file.createNewFile(); // 파일 생성해준다!
					}
				}
				mfile.transferTo(new File(REVIEW_IMAGE_REPO+"\\"+imageFileName));
			}
		}
		return imageFileName;
	}
	
	
	/** 후기 수정 페이지 **/
	@Override
	@RequestMapping(value="/review/viewReview.do", method=RequestMethod.GET)
	public ModelAndView viewReview(int reviewNO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav=new ModelAndView(viewName);
		reviewVO=reviewService.viewReview(reviewNO);
		mav.addObject("review",reviewVO);
		return mav;
	}
	@Override
	@RequestMapping(value="/review/modReview.do", method=RequestMethod.POST)
	public ResponseEntity modeReview(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		Map<String, Object> reviewMap=new HashMap<String, Object>();
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()) {
			String name=(String) enu.nextElement();
			String value=multipartRequest.getParameter(name);
			reviewMap.put(name, value);
		}
		
		String imageFileName=upload(multipartRequest);
		HttpSession session=multipartRequest.getSession();
		/*MemberVO memberVO=(MemberVO)session.getAttribute("member");*/
	 	String id=reviewVO.getId();
		reviewMap.put("id", id);
		reviewMap.put("imageFileName", imageFileName);
		
		String reviewNO= (String) reviewMap.get("reviewNO");
		String message;
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders=new HttpHeaders();
		responseHeaders.add("Content-type", "text/html; charset=utf-8");
		
		try {
			// DB에서 수정처리
			reviewService.modReview(reviewMap);
			// upload파일에서 이미지파일 수정..
			if(imageFileName!=null && imageFileName.length()!=0) {
				File srcFile=new File(REVIEW_IMAGE_REPO+"\\"+imageFileName);
				File desrFile=new File(REVIEW_IMAGE_REPO+"\\"+reviewNO);
				FileUtils.moveToDirectory(srcFile, desrFile, true);
			}
			
			 message ="<script>";
			 message+="alert('후기 수정 성공!');";
			 message+="location.href='"+multipartRequest.getContextPath()+"/review/viewReview.do?reviewNO="+reviewNO+"';";
			 message+="</script>";
			 resEnt = new ResponseEntity(message,responseHeaders,HttpStatus.CREATED);
		}catch(Exception e) {
			File srcFile=new File(REVIEW_IMAGE_REPO+"\\"+imageFileName);
			srcFile.delete();
			
			message ="<script>";
		    message+="alert('오류가 발생했습니다. 다시 시도해 주세요');";
		    message+="location.href='"+multipartRequest.getContextPath()+"/review/viewReview.do?reviewNO="+reviewNO+"';";
		    message+="</script>";
		    resEnt = new ResponseEntity(message,responseHeaders,HttpStatus.CREATED);
		    e.printStackTrace();
		}
		return resEnt;
	}


	/** 후기 삭제 페이지 **/
	@Override
	@RequestMapping(value="/review/removeReview.do", method=RequestMethod.POST)
	public ModelAndView removeReview(@RequestParam("reviewNO") int reviewNO,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName;
		ModelAndView mav=new ModelAndView();
		String message;
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders=new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		try {
			// DB에서 삭제
			reviewService.removeReview(reviewNO);
			// upload폴더에서 첨부파일 삭제
			File destDir=new File(REVIEW_IMAGE_REPO+"\\"+reviewNO);
			FileUtils.deleteDirectory(destDir);
			
				message="<script>";
				message+="alert('후기 삭제 성공!')";
				message+="location.href='"+request.getContextPath()+"/review/reviewList.do';";
				message+="</script>";
				mav.setViewName("redirect:/review/reviewList.do");

		}catch(Exception e) {
			message ="<script>";
			message+="alert('후기 삭제 실패');";
			message+="location.href='"+request.getContextPath()+"/review/reviewList.do';";
			message+="</script>";
			mav.setViewName("redirect:/review/reviewForm.do");
			
  	        e.printStackTrace();
		}
		return mav;
	}

	
}
