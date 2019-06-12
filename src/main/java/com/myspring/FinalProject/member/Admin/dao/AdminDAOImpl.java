package com.myspring.FinalProject.member.Admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.FinalProject.member.Admin.vo.AdminVO;


@Repository("adminDAO")
public class AdminDAOImpl implements AdminDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<AdminVO> adminListMember() throws Exception {
		List<AdminVO> adminList=null;
		adminList=sqlSession.selectList("mapper.admin.adminList");
		return adminList;
	}

	@Override
	public int insertAdmin(AdminVO adminVO) throws Exception {
		return sqlSession.insert("mapper.admin.insertAdmin", adminVO);
	}

	@Override
	public AdminVO loginById(AdminVO adminVO) throws DataAccessException {
		return sqlSession.selectOne("mapper.admin.loginById", adminVO);
	}

	@Override
	public AdminVO updateAdminForm(String id) throws Exception {
		return sqlSession.selectOne("mapper.admin.updateAdminForm", id);
	}

	@Override
	public int updateAdmin(AdminVO adminVO) throws Exception {
		return sqlSession.update("mapper.admin.updateAdmin",adminVO);
	}

	@Override
	public int deleteAdmin(String id) throws Exception {
		return sqlSession.delete("mapper.admin.deleteAdmin",id);
	}

	@Override
	public int adminAuthNum(AdminVO adminVO) throws Exception {
		return sqlSession.insert("mapper.admin.adminAuthNum", adminVO);
	}

}
