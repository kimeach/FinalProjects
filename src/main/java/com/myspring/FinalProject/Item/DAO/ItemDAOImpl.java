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
		Map<String,Object> page = Paging.getInstance().selectPriceMap(pg,keyword,pa);
		Map<String,Object> pages =Paging.getInstance().pagingMap(pg);
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
		else
		return spring.selectList("mapper.Item.SearchNone",pages);
	return null;
	}
	
	@Override
	public List<String> mainSearchMember(int pg, String select, String keyword,Paging pa)	throws Exception {
	Map<String,Object> page = Paging.getInstance().selectPriceMap(pg,keyword,pa);
	Map<String,Object> pages =Paging.getInstance().pagingMap(pg);
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
	else
	return spring.selectList("mapper.Item.SearchNone",pages);
return null;
}
	
	@Override
	public List<String> mainSearch(Paging paging) throws Exception{
		return spring.selectList("mapper.Item.mainSearch",paging.mainSearchMap(paging));
	}
	@Override
	public List<String> mainTotalSearch(Paging paging) throws Exception{
		return spring.selectList("mapper.Item.mainTotalSearch",paging.mainTotalSearchMap(paging));
	}
	@Override
	public List<String> totalList(String select,Paging paging) throws Exception{
		if(select != null) {
		//전체
		if(select.equals("all")) 
			return spring.selectList("mapper.Item.searchCountAll", paging.totalCountMap(paging));
		//매매
		else if(select.equals("search1"))
			return spring.selectList("mapper.Item.searchCount1", paging.totalCountMap(paging));
		//전세
		else if(select.equals("search2"))
			return spring.selectList("mapper.Item.searchCount2", paging.totalCountMap(paging));
		//월세
		else if(select.equals("search3"))
			return spring.selectList("mapper.Item.searchCount3", paging.totalCountMap(paging));
		}
		//검색전
		else
			return spring.selectList("mapper.Item.searchCountNone", paging.totalCountNoneMap(paging));
		return null;
	}
	
	@Override
	public List<String> mainTotalList(String select,Paging paging) throws Exception{
		if(select != null) {
		//전체
		if(select.equals("all")) 
			return spring.selectList("mapper.Item.searchCountAll", paging.totalCountMap(paging));
		//매매
		else if(select.equals("search1"))
			return spring.selectList("mapper.Item.searchCount1", paging.totalCountMap(paging));
		//전세
		else if(select.equals("search2"))
			return spring.selectList("mapper.Item.searchCount2", paging.totalCountMap(paging));
		//월세
		else if(select.equals("search3"))
			return spring.selectList("mapper.Item.searchCount3", paging.totalCountMap(paging));
		}
		//검색전
		else
			return spring.selectList("mapper.Item.searchCountNone", paging.totalCountNoneMap(paging));
		return null;
	}
	

	
}
