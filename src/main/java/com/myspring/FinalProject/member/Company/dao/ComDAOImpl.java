package com.myspring.FinalProject.member.Company.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.FinalProject.member.Company.vo.ComVO;
import com.myspring.FinalProject.member.General.vo.GenerVO;



@Repository("comDAO")
public class ComDAOImpl implements ComDAO{

	@Autowired
	private SqlSession sqlSession;
	

	@Override
	public List comListMember() throws Exception {
		List<ComVO> comList=null;
		comList=sqlSession.selectList("mapper.com.comList");
		return comList;
	}

	@Override
	public int insertCom(ComVO comVO) throws Exception {
		
		return sqlSession.insert("mapper.com.insertCom", comVO);
	}
	

	@Override
	public ComVO updateCompanyForm(String authNum) throws Exception {
		
		return sqlSession.selectOne("mapper.com.updateCompanyForm", authNum);
	}


	@Override
	public int updateCom(ComVO comVO) throws Exception {
		
		return sqlSession.update("mapper.com.updateCom",comVO);
	}

	@Override
	public int deleteCom(String authNum) throws Exception {
		
		return sqlSession.delete("mapper.com.deleteCom",authNum);
	}

	@Override
	public ComVO loginById(ComVO comVO) throws Exception {
		return sqlSession.selectOne("mapper.com.loginById", comVO);
	}



}
