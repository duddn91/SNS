package com.sns.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.sns.web.member.model.MemberVO;

/**
 *  controller로 보내기 전 로그인 검사를 하고 
 *  로그인 되어있는 경우 회원정보를 session에 담아주고 
 *  그렇지 않을 경우 로그인 페이지로 다시 보내준다. 
 * 	@author youngwoo Byun
 */
public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
    	
    	logger.debug("LoginInterceptor에 전처리기 실행");
        // session 객체를 가져옴
        HttpSession session = request.getSession();
        // login처리를 담당하는 사용자 정보를 담고 있는 객체를 가져옴
        MemberVO vo = (MemberVO) session.getAttribute("login");
        
        if ( vo == null ){
            // 로그인이 안되어 있는 상태임으로 로그인 폼으로 다시 돌려보냄(redirect)
            response.sendRedirect("/");
            return false; // 더이상 컨트롤러 요청으로 가지 않도록 false로 반환함
        }
        // preHandle의 return은 컨트롤러 요청 uri로 가도 되냐 안되냐를 허가하는 의미임
        // 따라서 true로하면 컨트롤러 uri로 가게 됨.
        return true;
    }
  

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {
        super.postHandle(request, response, handler, modelAndView);
    }     
	
}
