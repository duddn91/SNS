package com.sns.web.member.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sns.web.member.model.MemberVO;
import com.sns.web.member.service.MemberService;
	
@Controller
@RequestMapping("/member")
public class MemberController {

	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private MemberService memberService;
	
	// 회원가입 폼
	@RequestMapping("/signUp")
	public String signUpjsp(Model model) throws Exception {
		
		logger.debug("회원가입 창");
		
		model.addAttribute("memberVO", new MemberVO());
	    
		return "member/signUp";
	}
	
	// 회원정보 db에 insert
	@RequestMapping("/signOK")
	public String insertMember(HttpSession session,MemberVO memberVO) throws Exception {
		
		logger.debug("memberController에 insertMember() 실행");
		memberService.insertMember(memberVO);
		
		return "redirect:/login";
	}
	
	// 아이디 중복검사
	@RequestMapping("/checkId")
	@ResponseBody
	public int checkId(@RequestBody @RequestParam(value = "m_id") String m_id) throws Exception {
		
		logger.debug("memberController에 checkId() 실행"); 
		
		int result = 0;
		result= memberService.checkId(m_id);

		return result;
	}
	
	// 로그인 처리하는 부분
    @RequestMapping(value="/login", method=RequestMethod.POST)
    public String loginCheck(HttpSession session, MemberVO memberVO) throws Exception{
        String returnURL = "";
        logger.debug("loginCheck() 실행");
        if ( session.getAttribute("login") != null ){
            // 기존에 login이란 세션 값이 존재한다면
            session.removeAttribute("login"); // 기존값을 제거해 준다.
        }
          
        MemberVO vo = memberService.loginCheck(memberVO);
          
        if ( vo != null ){ // 로그인 성공
        	logger.debug("회원정보 get함");
            session.setAttribute("login", vo);
            returnURL = "redirect:/post/postview";
        }else { // 로그인에 실패한 경우
            returnURL = "redirect:/login";
        }
          
        return returnURL;
    }
    
    @RequestMapping("/findpw")
    public String findpwPage(Model model) throws Exception {
    	
    	logger.debug("memberController에 findpwPage() 실행");
    	
    	return "member/findpw";
    }
    
    
    // 마이 페이지
 	@RequestMapping("/mypage")
 	public String myPage(HttpSession session) throws Exception {
 		
 		logger.debug("memberController에 myPage() 실행");
 		
 		return "member/mypage";
 	}
}
