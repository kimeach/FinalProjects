package com.myspring.FinalProject.review.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.FinalProject.review.dao.ReviewDAO;
import com.myspring.FinalProject.review.vo.ReviewVO;





@Service("reviewService")
@Transactional(propagation=Propagation.REQUIRED)
public class ReviewServiceImpl implements ReviewService{
	@Autowired
	ReviewDAO reviewDAO;

	/** 후기 리스트 **/
	@Override
	public List listReivew() throws Exception {
		return reviewDAO.selectAllReviewList();
	}
	/** 후기 추가 **/
	@Override
	public int addNewReview(Map reviewMap) throws Exception {
		return reviewDAO.insertNewReview(reviewMap);
	}
	/** 후기 수정 **/
	@Override
	public ReviewVO viewReview(int reviewNO) throws Exception {
		return reviewDAO.selectReview(reviewNO);
	}
	@Override
	public void modReview(Map<String, Object> reviewMap) throws Exception {
		reviewDAO.updateReview(reviewMap);
	}
	/** 후기 삭제 **/
	@Override
	public void removeReview(int reviewNO) throws Exception {
		reviewDAO.deleteReview(reviewNO);
	}
}
