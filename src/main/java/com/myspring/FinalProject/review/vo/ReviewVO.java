package com.myspring.FinalProject.review.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("reviewVO")
public class ReviewVO {
	private String imageFileName; // 부동산 사진
	private int reviewNO; // 후기 글번호
	private String name; // 부동산 이름
	private String zipcode;
	private String address; // 주소
	private int point; // 평점
	private String love; // 장점
	private String dislove; // 단점
	private Date writeDate; // 작성 날짜
	private String id; // 작성자 id
	
	public ReviewVO() {}

	
	public String getImageFileName() {return imageFileName;}
	public void setImageFileName(String imageFileName) {this.imageFileName = imageFileName;}

	public int getReviewNO() {return reviewNO;}
	public void setReviewNO(int reviewNO) {this.reviewNO = reviewNO;}

	public String getName() {return name;}
	public void setName(String name) {this.name = name;}
	
	public String getZipcode() {return zipcode;}
	public void setZipcode(String zipcode) {this.zipcode = zipcode;}

	public String getAddress() {return address;}
	public void setAddress(String address) {this.address = address;}

	public int getPoint() {return point;}
	public void setPoint(int point) {this.point = point;}

	public String getLove() {return love;}
	public void setLove(String love) {this.love = love;}

	public String getDislove() {return dislove;}
	public void setDislove(String dislove) {this.dislove = dislove;}

	public Date getWriteDate() {return writeDate;}
	public void setWriteDate(Date writeDate) {this.writeDate = writeDate;}

	public String getId() {return id;}
	public void setId(String id) {this.id = id;}
	
}
