package com.myspring.FinalProject.board.controller;

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

import com.myspring.FinalProject.board.service.BoardService;
import com.myspring.FinalProject.board.vo.ArticleVO;
import com.myspring.FinalProject.board.vo.PageVO;
import com.myspring.FinalProject.common.paging.Criteria;
import com.myspring.FinalProject.common.paging.PageMaker;

@Controller("boardController")
public class BoardControllerImpl implements BoardController {
	private static final String ARTICLE_IMAGE_REPO = "C:\\board\\article_image";
	@Autowired
	BoardService boardService;
	@Autowired
	ArticleVO articleVO;
	@Autowired
	PageVO pageVO;
	
	// 게시판 글 전체 리스트
/*	@Override
	@RequestMapping(value = "/board/listArticles.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listArticles(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String viewName = (String) request.getAttribute("viewName");
		List articlesList = boardService.listArticles();
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("articlesList", articlesList);
	
		return mav;
	}*/
	
	// 검색
/*	@Override
	@RequestMapping(value="/board/searchList.do", method = { RequestMethod.GET, RequestMethod.POST })	
	public ModelAndView listArticles(@RequestParam("keyword") String keyword, Criteria criteria,
			 										HttpServletRequest request, HttpServletResponse response) throws Exception {

		String viewName = (String) request.getAttribute("viewName");
		System.out.println("searchList.do의 viewName======"+viewName);
		System.out.println("searchList.do의 keyword======"+keyword);
						
		criteria.setKeyword(keyword);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);	
		
		List<ArticleVO> articlesList = boardService.listArticles(criteria);		
		System.out.println("건수:"+articlesList.size());
		int total = articlesList.size();
		pageMaker.setTotalCount(total);		
		
		ModelAndView mav = new ModelAndView(viewName);

		mav.addObject("articlesList", articlesList);
		mav.addObject("keyword", keyword);		
		mav.addObject("pageMaker",pageMaker);		
		System.out.println("listPaging.do의 pageMaker =========="+pageMaker);

		return mav;
	}*/
	
	// 해당 페이지 게시글 불러오기
	@Override
	@RequestMapping(value = "/board/listCriteria.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listCriteria(HttpServletRequest request, 
													Criteria criteria, HttpServletResponse response) throws Exception {		
		String viewName = (String) request.getAttribute("viewName");
		List articlesList = boardService.listCriteria(criteria);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("articlesList", articlesList);
		return mav;
	}
	
	// 게시판 글 전체 리스트(페이징 처리) + 검색처리
	@Override
	@RequestMapping(value = "/board/listPaging.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listPaging(HttpServletRequest request, 
													Criteria criteria, HttpServletResponse response) throws Exception {		
		String keyword=request.getParameter("keyword");
		if (keyword==null || keyword.isEmpty())
			  keyword="";
		
		criteria.setKeyword(keyword);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		int total = boardService.CountArticles(criteria);
		pageMaker.setTotalCount(total);		
		
		String viewName = (String) request.getAttribute("viewName");
		System.out.println("listPaging.do의 viewName========"+viewName);
		List articlesList = boardService.listCriteria(criteria);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("articlesList", articlesList);
		mav.addObject("pageMaker",pageMaker);
		mav.addObject("keyword", keyword);
		System.out.println("listPaging.do의 pageMaker =========="+pageMaker);
		System.out.println("pagemaker.endPage:"+pageMaker.getEndPage());

		return mav;
	}
	
	// 새글 등록 처리
	@Override
	@RequestMapping(value = "/board/addNewArticle.do", method = RequestMethod.POST)
	public ResponseEntity addNewArticle(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		Map<String, Object> articleMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			System.out.println("addNewArticle_name:"+name);
			System.out.println("addNewArticle_value:"+value);
			articleMap.put(name, value);
		}

		String imageFileName = upload(multipartRequest);
		HttpSession session = multipartRequest.getSession();
		//MemberVO memberVO = (MemberVO)session.getAttribute("member");
		//String id = memberVO.getId(); //memberVO만들어야하나??
		
		//String id = articleVO.getId(); // 로그인 기능 연결하게되면 지우기
		articleMap.put("parentNO", 0); // 원글인경우 parentNO=0
		//articleMap.put("id", id); 
		//int articleNO = articleVO.getArticleNO();		
		articleMap.put("imageFileName", imageFileName);		
		
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-type", "text/html; charset=utf-8");
		System.out.println("board Impl의 addNewArticle======:"+articleMap);
		
