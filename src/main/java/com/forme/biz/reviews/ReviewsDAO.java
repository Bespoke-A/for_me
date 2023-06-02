package com.forme.biz.reviews;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewsDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public ReviewsDAO() {
		System.out.println(">> NoticeDAO() 객체 생성");
	}
	//리뷰 리스트
	public List<ReviewsVO> getReviewsList() {
		System.out.println("===> MyBatis 사용 getReviewsList() 실행");
		return mybatis.selectList("reviewsDAO.getReviewsList");
	}
	//내 리뷰 리스트
	public List<ReviewsVO> getMyReviewList(String id) {
		System.out.println("===> MyBatis 사용 getMyReviewList() 실행");
		return mybatis.selectList("reviewsDAO.getMyReviewList", id);
	}
	//리뷰 삭제
	public void delRev(int reviewNum) {
		System.out.println("===> MyBatis 사용 delRev() 실행");
		mybatis.delete("reviewsDAO.delRev", reviewNum);
	}
	
}
