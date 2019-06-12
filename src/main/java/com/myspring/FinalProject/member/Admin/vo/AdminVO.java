package com.myspring.FinalProject.member.Admin.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("adminVO")
public class AdminVO {
private String id;
private String name;
private String pwd;
private String pwd_confirm;
Date joinDate;
private String adminAuth;


public AdminVO() {}


public AdminVO(String id, String name, String pwd, String pwd_confirm, Date joinDate, String adminAuth) {
	this.id = id;
	this.name = name;
	this.pwd = pwd;
	this.pwd_confirm = pwd_confirm;
	this.joinDate = joinDate;
	this.adminAuth = adminAuth;
}


public String getId() {
	return id;
}


public void setId(String id) {
	this.id = id;
}


public String getName() {
	return name;
}


public void setName(String name) {
	this.name = name;
}


public String getPwd() {
	return pwd;
}


public void setPwd(String pwd) {
	this.pwd = pwd;
}


public String getPwd_confirm() {
	return pwd_confirm;
}


public void setPwd_confirm(String pwd_confirm) {
	this.pwd_confirm = pwd_confirm;
}


public Date getJoinDate() {
	return joinDate;
}


public void setJoinDate(Date joinDate) {
	this.joinDate = joinDate;
}


public String getAdminAuth() {
	return adminAuth;
}


public void setAdminAuth(String adminAuth) {
	this.adminAuth = adminAuth;
}


@Override
public String toString() {
	return "AdminVO [id=" + id + ", name=" + name + ", pwd=" + pwd + ", pwd_confirm=" + pwd_confirm + ", joinDate="
			+ joinDate + ", adminAuth=" + adminAuth + "]";
}




}