		try {
			int articleNO = boardService.addNewArticle(articleMap); //여기서나오는지 위에서 나오는지 확인
			
			if (imageFileName != null && imageFileName.length() != 0) {
				File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
				File destFile = new File(ARTICLE_IMAGE_REPO + "\\" + articleNO);
				FileUtils.moveToDirectory(srcFile, destFile, true);
				
				System.out.println("첨부파일 originalFileName:"+imageFileName);
			}
				
			message = "<script>";
			message += "alert('글이 등록되었습니다.');";
			message += "location.href='" + multipartRequest.getContextPath() + "/board/listPaging.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {
			File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
			srcFile.delete();

			message = "<script>";
			message += "alert('오류가 발생했습니다. 다시 시도해 주세요.');";
			message += "location.href='" + multipartRequest.getContextPath() + "/board/articleForm.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}

	// 파일업로드
	private String upload(MultipartHttpServletRequest multipartRequest) throws Exception {
		String imageFileName=null;
		Map<String,String> artcleMap = new HashMap<String, String>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		
		while(fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			imageFileName = mFile.getOriginalFilename();
			File file = new File(ARTICLE_IMAGE_REPO+"\\"+imageFileName);
			if(mFile.getSize()!=0) {//File null check
				if(!file.exists()) {//경로상에 파일이 존재하지 않으면
					if(file.getParentFile().mkdirs()) {//경로에 해당 파일 디렉토리들 생성
						file.createNewFile();//파일 생성
					}
				}
				mFile.transferTo(new  File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName));
			}
		}
		return imageFileName;
	}

	// 글 상세보기
	@Override
	@RequestMapping(value = "board/viewArticle.do", method = RequestMethod.GET)
	public ModelAndView viewArticle(int articleNO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		articleVO = boardService.viewArticle(articleNO);
		mav.setViewName(viewName);
		mav.addObject("article", articleVO);
		return mav;
	}

	// 글쓰기 창에 넘어갈때 parentNO(계층) 넘기는 과정
	@Override
	@RequestMapping(value = "/board/*Form.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String parentNO= request.getParameter("parentNO");
		System.out.println("parentNO"+parentNO);
		
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		if(parentNO!=null & !"".equals(parentNO))
			mav.addObject("parentNO",parentNO);
		return mav;
	}
	
	// 답글폼
	@Override
	@RequestMapping(value="/board/replyForm.do", method = { RequestMethod.GET, RequestMethod.POST})
	public ModelAndView replyForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");		
		ModelAndView mav = new ModelAndView(viewName);	
		
		String parentNO= request.getParameter("parentNO");
		System.out.println("parentNO"+parentNO);				
		if(parentNO!=null & !"".equals(parentNO))
			mav.addObject("parentNO",parentNO);

