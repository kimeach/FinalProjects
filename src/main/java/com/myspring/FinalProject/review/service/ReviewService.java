package com.myspring.FinalProject.review.service;

import java.util.List;
import java.util.Map;

import com.myspring.FinalProject.review.vo.ReviewVO;





public interface ReviewService {
	public List listReivew() throws Exception;
	public int addNewReview(Map reviewMap) throws Exception;
	public ReviewVO viewReview(int reviewNO) throws Exception;
	public void modReview(Map<String, Object> reviewMap) throws Exception;
	public void removeReview(int reviewNO) throws Exception;
}
