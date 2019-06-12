package com.myspring.FinalProject.board.vo;

import java.util.List;

import org.springframework.stereotype.Component;

@Component("pageVO")
public class PageVO {
	
	private int total;
	private int currentPage;
	private List<ArticleVO> listArticles;
	private int totalPages;
	private int startPage;
	private int endPage;
	private int size=10;
	
	
	private PageVO() {	}	

	public PageVO(int total, int currentPage, List<ArticleVO> listArticles, 
						int totalPages, int startPage, int endPage,	int size) {
		this.total = total;
		this.currentPage = currentPage;
		this.listArticles = listArticles;
		this.totalPages = totalPages;
		this.startPage = startPage;
		this.endPage = endPage;
		this.size = size;		
		
		if(total == 0) {
			totalPages = 0;
			startPage = 0;
			endPage = 0;			
		}else {
			totalPages = total/size;
			if(total%size > 0) {
				totalPages++;
			}
		int modVal = currentPage % 10;
		startPage = currentPage /10 *10 +1;
		if(modVal == 0) startPage -= 10;
		
		endPage = startPage + 9;
		if(endPage > totalPages) endPage = totalPages;
		}		
	}

	public int getTotal() {
		return total;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public List<ArticleVO> getListArticles() {
		return listArticles;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public int getSize() {
		return size;
	}

}
