package com.myspring.FinalProject.board.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("articleVO")
public class ArticleVO {
	private int  levelNO;
	private int articleNO;
	private int groupNO;
	private int parentNO;
	private String sido;
	private String gugun;
	private String title;
	private String content;
	private String imageFileName;
	private String id;
	private String name;
	private String authNum;	
	private Date  writeDate;
		
	//private String name;

	public ArticleVO() {
		//System.out.println("ArticleVO");
	}

	 public int getLevelNO() {
			return levelNO;
		}
	 
	public void setLevelNO(int levelNO) {
			this.levelNO = levelNO;
		}
		
	public int getArticleNO() {
		return articleNO;
	}

	public void setArticleNO(int articleNO) {
		this.articleNO = articleNO;
	}	
	
	public int getGroupNO() {
		return groupNO;
	}

	public void setGroupNO(int groupNO) {
		this.groupNO = groupNO;
	}

	public int getParentNO() {
		return parentNO;
	}

	public void setParentNO(int parentNO) {
		this.parentNO = parentNO;
	}	

	public String getSido() {
		return sido;
	}

	public void setSido(String sido) {
		this.sido = sido;
	}

	public String getGugun() {
		return gugun;
	}

	public void setGugun(String gugun) {
		this.gugun = gugun;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
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

	public String getAuthNum() {
		return authNum;
	}

	public void setAuthNum(String authNum) {
		this.authNum = authNum;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	@Override
	public String toString() {
		return "ArticleVO [levelNO=" + levelNO + ", articleNO=" + articleNO + ", groupNO=" + groupNO + ", parentNO="
				+ parentNO + ", sido=" + sido + ", gugun=" + gugun + ", title=" + title + ", content=" + content
				+ ", imageFileName=" + imageFileName + ", id=" + id + ", name=" + name + ", authNum=" + authNum
				+ ", writeDate=" + writeDate + "]";
	}
	
	

}
