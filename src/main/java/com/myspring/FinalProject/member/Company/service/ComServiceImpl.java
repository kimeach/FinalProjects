package com.myspring.FinalProject.member.Company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.myspring.FinalProject.member.Company.dao.ComDAO;
import com.myspring.FinalProject.member.Company.vo.ComVO;


@Service("comService")
public class ComServiceImpl implements ComService{

	@Autowired
	private ComDAO comDAO;
	
	
	@Override
	public List comListMember() throws Exception {
		List<ComVO>comList=null;
		comList=comDAO.comListMember();
		return comList;
	}



	@Override
	public int insertCom(ComVO comVO) throws Exception {
		
		return comDAO.insertCom(comVO);
	}

	
	@Override
	public ComVO updateCompanyForm(String authNum) throws Exception {
		
		return comDAO.updateCompanyForm(authNum);
	}


	@Override
	public int updateCom(ComVO comVO) throws Exception {
		
		return comDAO.updateCom(comVO);
	}

	@Override
	public int deleteCom(String authNum) throws Exception {
		
		return comDAO.deleteCom(authNum);
	}



	@Override
	public ComVO login(ComVO comVO) throws Exception {
		return comDAO.loginById(comVO);
	}



}
