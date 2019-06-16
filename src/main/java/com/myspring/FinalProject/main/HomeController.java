package com.myspring.FinalProject.main;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.myspring.FinalProject.Paging;
import com.myspring.FinalProject.Item.Service.ItemService;

@Controller("HomeController")
@EnableAspectJAutoProxy
@RequestMapping(value="/main/*")
public class HomeController {
	@Autowired
	private ItemService ItemService;
	//매물 조회
	private String select = null;// 선택 조건 
	private String keyword = null; //검색 키워드
	private int minPrice =0; //최소금액
	private int maxPrice =0; // 최대 금액
	@RequestMapping(value= "/main/main.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public String main(HttpServletRequest request, HttpServletResponse response) throws Exception{
	return "main";
}
	
	@RequestMapping(value="mainSearch.do")
	public ModelAndView MainSearch (mainSearchVO vo,HttpServletRequest request,@RequestParam("pg") int pg,
			@RequestParam("mainSearch") String mainSearch) throws Exception{
System.out.println("============= 메인에서 검색 =============");
		
		ModelAndView mav = new ModelAndView("/item/ItemSelect");
		
		Paging.getInstance().setPg(pg);
		
		if(request.getSession().getAttribute("mainKeyword") == null)
			request.getSession().setAttribute("mainKeyword",vo.getKeyword());
		
		keyword = (String)request.getSession().getAttribute("mainKeyword");
		
		Paging.getInstance().setKeyword(keyword);
		
		List<String> countList = ItemService.mainTotalSearch(Paging.getInstance());
		
		List<String> list =ItemService.mainSearch(Paging.getInstance()); 
		
		if(request.getParameter("mainSearch") != null) {
			mav.addObject("mainSearch", mainSearch);
		}
		int totalNum=Paging.getInstance().TotalPage(countList.size());
		mav.addObject("pg", pg);
		mav.addObject("keyword", vo.getKeyword());
		mav.addObject("count",countList.size());
		mav.addObject("mainSearch", mainSearch);
		mav.addObject("list1", list);
		mav.addObject("pageNum", totalNum);
		return mav;
	}

	
	
	
}