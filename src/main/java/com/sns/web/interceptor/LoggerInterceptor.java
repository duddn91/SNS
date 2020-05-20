
package com.sns.web.interceptor;
 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger; 
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service; 
import org.springframework.web.servlet.ModelAndView; 
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
  
@Service 
public class LoggerInterceptor extends HandlerInterceptorAdapter{
  
	private Logger logger = LoggerFactory.getLogger(LoggerInterceptor.class);
  	//전처리기
	@Override 
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception { 
		if(logger.isDebugEnabled()) { 
			logger.debug("====================================== START ======================================"); 
			logger.debug(" Request URI \t: " + request.getRequestURI()); 
		} 
		return super.preHandle(request, response, handler); 
	} 
	
	// 후처리기
	@Override 
	public void postHandle(HttpServletRequest request,HttpServletResponse response, Object handler, 
			ModelAndView modelAndView) throws Exception {
		if (logger.isDebugEnabled()) { 
			logger.debug("====================================== END ======================================\n"); 
		} 
	}
 
 }