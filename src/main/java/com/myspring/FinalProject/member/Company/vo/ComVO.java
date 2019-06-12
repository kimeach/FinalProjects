package com.myspring.FinalProject.member.Company.vo;



import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("comVO")
public class ComVO {

	private String imageFile;
	private String zipCode;
	private String address;
	private String name;
	private String phone1;
	private String phone2;
	private String phone3;
	
	private String email;
	private String email2;
	
	private String mainDeal;
	private String authNum;
	private Date joinDate;
	public ComVO() {}
	public ComVO(String imageFile, String zipCode, String address, String name, String phone1, String phone2,
			String phone3, String email, String email2, String mainDeal, String authNum, Date joinDate) {
		this.imageFile = imageFile;
		this.zipCode = zipCode;
		this.address = address;
		this.name = name;
		this.phone1 = phone1;
		this.phone2 = phone2;
		this.phone3 = phone3;
		this.email = email;
		this.email2 = email2;
		this.mainDeal = mainDeal;
		this.authNum = authNum;
		this.joinDate = joinDate;
	}
	public String getImageFile() {
		return imageFile;
	}
	public void setImageFile(String imageFile) {
		this.imageFile = imageFile;
	}
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
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
	public String getMainDeal() {
		return mainDeal;
	}
	public void setMainDeal(String mainDeal) {
		this.mainDeal = mainDeal;
	}
	public String getAuthNum() {
		return authNum;
	}
	public void setAuthNum(String authNum) {
		this.authNum = authNum;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	@Override
	public String toString() {
		return "ComVO [imageFile=" + imageFile + ", zipCode=" + zipCode + ", address=" + address + ", name=" + name
				+ ", phone1=" + phone1 + ", phone2=" + phone2 + ", phone3=" + phone3 + ", email=" + email + ", email2="
				+ email2 + ", mainDeal=" + mainDeal + ", authNum=" + authNum + ", joinDate=" + joinDate + "]";
	}
	
	





}