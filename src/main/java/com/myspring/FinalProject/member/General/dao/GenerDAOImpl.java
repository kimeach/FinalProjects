package com.myspring.FinalProject.member.General.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.FinalProject.member.General.vo.GenerVO;

@Repository("generDAO")
public class GenerDAOImpl implements GenerDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List generListMember() throws Exception {
		List<GenerVO> generList=null;
		generList=sqlSession.selectList("mapper.gener.generList");
		return generList;
	}

	@Override
	public int insertGener(GenerVO generVO) throws Exception {
		
		return sqlSession.insert("mapper.gener.insertGener", generVO);
	}
	

	@Override
	public GenerVO updateMemberForm(String id) throws Exception {
		
		return sqlSession.selectOne("mapper.gener.updateMemberForm", id);
	}


	@Override
	public int updateGener(GenerVO generVO) throws Exception {
		
		return sqlSession.update("mapper.gener.updateGener",generVO);
	}

	@Override
	public int deleteGener(String id) throws Exception {
		
		return sqlSession.delete("mapper.gener.deleteGener",id);
	}

	@Override
	public GenerVO loginById(GenerVO generVO) throws DataAccessException {
		return sqlSession.selectOne("mapper.gener.loginById", generVO);
	}


}
