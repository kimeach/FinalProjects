package com.myspring.FinalProject.review.vo;

import java.sql.Date;

public class ImageFileVO {
	private int imageFileNO;
	private String imageFileName;
	private Date regDate;
	private int reviewNO;
	
	public int getImageFileNO() {return imageFileNO;}
	public void setImageFileNO(int imageFileNO) {this.imageFileNO = imageFileNO;}
	
	public String getImageFileName() {return imageFileName;}
	public void setImageFileName(String imageFileName) {this.imageFileName = imageFileName;}
	
	public Date getRegDate() {return regDate;}
	public void setRegDate(Date regDate) {this.regDate = regDate;}
	
	public int getReviewNO() {return reviewNO;}
	public void setReviewNO(int reviewNO) {this.reviewNO = reviewNO;}
	

}
