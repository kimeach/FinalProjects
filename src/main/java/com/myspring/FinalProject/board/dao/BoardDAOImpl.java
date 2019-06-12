package com.myspring.FinalProject.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.FinalProject.board.vo.ArticleVO;
import com.myspring.FinalProject.common.paging.Criteria;

@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List selectAllArticlesList() throws DataAccessException {
	  return sqlSession.selectList("mapper.board.selectAllArticlesList");
	}	 

	@Override
	public List<ArticleVO> selectAllArticlesList(Criteria criteria) {
		//Map<String, String> map = new HashMap<String, String>();
		//map.put("searchOption", searchOption);
		//map.put("keyword", keyword);
		return sqlSession.selectList("mapper.board.searchList", criteria);
	}

	@Override
	public int insertNewArticle(Map articleMap) throws DataAccessException {
		int articleNO = selectNewArticleNO();
		System.out.println("boardDAOImpl의 groupNO-------------------:"+articleNO);
		articleMap.put("articleNO", articleNO);
		return sqlSession.insert("mapper.board.insertNewArticle", articleMap);
	}
	
	private int selectNewArticleNO() {
		return sqlSession.selectOne("mapper.board.selectNewArticleNO");
	}

	@Override
	public ArticleVO selectArticle(int articleNO) throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectArticle", articleNO);
	}

	@Override
	public void deleteArticle(int articleNO) throws DataAccessException {
		sqlSession.delete("mapper.board.deleteArticle", articleNO);
	}

	@Override
	public void updateArticle(Map articleMap) throws DataAccessException {
		sqlSession.update("mapper.board.updateArticle", articleMap);
	}

	@Override
	public List listPaging(int page) throws DataAccessException {
		if(page<=0) {
			page=1;
		}
		page = (page-1)*10;
		System.out.println("page="+page);
		return sqlSession.selectList("mapper.board.listPaging",page);
	}

	@Override
	public List<ArticleVO> listCriteria(Criteria criteria) throws Exception {
		return sqlSession.selectList("mapper.board.listCriteria",criteria);
	}
	@Override
	public int CountArticles(Criteria criteria) throws Exception {
		return sqlSession.selectOne("mapper.board.countArticles",criteria);
	}

	@Override
	public int insertReply(Map articleMap) throws DataAccessException {			
		return sqlSession.insert("mapper.board.insertReply", articleMap);			
	}

}

/*
 * @Override public List selectAllArticlesList() throws DataAccessException {
 * return sqlSession.selectList("mapper.board.selectAllArticlesList"); }
 * 
 * @Override public int insertNewArticle(Map articleMap) throws
 * DataAccessException { int articleNO = selectNewArticleNO();
 * System.out.println("articleNO-------------------:"+articleNO);
 * articleMap.put("articleNO",articleNO);
 * sqlSession.insert("mapper.board.insertNewArticle", articleMap);//입력처리 return
 * articleNO;//글번호 리턴 }
 * 
 * private int selectNewArticleNO() { return
 * sqlSession.selectOne("mapper.board.selectNewArticleNO"); }
 * 
 * @Override public ArticleVO selectArticle(int articleNO) throws
 * DataAccessException { return
 * sqlSession.selectOne("mapper.board.selectArticle", articleNO); }
 * 
 * @Override public void updateArticle(Map articleMap) throws
 * DataAccessException { sqlSession.update("mapper.board.updateArticle",
 * articleMap ); }
 * 
 * @Override public void deleteArticle(int articleNO) throws DataAccessException
 * { sqlSession.delete("mapper.board.deleteArticle", articleNO); }
 * 
 * @Override public List selectImageFileList(int articleNO) throws
 * DataAccessException { // TODO Auto-generated method stub return null; }
 */
