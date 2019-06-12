package com.myspring.FinalProject.member.General.vo;



import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("generVO")
public class GenerVO {
private String id;
private String name;
private String pwd;
private String pwd_confirm;
private String email;
private String email2;
private Date joinDate;


public GenerVO() {}


public GenerVO(String id, String name, String pwd, String pwd_confirm, String email, String email2, Date joinDate) {
	this.id = id;
	this.name = name;
	this.pwd = pwd;
	this.pwd_confirm = pwd_confirm;
	this.email = email;
	this.email2 = email2;
	this.joinDate = joinDate;
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


public String getEmail() {
	return email;
}


public void setEmail(String email) {
	this.email = email;
}


public String getEmail2() {
	return email2;
}


public void setEmail2(String email2) {
	this.email2 = email2;
}


public Date getJoinDate() {
	return joinDate;
}


public void setJoinDate(Date joinDate) {
	this.joinDate = joinDate;
}


@Override
public String toString() {
	return "GenerVO [email=" + email + ", email2=" + email2 + "]";
}






}
