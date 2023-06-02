package com.forme.biz.view.frontcontroller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.forme.biz.member.MemberVO;
import com.forme.biz.myme.MyMeService;
import com.forme.biz.myme.MyMeVO;

@Controller
public class MyMeController {

	private MyMeService mymeService;

	public MyMeController() {
		// TODO Auto-generated constructor stub
	}

	@Autowired
	public MyMeController(MyMeService mymeService) {
		this.mymeService = mymeService;
	}

	@RequestMapping("/MyList.do")
	public String MyMeList(String id, Model model, HttpSession session) {

		MemberVO mvo = (MemberVO) session.getAttribute("user");

		id = mvo.getId();

		List<MyMeVO> mymeList = mymeService.MyMeList(id);

		model.addAttribute("mymeList", mymeList);

		return "MyList";
	}

	@RequestMapping("/MyMe.do")
	public String Myme(String id, Model model, HttpSession session) {

		MemberVO mvo = (MemberVO) session.getAttribute("user");

		id = mvo.getId();

		List<MyMeVO> mymeList = mymeService.MyMe(id);

		model.addAttribute("mymeList", mymeList);

		return "MyMe";
	}

	@RequestMapping("/changeDeliDate.do")
	public String changeDeliDate(int myNum, String deliDate, HttpSession session) {

		MemberVO mvo = (MemberVO) session.getAttribute("user");

		MyMeVO mmvo = new MyMeVO();

		mmvo.setId(mvo.getId());
		mmvo.setMyNum(myNum);
		mmvo.setDeliDate(deliDate);

		mymeService.changeDeliDate(mmvo);

		System.out.println(myNum);
		System.out.println(deliDate);

		return "MyMe";

	}
	
	

}
