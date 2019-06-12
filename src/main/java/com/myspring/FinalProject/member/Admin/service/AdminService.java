package com.myspring.FinalProject.member.Admin.service;

import java.util.List;

import com.myspring.FinalProject.member.Admin.vo.AdminVO;

public interface AdminService {
	public List<AdminVO>adminListMember() throws Exception;
	public int insertAdmin(AdminVO adminVO)throws Exception;
	public AdminVO login(AdminVO adminVO) throws Exception;
	public AdminVO updateAdminForm(String id)throws Exception;
	public int updateAdmin(AdminVO adminVO)throws Exception;
	public int deleteAdmin(String id)throws Exception;
	
	public int adminAuthNum(AdminVO adminVO)throws Exception;
	
	
}
