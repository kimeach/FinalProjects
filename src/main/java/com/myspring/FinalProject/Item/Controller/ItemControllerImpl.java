package com.myspring.FinalProject.Item.Controller;
import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.FinalProject.Paging;
import com.myspring.FinalProject.Item.Service.ItemService;
import com.myspring.FinalProject.Item.VO.primaryVO;


@RestController
@RequestMapping(value = "item/*")
public class ItemControllerImpl implements ItemController {
	
	int a;
	@Autowired
	private ItemService ItemService;
	@Autowired
	private primaryVO primaryVO;
	//매물 조회
	private String select = null;// 선택 조건 
	private String keyword = null; //검색 키워드
	private int minPrice =0; //최소금액
	private int maxPrice =0; // 최대 금액
	@RequestMapping(value = "/ItemSelect.do", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView index2(HttpServletRequest request, HttpServletResponse response,@RequestParam("authNum") String authNum,
							   @RequestParam("pg") int pg) throws Exception {
	String viewName = (String) request.getAttribute("viewName");
	ModelAndView mav = new ModelAndView(viewName);
	List<String> Chooselist = new ArrayList<String>();
	//검색 후
	//초기 검색 		
	if(request.getParameter("Itemselect") != null && request.getParameter("addr")!= null &&
			request.getParameter("minPrice") != null &&request.getParameter("maxPrice") != null) { 
		select = request.getParameter("Itemselect");
		keyword = request.getParameter("addr");
		minPrice = Integer.parseInt(request.getParameter("minPrice"));
		maxPrice = Integer.parseInt(request.getParameter("maxPrice"));
		System.out.println("min : "+minPrice);
		System.out.println("max : "+maxPrice);
	
	}
	//페이지네이션 2 이상일때 검색
	if(select!=null && keyword !=null && minPrice != 0 && maxPrice != 0) {
    System.out.println("=========상세 검색 후=========");	
    Paging.getInstance().setMinPrice(minPrice);
    Paging.getInstance().setMaxPrice(maxPrice);
    Chooselist = ItemService.SearchMember(pg,select,keyword,Paging.getInstance());
    System.out.println("pg : "+pg);
    System.out.println("선택 : "+select+", 키워드 : "+keyword);
    request.getSession().setAttribute("list",Chooselist);
    request.getSession().setAttribute("search", keyword);
    request.getSession().setAttribute("select", select);
	}
	//검색 아닐때
	else{
	System.out.println("=========매물 상세 검색 전=========");
	if(request.getSession().getAttribute("search") != null) {
	System.out.println("search 제거");	
	request.getSession().removeAttribute("search");
	System.out.println("select 제거");	
	request.getSession().removeAttribute("select");
	keyword=null;
	select=null;
	minPrice = 1;
	maxPrice = 1000;
	}
	System.out.println("pg : "+pg);
	System.out.println("선택 : "+select+", 키워드 : "+keyword);
	System.out.println("authNum : "+authNum);
	Paging.getInstance().setMinPrice(minPrice);
	System.out.println("minPrice 추가"+Paging.getInstance().getMinPrice());
	Paging.getInstance().setMaxPrice(maxPrice);
	System.out.println("maxPrice 추가"+Paging.getInstance().getMaxPrice());
	Paging.getInstance().setAuthNum(authNum);
	System.out.println("authNum 추가"+Paging.getInstance().getAuthNum());
	Chooselist = ItemService.SearchMember(pg,select,keyword,Paging.getInstance());
	System.out.println("list 생성");
	mav.addObject("list",Chooselist);
	System.out.println("list를 mav 에 추가");
	}
	System.out.println("if 문 탈출");
	int totalnum=Paging.getInstance().TotalPage(Chooselist.size());
	System.out.println("totalnum 대입");
	//검색전
	mav.addObject("pg",pg);
	System.out.println("pg 생성");
	request.getSession().setAttribute("authNum",authNum);
	System.out.println("session 생성");
	mav.addObject("pageNum", totalnum);
	System.out.println("pageNum 생성");
	return mav;
	}
	
	@Override
	@RequestMapping(value = "/ItemInsert.do", method = { RequestMethod.GET, RequestMethod.POST })
	// 물품 등록 창
	
	public ModelAndView ItemAdd(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
	ModelAndView mav = new ModelAndView(viewName);
	return mav;
	}
	@Override
	@RequestMapping(value="/ItemUpdate.do",method=RequestMethod.GET)
	public ModelAndView ItemUpdate(HttpServletRequest request, HttpServletResponse response,@RequestParam("authNum") String authNum,@RequestParam("autoNum") String autoNum)
	throws Exception {
	String viewName= (String)request.getAttribute("viewName");
	ModelAndView mav = new ModelAndView(viewName);	
	return mav;
	}
	//등록 결과	
	@Override
	@RequestMapping(value="/ItemInsertResult.do")
	public ResponseEntity<String> AddItem(primaryVO vo,MultipartHttpServletRequest mr,HttpServletResponse response,
											@RequestParam("authNum") String authNum) throws Exception {
		final String ImagePath = mr.getRealPath("resources/itemImage/");
		List<String> fileList = new ArrayList<String>();
		HttpHeaders http = new HttpHeaders();
		http.add("Content-type", "text/html; charset=utf-8");
		  String originalFileName = null;
		  originalFileName =vo.getPicture2().getOriginalFilename();
		  fileList.add(originalFileName);
		
		  File file = new File(ImagePath +"\\" + originalFileName);
		  if(vo.getPicture2().getSize() != 0) { if(! file.exists()) {
		  if(file.getParentFile().mkdirs()) { file.createNewFile(); } }
		  vo.getPicture2().transferTo(new File(ImagePath + "\\" + originalFileName)); }
		 
		  System.out.println(originalFileName); 
		  vo.setPicture(originalFileName);
		int result = ItemService.ItemAdd(vo);
		
		
		String message ="<script>";
		if (result == 0) {
		message += "alert('가입에 실패 하였습니다.');";
		message += "location.href='./ItemInsert.do';";
		}
		else if(result !=0){
		message += "alert('가입에 성공 하였습니다.');";
		message += "location.href='../member/CompanyMemberView.do?pg=1';";
	}
		message += "</script>";
		return new ResponseEntity<String>(message,http,HttpStatus.CREATED);
	}
	
	@RequestMapping(value="/ItemResult.do",method=RequestMethod.GET)
	public ResponseEntity<String> ItemDeleteAndUpdate(HttpServletRequest request,HttpServletResponse response,
													  @RequestParam("status") String status,@RequestParam("authNum") String authNum,@RequestParam("autoNum") String autoNum)
													  throws Exception{
		
		HttpHeaders http = new HttpHeaders();
		http.add("content-type","text/html; charset=utf-8");
		String message="<script>";
/*		if(status.equals("update")) {
		int result = ItemService.ItemUpdate(authNum,autoNum);
		if(result !=0) {
		message +="alert('수정되었습니다.');";
		message +="location.href='';";
		}
		else if(result ==0) {
		message +="alert('수정에 실패 하였습니다.');";
		message +="location.href='';";
		}
	}*/
	if(status.equals("delete")) {
	int result = ItemService.ItemDelete(authNum,autoNum);
	if(result != 0) {
	message +="alert('삭제 되었습니다.');";
	message +="location.href='./ItemSelect.do?authNum="+authNum+"&pg=1';";
	}
	else if(result == 0) {
	message +="alert('삭제에 실패하였습니다.');";
	message +="history.go(-1);";
	}
	}
	message +="</script>";
	return new ResponseEntity<String>(message,http,HttpStatus.OK);
	}
	@Override
	@RequestMapping(value="/ItemView.do",method=RequestMethod.GET)
	public ModelAndView ItemView(@RequestParam("authNum") String authNum,@RequestParam("autoNum") String autoNum,HttpServletRequest request,HttpServletResponse response) throws Exception {
	String viewName = (String)request.getAttribute("viewName");
	ModelAndView mav = new ModelAndView(viewName);
	mav.addObject("list", ItemService.ItemViewSelect(authNum,autoNum));	
	return mav;
	}
}


