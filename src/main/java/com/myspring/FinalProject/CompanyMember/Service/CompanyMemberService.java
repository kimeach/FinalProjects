package com.myspring.FinalProject.CompanyMember.Service;

import java.util.List;



public interface CompanyMemberService {
public List<String> SelectMember(String select,String keyword) throws Exception;
public List<String> SelectChooseMember(int pg) throws Exception;
public List<String> SearchMember(int pg,String searchSelect,String keyword) throws Exception;
public List<String> SelectCount(int authNum,String itemSelect) throws Exception;



}
