package com.myspring.FinalProject.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.FinalProject.board.vo.ArticleVO;
import com.myspring.FinalProject.common.paging.Criteria;



public interface BoardDAO {
	public List selectAllArticlesList() throws DataAccessException;
	
	public List<ArticleVO> selectAllArticlesList(Criteria criteria) throws DataAccessException;
	
	public int insertNewArticle(Map articleMap) throws DataAccessException;
	
	public ArticleVO selectArticle(int articleNO) throws DataAccessException;

	//	public List selectImageFileList(int articleNO) throws DataAccessException;

	public void deleteArticle(int articleNO) throws DataAccessException;

	public void updateArticle(Map articleMap) throws DataAccessException;

	public List listPaging(int page) throws DataAccessException;
	int CountArticles(Criteria criteria) throws Exception;	
	public List<ArticleVO> listCriteria(Criteria criteria) throws Exception;
	
	public int insertReply(Map articleMap) throws DataAccessException;
	

}
