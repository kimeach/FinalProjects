package com.myspring.FinalProject.member.Admin.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.FinalProject.member.Admin.vo.AdminVO;

public interface AdminDAO {
	public List<AdminVO> adminListMember() throws Exception;
	public int insertAdmin(AdminVO adminVO)throws Exception;
	 public AdminVO loginById(AdminVO adminVO) throws DataAccessException;
	public AdminVO updateAdminForm(String id)throws Exception;
	public int adminAuthNum(AdminVO adminVO)throws Exception;
	public int updateAdmin(AdminVO adminVO)throws Exception;
	public int deleteAdmin(String id)throws Exception;
}
