package com.myspring.FinalProject.CompanyMember.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.FinalProject.CompanyMember.DAO.CompanyMemberDAO;


@Service("CompanyMemberService")
public class CompanyMemberServiceImpl implements CompanyMemberService{
@Autowired
private CompanyMemberDAO CompanyMemberDAO;	
	@Override

	public List<String> SelectMember(String select,String keyword) throws Exception {
	return CompanyMemberDAO.selectMember(select,keyword);
}
	
@Override
	public List<String> SelectChooseMember(int pg) throws Exception {
	return CompanyMemberDAO.selectChooseMember(pg);
	}
@Override
	public List<String> SearchMember(int pg,String searchSelect,String keyword) throws Exception {
		return CompanyMemberDAO.SearchMember(pg,searchSelect, keyword);
	}

@Override
	public List<String> SelectCount(int authNum, String itemSelect) throws Exception {
		return CompanyMemberDAO.selectCount(authNum,itemSelect);
	}


}
