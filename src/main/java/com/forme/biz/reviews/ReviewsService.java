package com.forme.biz.reviews;

import java.util.List;

public interface ReviewsService {
	//CRUD 기능 구현 메소드 정의
	List<ReviewsVO> getReviewsList(); //리뷰 리스트
	List<ReviewsVO> getMyReviewList(String id); //내 리뷰 리스트
	void delRev(int reviewNum); // 리뷰 삭제
}
