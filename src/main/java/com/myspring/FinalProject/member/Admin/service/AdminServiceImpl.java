package com.myspring.FinalProject.member.Admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.FinalProject.member.Admin.dao.AdminDAO;
import com.myspring.FinalProject.member.Admin.vo.AdminVO;


@Service("adminService")
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDAO adminDAO;
	
	@Override
	public List<AdminVO> adminListMember() throws Exception {
		List<AdminVO>adminList=null;
		adminList=adminDAO.adminListMember();
		return adminList;
	}

	@Override
	public int insertAdmin(AdminVO adminVO) throws Exception {
		return adminDAO.insertAdmin(adminVO);
	}

	@Override
	public AdminVO login(AdminVO adminVO) throws Exception {
		return adminDAO.loginById(adminVO);
	}

	@Override
	public AdminVO updateAdminForm(String id) throws Exception {
		return adminDAO.updateAdminForm(id);
	}

	@Override
	public int updateAdmin(AdminVO adminVO) throws Exception {
		return adminDAO.updateAdmin(adminVO);
	}

	@Override
	public int deleteAdmin(String id) throws Exception {
		return adminDAO.deleteAdmin(id);
	}

	@Override
	public int adminAuthNum(AdminVO adminVO) throws Exception {
		return adminDAO.adminAuthNum(adminVO);
	}

}
