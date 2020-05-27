package com.sns.web.member.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;
import org.apache.ibatis.session.SqlSession;
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

import com.sns.web.member.dao.MemberDAO;
import com.sns.web.member.model.MemberVO;
import com.sns.web.member.service.MemberService;
import com.sns.web.post.service.PostService;
	
@Controller
@RequestMapping("/member")
public class MemberController {

	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private MemberService memberService;
	
	@Autowired
	public SqlSession sqlSession;
	
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
	
	// 이메일 중복검사
	@RequestMapping("/checkEmail")
	@ResponseBody
	public int checkEmail(@RequestBody @RequestParam(value = "m_email") String m_email) throws Exception {
		
		logger.debug("memberController에 checkEmail() 실행"); 
		
		int result = 0;
		result= memberService.checkEmail(m_email);
		
		return result;
	}
	
	// 로그인 처리하는 부분
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
    
    // 마이 페이지
 	@RequestMapping("/mypage")
 	public String myPage(HttpSession session, Model model) throws Exception { 		
 		
 		logger.debug("memberController에 myPage() 실행");
 		 			
 		return "member/mypage";
 	}
 	
 	// oje 추가
 	// 비밀번호 변경 페이지 요청
 	@RequestMapping("/findPW")
 	public String findPW(HttpSession session, Model model) {

 		logger.debug("memberController에 findPW() 실행");
 		
 		return "member/findPW";
 		
 	}
 	
//	임시 비밀번호 메일 전송
 	@RequestMapping("/findPWOK")
 		public String findPwOK(HttpServletRequest request, Model model) throws Exception {
 				
 		logger.debug("memberController에 findPWOK() 실행"); 				
 		
 		String m_id = request.getParameter("m_id");
 		String m_email = request.getParameter("m_email");
 		
 		// 임시 비밀번호 만들기 
 		String tempPW = UUID.randomUUID().toString().replace("-", "");	// -를 제거
 		tempPW = tempPW.substring(0, 10);	// tempPW를 앞에서부터 10자리 잘라줌 		
 		logger.debug("임시 비밀번호 확인 : " + tempPW);

 		Map<String, Object> map = new HashMap<String, Object>();
 		map.put("m_id", m_id);
 		map.put("m_email", m_email);
 		map.put("m_pw", tempPW);

 		// 임시 비밀번호로 비번 변경				
 		memberService.findPW(map);

 		//메일 전송
		// Host Mail Server 설정
		String charset = "utf-8";	
		String hostSMTP = "smtp.naver.com";		// SMTP 서버명
		String hostSMTPid = "ohjleun";			// 네이버 아이디
		String hostSMTPpw = "ohjieun0909**";	// 네이버 비밀번호
		
		// 보내는 사람
		String fromEmail = "ohjleun@naver.com";		// 보내는 사람 메일
		String fromName = "Instagram";				// 보내는 사람 이름
		
		String subject = "";	// 메일 제목
		String content = "";	// 메일 내용
		
		// 보낼 내용
		subject = "[INTAGRAM] 임시 비밀번호 발급 안내";
		content += "<div align='left'>";
		content += "<h3>";
		content += m_id + "님의 임시 비밀번호입니다.<br>로그인 후, 비밀번호를 변경하여 사용하세요.</h3>";
		content += "<p>임시 비밀번호 : ";
		content += tempPW + "</p></div>";
		
		// email 전송
			String mailRecipient = m_email;		// 받는 사람 이메일 주소		
			try {			
			// 객체 선언
			HtmlEmail mail = new HtmlEmail();
			mail.setDebug(true);
			mail.setCharset(charset);
			mail.setSSLOnConnect(true);	// SSL 사용 (TLS가 없는 경우에 SSL 사용)
			mail.setHostName(hostSMTP);
			mail.setSmtpPort(587);	// SMTP 포트 번호
			mail.setAuthentication(hostSMTPid, hostSMTPpw);
			mail.setStartTLSEnabled(true);	// TLS 사용
			mail.addTo(mailRecipient);
			mail.setFrom(fromEmail, fromName, charset);
			mail.setSubject(subject);
			mail.setHtmlMsg(content);
			mail.send();
		} catch (EmailException e) {e.printStackTrace();}		
				
 		return "member/findPW"; 
 	}
	
}




