package com.myspring.FinalProject.review.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.FinalProject.review.vo.ReviewVO;





@Repository("reviewDAO")
public class ReviewDAOImpl implements ReviewDAO{
	@Autowired
	private SqlSession sqlSession;

	/** 후기 리스트 DB **/
	@Override
	public List selectAllReviewList() throws DataAccessException {
		return sqlSession.selectList("mapper.review.selectAllReviewList");
	}
	
	/** 후기 삽입 DB **/
	@Override
	public int insertNewReview(Map reviewMap) throws DataAccessException {
		int reviewNO=selectNewReviewNO();
		reviewMap.put("reviewNO", reviewNO);
		System.out.println(reviewMap.get("imageFileName"));
		System.out.println(reviewMap.get("reviewNO"));
		System.out.println(reviewMap.get("name"));
		System.out.println(reviewMap.get("zipcode"));
		System.out.println(reviewMap.get("address"));
		System.out.println(reviewMap.get("point"));
		System.out.println(reviewMap.get("love"));
		System.out.println(reviewMap.get("dislove"));
		System.out.println(reviewMap.get("id"));
		sqlSession.insert("mapper.review.insertReview", reviewMap);
		return reviewNO;
	}
	private int selectNewReviewNO() {
		return sqlSession.selectOne("mapper.review.selectNewReviewNO");
	}
	
	/** 후기 수정 DB **/
	@Override
	public ReviewVO selectReview(int reviewNO) throws DataAccessException {
		return sqlSession.selectOne("mapper.review.selectReview", reviewNO);
	}
	@Override
	public void updateReview(Map reviewMap) throws DataAccessException {
		System.out.println(reviewMap.get("imageFileName"));
		System.out.println(reviewMap.get("reviewNO"));
		System.out.println(reviewMap.get("name"));
		System.out.println(reviewMap.get("point"));
		System.out.println(reviewMap.get("love"));
		System.out.println(reviewMap.get("dislove"));
		System.out.println(reviewMap.get("id"));
		sqlSession.update("mapper.review.updateReview", reviewMap);
	}
	
	/** 후기 삭제 DB **/
	@Override
	public void deleteReview(int reviewNO) throws DataAccessException {
		sqlSession.delete("mapper.review.deleteReview", reviewNO);
	}
	
	
}
