package com.myspring.FinalProject.CompanyMember.DAO;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myspring.FinalProject.Paging;

@Repository("CompanyMemberDAO")
public class CompanyMemberDAOImpl implements CompanyMemberDAO{
@Autowired
private SqlSession spring;
@Override
public List<String> selectChooseMember(int pg) throws Exception {
	// 1일때 1~10 2일때 11~20

	Map<String,Object> page = Paging.getInstance().pagingMap(pg);
	return spring.selectList("mapper.CompanyMember.selectCompanyChooseMember",page);
}
// 각각의 선택 갯수 구하는 메소드
@Override
	public List<String> selectMember(String select,String keyword) throws Exception {
	if(select !=null) {
	  if(select.equals("searchAll")) 
		  return spring.selectList("mapper.CompanyMember.searchAllCount",keyword);//all 검색 
	  else if(select.equals("search1")) 
		  return spring.selectList("mapper.CompanyMember.searchCount1",keyword); //search1 검색
	  else if(select.equals("search2")) 
		  return spring.selectList("mapper.CompanyMember.searchCount2",keyword);//search2 검색
	} 
	return spring.selectList("mapper.CompanyMember.noSearchCount"); //검색 아닐때
}
// 각각의 검색 결과값들을 구하는 메소드
@Override
	public List<String> SearchMember(int pg,String searchSelect, String keyword) throws Exception {
	Map<String,Object> page = Paging.getInstance().pagingMap(pg, keyword);
	Map<String,Object> pages = Paging.getInstance().pagingMap(pg);
	if(searchSelect != null) {
	if(searchSelect.equals("searchAll")) 
		return spring.selectList("mapper.CompanyMember.SearchAll",page);
	else if(searchSelect.equals("search1"))
		return spring.selectList("mapper.CompanyMember.SearchName",page);
	else if(searchSelect.equals("search2")) 
		return spring.selectList("mapper.CompanyMember.SearchAddress",page);
	}
	return spring.selectList("mapper.CompanyMember.SearchNone",pages);
}
@Override
	public List<String> selectCount(int authNum, String itemSelect) throws Exception {
	Map<String, Object> countMap =new HashMap<String, Object>();
	countMap.put("authNum",authNum);
	countMap.put("itemSelect",itemSelect);
	return null;
	}
}

