package com.myspring.FinalProject.Item.DAO;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myspring.FinalProject.Paging;
import com.myspring.FinalProject.Item.VO.primaryVO;

@Repository("ItemDAO")
public class ItemDAOImpl implements ItemDAO{
@Autowired
private SqlSession spring;
private int count=0;
@Override
public int ItemInsert(primaryVO vo) throws Exception {

return spring.insert("mapper.Item.insertItem", vo);

}

@Override
public int ItemDelete(Map<String,Object> delMap) throws Exception {
	return spring.delete("mapper.Item.deleteItem", delMap);
}
@Override
public int ItemUpdate(String id) throws Exception {
	return spring.update("mapper.Item.updateItem", id);
}
@Override
public List<primaryVO> ItemSelect(String authNum) throws Exception {
	return spring.selectList("mapper.Item.itemSelect",authNum);
}
@Override
	public List<primaryVO> ItemAllSelect() throws Exception {
	return null;
	}
@Override
	public List<primaryVO> ItemViewSelect(Map<String,Object> lists) throws Exception {
		return spring.selectList("mapper.Item.getItemViewSelect",lists);
	}
	@Override
		public List<String> getSelectSearch() throws Exception {
			return spring.selectList("mapper.Item.getSelectSearch");
		}
	// 각각의 검색 결과값들을 구하는 메소드
	@Override
		public List<String> SearchMember(int pg, String select, String keyword,Paging pa)	throws Exception {
		Paging paging = new Paging();
		Map<String,Object> page = paging.selectPriceMap(pg,keyword,pa);
		Map<String,Object> pages = paging.pagingMap(pg);
		if(select != null) {
		if(select.equals("all")) 
			return spring.selectList("mapper.Item.SearchAll",page);
		else if(select.equals("search1"))
			return spring.selectList("mapper.Item.Search1",page);
		else if(select.equals("search2")) 
			return spring.selectList("mapper.Item.Search2",page);
		else if(select.equals("search3")) 
			return spring.selectList("mapper.Item.Search3",page);
		}
		return spring.selectList("mapper.Item.SearchNone",pages);
	}
}
