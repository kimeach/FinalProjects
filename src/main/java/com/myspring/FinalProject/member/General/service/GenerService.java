package com.myspring.FinalProject.member.General.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.FinalProject.member.General.vo.GenerVO;


public interface GenerService {

    public List<GenerVO>generListMember() throws Exception;
	public int insertGener(GenerVO generVO)throws Exception;
	public GenerVO login(GenerVO generVO) throws Exception;
	public GenerVO updateMemberForm(String id)throws Exception;
	public int updateGener(GenerVO generVO)throws Exception;
	public int deleteGener(String id)throws Exception;
	
	
	
}
