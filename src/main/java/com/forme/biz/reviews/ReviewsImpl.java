package com.forme.biz.reviews;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forme.biz.notice.NoticeVO;

@Service("reviewsService")
public class ReviewsImpl implements ReviewsService{
	
	@Autowired
	private ReviewsDAO reviewsDAO;
	
	public ReviewsImpl() {
		System.out.println(">> NoticeDAOImpl() 객체 생성");
	}

	// 리뷰 조회(모든 게시글)
	@Override
	public List<ReviewsVO> getReviewsList() {
		System.out.println("===> MyBatis 사용 getNoticeList() 실행");
		return reviewsDAO.getReviewsList();
	}
	
	// 내 리뷰 조회
	@Override
	public List<ReviewsVO> getMyReviewList(String id) {
		System.out.println("===> MyBatis 사용 getMyReviewList() 실행");
		return reviewsDAO.getMyReviewList(id);
	}
	
	// 리뷰 삭제
	@Override
	public void delRev(int reviewNum) {
		System.out.println("===> MyBatis 사용 getMyReviewList() 실행");
		reviewsDAO.delRev(reviewNum);
	}
	
}

