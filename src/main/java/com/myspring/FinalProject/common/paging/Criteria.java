package com.myspring.FinalProject.common.paging;

public class Criteria {
	
	private String keyword;
	private int page; //각 페이지
	private int perPageNum; //페이지별 게시글 갯수
	
	
	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public Criteria() {
		this.page=1;
		this.perPageNum=10;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if(page<=0) {
			this.page=1;
			return;
		}
		this.page = page;
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		if(perPageNum<=0 || perPageNum>1000) {
			this.perPageNum=10;
			return;
		}
		this.perPageNum = perPageNum;
	}
	//시작 게시글 번호
	public int getPageStart() {
		return (this.page-1)*perPageNum+1;
	}
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
	
	
}
