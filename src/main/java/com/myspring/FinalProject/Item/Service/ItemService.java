package com.myspring.FinalProject.Item.Service;

import java.util.List;

import com.myspring.FinalProject.Paging;
import com.myspring.FinalProject.Item.VO.primaryVO;



public interface ItemService {
	public int ItemAdd(primaryVO vo) throws Exception;
	public int ItemDelete(String authNum,String autoNum) throws Exception;
	public int ItemUpdate(String id) throws Exception;
	public List<primaryVO> ItemSelect(String authNum) throws Exception;
	public List<primaryVO> ItemViewSelect(String authNum,String autoNum) throws Exception;
	public List<String> SearchMember(int pg,String select,String keyword,Paging pa) throws Exception;
}
