package com.sns.web.member.controller;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sns.web.member.service.MemberService;
/**
 * 임시로 지정한 첫화면과 로그인 페이지로 보내준다.
 * @author youngwoo Byun
 */
@Controller
public class HomeController {
	
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private MemberService memberService;
	
	/**
	 *  첫화면을 띄워주는 부분
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		logger.debug("첫 화면");
		
		return "index";
	}
	
	/**
	 *  로그인 화면으로 보내준다.
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(HttpSession session, Model model) {
	
		logger.debug("로그인 화면");
		logger.debug("세션" + session.getAttribute("login"));
		
		return "login";
	}
	
	
}
