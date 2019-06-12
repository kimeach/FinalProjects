package com.myspring.FinalProject.member.General.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.FinalProject.member.General.vo.GenerVO;



public interface GenerDAO {

	public List<GenerVO> generListMember() throws Exception;
	public int insertGener(GenerVO generVO)throws Exception;
	 public GenerVO loginById(GenerVO generVO) throws DataAccessException;
	public GenerVO updateMemberForm(String id)throws Exception;
	
	public int updateGener(GenerVO generVO)throws Exception;
	public int deleteGener(String id)throws Exception;
	
	
}
