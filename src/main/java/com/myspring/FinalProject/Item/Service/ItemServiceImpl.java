package com.myspring.FinalProject.Item.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.FinalProject.Paging;
import com.myspring.FinalProject.Item.DAO.ItemDAO;
import com.myspring.FinalProject.Item.VO.primaryVO;


@Service("ItemService")
public class ItemServiceImpl implements ItemService{
@Autowired
private ItemDAO ItemDAO;

@Override
public int ItemAdd(primaryVO vo) throws Exception {
	// TODO Auto-generated method stub
	return ItemDAO.ItemInsert(vo);
}

@Override
public int ItemDelete(String authNum,String autoNum) throws Exception {
	Map<String,Object> delMap = new HashMap<String, Object>();
	delMap.put("authNum", authNum);
	delMap.put("autoNum",autoNum);
	return ItemDAO.ItemDelete(delMap);
}

@Override
public int ItemUpdate(String id) throws Exception {
	// TODO Auto-generated method stub
	return ItemDAO.ItemUpdate(id);
}

@Override
public List<primaryVO> ItemSelect(String authNum) throws Exception {
	return ItemDAO.ItemSelect(authNum);
}
@Override
public List<primaryVO> ItemViewSelect(String authNum,String autoNum) throws Exception {
	Map<String, Object> numMap = new HashMap<String, Object>();
	numMap.put("authNum", authNum);
	numMap.put("autoNum", autoNum);
	
	return ItemDAO.ItemViewSelect(numMap);
}
	@Override
		public List<String> SearchMember(int pg, String select, String keyword,Paging pa)
					   throws Exception {
			return ItemDAO.SearchMember(pg,select,keyword,pa); 
		}



}
