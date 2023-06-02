package com.forme.biz.view.frontcontroller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FrontController {

	public FrontController() {
		System.out.println("📦 FrontController() 객체 생성");
	}
	
	@RequestMapping("/index.do")
	public String index() {
		System.out.println("🌐 index.jsp 접속");
		return "index";
	}
	@RequestMapping("/main.do") //index -> main.do로 전송
	public String main() {
		System.out.println("🌐 main.jsp 접속");
		return "main";
	}
	@RequestMapping("/about.do")
	public String about() {
		System.out.println("🌐 about.jsp 접속");
		return "about";
	}
	
	@RequestMapping("/contact.do")
	public String contact() {
		System.out.println("🌐 contact.jsp 접속");
		return "contact";
	}
	
	@RequestMapping("/service.do")
	public String service() {
		System.out.println("🌐 service.jsp 접속");
		return "service";
	}
	
	@RequestMapping("/project.do")
	public String project() {
		System.out.println("🌐 project.jsp 접속");
		return "project";
	}
	
	@RequestMapping("/testimonial.do")
	public String testimonial() {
		System.out.println("🌐 testimonial.jsp 접속");
		return "testimonial";
	}
	@RequestMapping("/feature.do")
	public String feature() {
		System.out.println("🌐 feature.jsp 접속");
		return "feature";
	}
	@RequestMapping("/quote.do")
	public String quote() {
		System.out.println("🌐 quote.jsp 접속");
		return "quote";
	}
	@RequestMapping("/team.do")
	public String team() {
		System.out.println("🌐 team.jsp 접속");
		return "team";
	}
	@RequestMapping("/404.do")
	public String fourZeroFour() {
		System.out.println("🌐 quote.jsp 접속");
		return "404";
	}
	
	
	
}
