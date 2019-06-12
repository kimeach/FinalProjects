package com.myspring.FinalProject.member.Company.service;

import java.util.List;

import com.myspring.FinalProject.member.Company.vo.ComVO;
import com.myspring.FinalProject.member.General.vo.GenerVO;


public interface ComService {

    public List<ComVO>comListMember() throws Exception;
	public int insertCom(ComVO comVO)throws Exception;
	public ComVO login(ComVO comVO) throws Exception;
	public ComVO updateCompanyForm(String authNum)throws Exception;
	public int updateCom(ComVO comVO)throws Exception;
	public int deleteCom(String authNum)throws Exception;
	
	
	
	
}
