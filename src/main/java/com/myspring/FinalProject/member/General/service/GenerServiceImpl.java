package com.myspring.FinalProject.member.General.service;

import java.util.List;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import com.myspring.FinalProject.member.General.controller.GenerController;
import com.myspring.FinalProject.member.General.dao.GenerDAO;
import com.myspring.FinalProject.member.General.vo.GenerVO;

@Service("generService")
public class GenerServiceImpl implements GenerService{

	@Autowired
	private GenerDAO generDAO;
	
	
	@Override
	public List generListMember() throws Exception {
		List<GenerVO>generList=null;
		generList=generDAO.generListMember();
		return generList;
	}



	@Override
	public int insertGener(GenerVO generVO) throws Exception {
		
		return generDAO.insertGener(generVO);
	}

	
	@Override
	public GenerVO updateMemberForm(String id) throws Exception {
		
		return generDAO.updateMemberForm(id);
	}


	@Override
	public int updateGener(GenerVO generVO) throws Exception {
		
		return generDAO.updateGener(generVO);
	}

	@Override
	public int deleteGener(String id) throws Exception {
		
		return generDAO.deleteGener(id);
	}



	@Override
	public GenerVO login(GenerVO generVO) throws Exception {
		return generDAO.loginById(generVO);
	}



}
