package com.myspring.FinalProject;

import java.util.HashMap;
import java.util.Map;
public class Paging {
	private static Paging pages;
	private Paging() {}
	final int page = 10;
	public static synchronized Paging getInstance() {
		if(pages == null) {
			pages = new Paging();
		}
		return pages;
	}
	
	private int min; 
	private int max;
	private String keyword;
	private int minPrice; 
	private int maxPrice;
	private String authNum;
	private int money;
	private int pg;
	public int getMin() {return min;}
	public void setMin(int min) {this.min = min;}
	public int getMax() {return max;}
	public void setMax(int max) {this.max = max;}
	public int getMinPrice() {return minPrice;}
	public void setMinPrice(int minPrice) {this.minPrice = minPrice;}
	public int getMaxPrice() {return maxPrice;}
	public void setMaxPrice(int maxPrice) {this.maxPrice = maxPrice;}
	public String getAuthNum() {return authNum;}
	public void setAuthNum(String authNum) {this.authNum = authNum;}
	public int getMoney() {return money;}
	public void setMoney(int money) {this.money = money;}
	public String getKeyword() {return keyword;}
	public void setKeyword(String keyword) {this.keyword = keyword;}
	public int getPg() {return pg;}
	public void setPg(int pg) {this.pg = pg;}
	
	//페이지 갯수 구하기(1~10)
	public void MapMethod(int pg) {
	int minPage=0; int maxPage=0;
	if(pg==1) {minPage = pg; maxPage = pg*page;}
	else if(pg>1) {maxPage = pg*page; minPage = maxPage-(page-1);}
	setMin(minPage); setMax(maxPage);}
	
	//총 페이지 갯수 구하기
	public int TotalPage(int num){
	return (int)(Math.floor(num/page)+1); // 페이지네이션 갯수 나타내기
	}
	
	//keyword 있을때 맵 생성
	public Map<String,Object> pageMap(String keyword){
	Map<String, Object> KeywordMap = new HashMap<String, Object>();
	KeywordMap.put("keyword", keyword);
	KeywordMap.put("minPage", this.getMin());
	KeywordMap.put("maxPage", this.getMax());
	KeywordMap.put("authNum",this.getAuthNum());
	return KeywordMap;
	}
	
	//keyword 없을때 맵 생성
	public Map<String,Object> pageMap(){
		Map<String, Object> KeywordMap = new HashMap<String, Object>();
		KeywordMap.put("minPage", this.getMin());
		KeywordMap.put("maxPage", this.getMax());
		KeywordMap.put("authNum",this.getAuthNum());
		return KeywordMap;
		}
	
	//keyword 있을때 맵 처리 
	public Map<String,Object> pagingMap(int pg,String keyword) {
	this.MapMethod(pg);
	return this.pageMap(keyword);
	}
	
	//keyword 없을때  맵 처리
	public Map<String,Object> pagingMap(int pg) {
	this.MapMethod(pg);
	return this.pageMap();
	}
	
	// money 까지 들어가	
	public Map<String,Object> priceMap(int pg,String keyword,Paging ps){
		Map<String, Object> selectPriceMap = new HashMap<String, Object>();
		selectPriceMap.put("keyword", keyword);
		selectPriceMap.put("minPage", ps.getMin());
		selectPriceMap.put("maxPage", ps.getMax());
		selectPriceMap.put("minPrice",ps.getMinPrice());
		selectPriceMap.put("maxPrice",ps.getMaxPrice());
		selectPriceMap.put("authNum",ps.getAuthNum());
		return selectPriceMap;
	}
	public Map<String, Object> selectPriceMap(int pg,String keyword,Paging pa){
		pa.MapMethod(pg);
		return this.priceMap(pg,keyword,pa);
	}
	public Map<String, Object> mainSearchMethod(Paging paging){
		Map<String, Object> mainMap = new HashMap<String, Object>();
		mainMap.put("keyword", paging.getKeyword());
		mainMap.put("minPage", paging.getMin());
		mainMap.put("maxPage", paging.getMax());		
		return mainMap;
	}
	public Map<String, Object> mainSearchMap(Paging paging){
		//minpage,maxpage,money,keyword
		paging.MapMethod(paging.getPg());
		return paging.mainSearchMethod(paging);
	}
	
	public Map<String, Object> mainTotalSearchMethod(Paging paging){
		Map<String, Object> mainMap = new HashMap<String, Object>();
		mainMap.put("keyword", paging.getKeyword());
		return mainMap;
	}
	public Map<String, Object> mainTotalSearchMap(Paging paging){
		return paging.mainTotalSearchMethod(paging);
	}
	
	
	public Map<String, Object> totalCountMethod(Paging paging){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", paging.getKeyword());
		map.put("authNum", paging.getAuthNum());
		map.put("minPrice", paging.getMinPrice());
		map.put("maxPrice", paging.getMaxPrice());
		return map;	
		}
	public Map<String, Object> totalCountNoneMethod(Paging paging){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("authNum", paging.getAuthNum());
		return map;	
		}
	//갯수 구하기
	public Map<String, Object> totalCountMap(Paging paging){
	return paging.totalCountMethod(paging);	
	}
	
	public Map<String, Object> totalCountNoneMap(Paging paging){
		return paging.totalCountNoneMethod(paging);	
	}
		
	
	
	


}
