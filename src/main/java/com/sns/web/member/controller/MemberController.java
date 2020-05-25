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

/**
 * @author youngwoo Byun
 */

@Controller
@RequestMapping("/member")
public class MemberController {

	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private MemberService memberService;
	
	/**
	 *  회원가입 창으로 보내준다.
	 */
	@RequestMapping("/signUp")
	public String signUpjsp(Model model) throws Exception {
		
		logger.debug("회원가입 창");
		
		model.addAttribute("memberVO", new MemberVO());
	    
		return "member/signUp";
	}
	
	/**
	 *  Ajax로 넘어온 정보를 db로 보내서 id 정보를 가져와
	 *  결과를 보내 중복확인 시켜준다.
	 */
	@RequestMapping("/checkId")
	@ResponseBody
	public int checkId(@RequestBody @RequestParam(value = "m_id") String m_id) throws Exception {
		
		logger.debug("memberController에 checkId() 실행"); 
		
		int result = 0;
		result= memberService.checkId(m_id);
		
		return result;
	}
	
	/**
	 *  회원가입 정규식에 맞게 정보가 전달되면
	 *  db에 정보를 저장하고 로그인 화면으로 보내준다.
	 */
	@RequestMapping("/signOK")
	public String insertMember(HttpSession session,MemberVO memberVO) throws Exception {
		
		logger.debug("memberController에 insertMember() 실행");
		memberService.insertMember(memberVO);
		
		return "redirect:/login";
	}
	
	
	/**
	 *  로그인 화면에서 id와 pw 정보가 맞으면 로그인 시켜주고
	 *  회원 정보를 session에 저장해서 LoginInterceptor에서
	 *  session에 회원정보를 유지시켜주도록 하고 post페이지로 보내주고
	 *  정보가 맞지 않으면 다시 로그인 화면으로 보내준다.
	 */
    @RequestMapping(value="/login", method=RequestMethod.POST)
    public String loginCheck(HttpSession session,MemberVO memberVO) throws Exception{
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
   
    /**
	 * 마이페이지 아직 안함 
	 */
 	@RequestMapping("/mypage")
 	public String myPage(HttpSession session) throws Exception {
 		
 		logger.debug("memberController에 myPage() 실행");
 		
 		return "member/mypage";
 	}
}
