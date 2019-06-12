package com.myspring.FinalProject.review.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.FinalProject.review.vo.ReviewVO;





public interface ReviewDAO {

	public List selectAllReviewList() throws DataAccessException;
	public int insertNewReview(Map reviewMap) throws DataAccessException;
	public ReviewVO selectReview(int reviewNO) throws DataAccessException;
	public void updateReview(Map reviewMap) throws DataAccessException;
	public void deleteReview(int reviewNO) throws DataAccessException;
}