		String sido= request.getParameter("sido");
		String gugun = request.getParameter("gugun");		
		String groupNO  = request.getParameter("groupNO");				
		mav.addObject("sido",sido);
		mav.addObject("gugun",gugun);	
		mav.addObject("groupNO",groupNO);	
		return mav;
	}

	//답글 등록 처리
	@Override
	@RequestMapping(value = "/board/addReply.do", method = RequestMethod.POST)
	public ResponseEntity addReply(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		Map<String, Object> articleMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			System.out.println("Board Impl의 addReply의 name======" + name);
			System.out.println("Board Impl의 addReply의 value======" + value);			
			articleMap.put(name, value);
		}
		String imageFileName = upload(multipartRequest);
		HttpSession session = multipartRequest.getSession();		
		articleMap.put("imageFileName", imageFileName);	
		
		int levelNO = articleVO.getLevelNO()+1; //level+1 해서 추가
		articleMap.put("levelNO", levelNO);		
		System.out.println("cont Impl의 addReply.do의 levelNO 은======"+levelNO);		
		
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-type", "text/html; charset=utf-8");		
		int articleNO = boardService.addReply(articleMap);		
		
		try {
				if (imageFileName != null && imageFileName.length() != 0) {
					File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
					File destFile = new File(ARTICLE_IMAGE_REPO + "\\" + articleNO);
					FileUtils.moveToDirectory(srcFile, destFile, true);
				}
			message = "<script>";
			message += "alert('답변을 추가하였습니다.');";
			message += "location.href='" + multipartRequest.getContextPath() + "/board/listPaging.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			
		} catch (Exception e) {
			File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
			srcFile.delete();// 파일 삭제

			message = "<script>";
			message += "alert('오류가 발생했습니다. 다시 시도해 주세요');";
			message += "location.href='" + multipartRequest.getContextPath() + "/board/replyForm.do?articleNo="+articleNO+"';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}		
	
	// 삭제
		@Override
		@RequestMapping(value="/board/removeArticle.do", method=RequestMethod.POST)
		public ResponseEntity removeArticle(int articleNO, 
															HttpServletRequest request, HttpServletResponse response)
															throws Exception {	       
			 String message;
	         ResponseEntity resEnt=null;
	         HttpHeaders responseHeaders = new HttpHeaders();
	         responseHeaders.add("Content-Type", "text/html; charset=utf-8");
	         
	         try {
	        	   //db에서 글 삭제
	        	   boardService.removeArticle(articleNO);
	        	   //upload폴더에서 첨부파일 삭제
	        	   File destDir = new File(ARTICLE_IMAGE_REPO+"\\"+articleNO);
	        	   FileUtils.deleteDirectory(destDir);
	        	   
	        	    message ="<script>";
				    message+="alert('글을 삭제하였습니다.');";
				    message+="location.href='"+request.getContextPath()+"/board/listPaging.do';";
				    message+="</script>";
	        	    resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	        	    
	         }catch(Exception e) {
	        	    message ="<script>";
				    message+="alert('작업 중 오류가 발생하였습니다.');";
				    message+="location.href='"+request.getContextPath()+"/board/listPaging.do';";
				    message+="</script>";
	     	        resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	        	    e.printStackTrace();
	         }	         
			return resEnt;
		}

	// 글 수정
	@Override
	@RequestMapping(value="/board/modArticle.do", method=RequestMethod.POST)
	public ResponseEntity modArticle(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
													throws Exception {
		Map<String,Object> articleMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while(enu.hasMoreElements()) {
			String name = (String)enu.nextElement(); 
			String value =	 multipartRequest.getParameter(name); 
			articleMap.put(name,value);
		}
		
		String imageFileName = upload(multipartRequest);
		HttpSession session = 	multipartRequest.getSession();
		String id = articleVO.getId();
		String articleNO = Integer.toString(articleVO.getArticleNO());
		articleMap.put("id",id);//작성자 
		articleMap.put("imageFileName", imageFileName);//첨부파일명
		articleMap.put("articleNO", articleNO);//글번호		
		
		System.out.println("===========modArticle.do의 articleMap:"+articleMap);
		
		String message;
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-type","text/html; charset=utf-8");
		
		try { //db에 수정 처리
			boardService.modArticle(articleMap);
			if(imageFileName!=null && imageFileName.length()!=0) {
				File srcFile = new File(ARTICLE_IMAGE_REPO +"\\"+"temp"+"\\"+imageFileName); 
				File destFile = new File(ARTICLE_IMAGE_REPO +"\\"+articleNO);
				FileUtils.moveToDirectory(srcFile, destFile, true);
				}
			 message ="<script>";
			 message+="alert('글을 수정하였습니다.');";
			 message+="location.href='"+multipartRequest.getContextPath()+"/board/viewArticle.do?articleNO="+articleNO+"';";
			 message+="</script>";
			 
			 resEnt = new ResponseEntity(message,responseHeaders,HttpStatus.CREATED);
		 
		 }catch(Exception e) {
			 File srcFile = new File(ARTICLE_IMAGE_REPO +"\\"+"temp"+"\\"+imageFileName);
			 srcFile.delete();//파일 삭제		 
			 message ="<script>";
			 message+="alert('수정 중 오류가 발생했습니다. 다시 시도해 주세요');";
			 message+="location.href='"+multipartRequest.getContextPath()+"/board/viewArticle.do?articleNO="+articleNO+"';";
			 message+="</script>";
			  resEnt = new ResponseEntity(message,responseHeaders,HttpStatus.CREATED);
			  e.printStackTrace(); 
		  }
		return resEnt;		 
	}
}
