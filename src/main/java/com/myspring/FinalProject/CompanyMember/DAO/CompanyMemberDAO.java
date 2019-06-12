package com.myspring.FinalProject.CompanyMember.DAO;

import java.util.List;



public interface CompanyMemberDAO {
public List<String> selectMember(String select,String keyword) throws Exception;
public List<String> selectChooseMember(int pg) throws Exception;
public List<String> SearchMember(int pg,String searchSelect,String keyword) throws Exception;
public List<String> selectCount(int authNum,String itemSelect)throws Exception;

}
