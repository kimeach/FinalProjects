package com.myspring.FinalProject.Item.DAO;

import java.util.List;
import java.util.Map;

import com.myspring.FinalProject.Paging;
import com.myspring.FinalProject.Item.VO.primaryVO;



public interface ItemDAO {
public int ItemInsert(primaryVO vo) throws Exception;
public int ItemDelete(Map<String,Object> delMap) throws Exception;
public int ItemUpdate(String id) throws Exception;
public List<primaryVO> ItemSelect(String authNum) throws Exception;
public List<primaryVO> ItemAllSelect() throws Exception;
public List<primaryVO> ItemViewSelect(Map<String,Object> lists) throws Exception;
public List<String> getSelectSearch() throws Exception;
public List<String> SearchMember(int pg,String select,String keyword,Paging pa) throws Exception; 
public List<String> mainSearch(Paging paging)throws Exception;
public List<String> mainTotalSearch(Paging paging)throws Exception;
public List<String> totalList(String select,Paging paging) throws Exception; 
public List<String> mainTotalList(String select,Paging paging) throws Exception;
public List<String> mainSearchMember(int pg, String select, String keyword,Paging pa) throws Exception;
}
