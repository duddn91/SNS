
package com.sns.web.interceptor;
 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger; 
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service; 
import org.springframework.web.servlet.ModelAndView; 
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
  
/**
 * @author youngwoo Byun
 */
@Service 
public class LoggerInterceptor extends HandlerInterceptorAdapter{
  
	private Logger logger = LoggerFactory.getLogger(LoggerInterceptor.class);

	/**
	 *  controller로 가기전에 전 처리로 로그를 찍어주는 부분
	 *  리턴값이 true가 아닐 경우 해당 컨트롤러로 이어주지 않는다.
	 *  @return true
	 */	
	@Override 
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception { 
		if(logger.isDebugEnabled()) { 
			logger.debug("====================================== START ======================================"); 
			logger.debug(" Request URI \t: " + request.getRequestURI()); 
		} 
		return super.preHandle(request, response, handler); 
	} 
	
	/**
	 *  모든 작업을 처리 후, 후 처리로 로그를 찍어주는 부분
	 */	
	@Override 
	public void postHandle(HttpServletRequest request,HttpServletResponse response, Object handler, 
			ModelAndView modelAndView) throws Exception {
		if (logger.isDebugEnabled()) { 
			logger.debug("====================================== END ======================================\n"); 
		} 
	}
 
 }