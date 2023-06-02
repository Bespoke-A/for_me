package com.forme.biz.view.frontcontroller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.forme.biz.notice.NoticeService;
import com.forme.biz.notice.NoticeVO;
import com.forme.biz.reviews.ReviewsService;
import com.forme.biz.reviews.ReviewsVO;

@SessionAttributes("notice") // board 라는 이름의 Model 객체가 있으면 session 에 저장
@Controller
public class NoticeController {

	@Autowired
	NoticeService noticeService;
	
	@Autowired
	ReviewsService reviewsService;
	
	//공지 리스트
	@RequestMapping("/notice.do")
	public String notice( Model model, NoticeVO vo) {
		System.out.println("🌐 notice.jsp 접속");
		List<NoticeVO> list = null;
		if(vo.getNoticeTitle() != null) {
			String searchKeyword = vo.getNoticeTitle();
			list = noticeService.searchNoticeList(searchKeyword);
			model.addAttribute("noticeList", list);
		}else {
			list = noticeService.getNoticeList();
			model.addAttribute("noticeList", list);
		}
		return "notice";
	}
	//공지 상세
	@RequestMapping("/noticeCon.do")
	public String noticeCon(NoticeVO vo, Model model) {
		System.out.println("🌐 noticeCon.jsp 접속 " + vo + "-");
		vo = noticeService.getNoticeOne(vo.getNoticeNum());
		model.addAttribute("noticeOne", vo);
		return "noticeCon";
	}
	//공지 쓰기
	@RequestMapping("/noticeWrite.do")
	public String noticeWrite(NoticeVO vo, Model model) {
		System.out.println("🌐 noticeWrite.jsp 접속 " + vo + "-");
		vo = noticeService.getNoticeOne(vo.getNoticeNum());
		model.addAttribute("noticeOne", vo);
		return "noticeWrite";
	}
	
	//공지쓰기
	@RequestMapping("/noticeWtireOK.do")
	public String noticeWtireOK(NoticeVO vo) {
		System.out.println("🌐 noticeWtireOK.jsp 접속");
		noticeService.insertNotice(vo);
		vo.setNoticeTitle(null);
		return "redirect:/notice.do";
	}
	
	//공지수정
	@RequestMapping("/updateOK.do")
	public String updateOK(NoticeVO vo) {
		System.out.println("🌐 updateOK.jsp 접속");
		noticeService.updateNotice(vo);
		return "forward:/noticeCon.do";
	}
	
	//공지삭제
	@RequestMapping("/deleteOK.do")
	public String deleteOK(NoticeVO vo) {
		System.out.println("🌐 deleteOK.jsp 접속");
		noticeService.deleteNotice(vo);
		return "redirect:/notice.do";
	}
	
	//리뷰페이지 이동
	@RequestMapping("/review.do")
	public String review( Model model) {
		System.out.println("🌐 review.jsp 접속");
		List<ReviewsVO> list = null;
		list = reviewsService.getReviewsList();
		model.addAttribute("reviewsList", list);
		return "review";
	}
	
	//내 리뷰만 보기
	@RequestMapping("/reviewMe.do")
	public String reviewMe(Model model, ReviewsVO vo) {
		System.out.println("🌐 reviewMe.jsp 접속");
		
		List<ReviewsVO> list = null;
		list = reviewsService.getMyReviewList(vo.getId());
		model.addAttribute("reviewsList", list);
		return "review";
	}
	
	//리뷰 삭제
	@RequestMapping("/delRev.do")
	public String delRev(ReviewsVO vo) {
		System.out.println("🌐 delRev.jsp 접속");
		System.out.println(vo);
		reviewsService.delRev(vo.getReviewNum());
		return "redirect:/review.do";
	}
	
	//리뷰 쓰기
	@RequestMapping("/writeReview.do")
	public String writeReview(ReviewsVO vo) {
		System.out.println("🌐 writeReview.jsp 접속");
		return "writeReview";
	}
	
	
}
