package com.myspring.FinalProject.CompanyMember.Controller;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.FinalProject.Paging;
import com.myspring.FinalProject.CompanyMember.Service.CompanyMemberService;
import com.myspring.FinalProject.CompanyMember.VO.CompanyMemberVO;

@RestController
  @RequestMapping("/member/*")
 public class CompanyMemberControllerImpl implements CompanyMemberController{
@Autowired
private CompanyMemberService CompanyMemberService;	
@Autowired
private CompanyMemberVO CompanyMemberVO; 
private String select=null;
private String keyword=null;
  @Override
  @RequestMapping(value="/CompanyMemberView.do",method ={RequestMethod.GET,RequestMethod.POST})
  public ModelAndView getallview(HttpServletResponse response, HttpServletRequest request,@RequestParam("pg") int pg) throws
  Exception {
  request.setCharacterEncoding("euc-kr");
  response.setContentType("text/html;charset=euc-kr");
  String viewName = (String)request.getAttribute("viewName");
  ModelAndView mav = new ModelAndView(viewName);
  List<String>	Chooselist = new ArrayList<String>();
 
  if((request.getParameter("searchSelect") != null && request.getParameter("searchKeyWord") != null)) {
 select = request.getParameter("searchSelect");
 keyword = request.getParameter("searchKeyWord"); 
 }
  if(keyword !=null && select !=null) { //검색
  System.out.println("=========검색 후=========");	
  Chooselist = CompanyMemberService.SearchMember(pg,select,keyword);
  System.out.println("pg : "+pg);
  System.out.println("선택 : "+select+", 키워드 : "+keyword);
  request.getSession().setAttribute("list",Chooselist);
  request.getSession().setAttribute("search", keyword);
  request.getSession().setAttribute("select", select);
  }
  else {
	System.out.println("=========검색 전=========");
	if(request.getSession().getAttribute("search") != null) {
	System.out.println("=========세션 제거=========");
	request.getSession().invalidate(); 
	keyword=null;
	select=null;
	}
	  System.out.println("pg : "+pg);
	  System.out.println("선택 : "+select+", 키워드 : "+keyword);
	  Chooselist = CompanyMemberService.SearchMember(pg,select,keyword);
	  mav.addObject("list",Chooselist);
  }
  List<String> lists = CompanyMemberService.SelectMember(select,keyword); // 총 갯수
   // 총 페이지
  int totalnum = Paging.getInstance().TotalPage(lists.size());
  System.out.println("리스트 갯수 : "+lists.size());
  System.out.println("페이지 수 : "+totalnum);
  mav.addObject("pageNum", totalnum);
  mav.addObject("pg",pg);
  mav.addObject("pageCount",lists.size());
  return mav;
  }	  
}
