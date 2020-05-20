package com.sns.web.post.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sns.web.member.model.MemberVO;
import com.sns.web.post.model.PostVO;
import com.sns.web.post.model.ReplyVO;
import com.sns.web.post.service.PostService;

@Controller
@RequestMapping("/post")
public class PostController {

	private final Logger logger = LoggerFactory.getLogger(PostController.class);
	
	//servlet-context.xml에 bean 설정	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@Autowired
	private PostService postService;

	// 게시판 화면
	@RequestMapping("/postview")
	public String postview(HttpServletRequest request, Model model) throws Exception {
		
		logger.debug("PostController에 postview()실행 ");

		int startNo = postService.getMaxPostNo()+1;
		
		List<PostVO> postList = postService.selectList(startNo);
		model.addAttribute("postList", postList);

		HttpSession session = request.getSession();
		if(session.getAttribute("memberVO") == null) {
			MemberVO vo = (MemberVO) session.getAttribute("memberVO");
			model.addAttribute("member", vo);
			
			return "post/postview";
		}else {
			
			return "/post/postview";
		}



	}

//	포스팅 페이지(posting.jsp)를 불러오는 메소드	// get/post 설정
	@RequestMapping("/posting")
	public String posting(HttpServletRequest request, Model model) throws Exception{
		logger.debug("PostController에 posting()실행 ");
		model.addAttribute("postVO", new PostVO());
	
		return "post/posting";
	}

//	게시글 업로드 메소드	
	@RequestMapping(value="/postingOK", method = RequestMethod.POST)
	public String postingOK(MultipartFile file, Model model, PostVO vo,
			HttpServletRequest request) throws Exception {
		logger.debug("PostController에 postingOK()실행 ");
		
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		Date date = new Date();
		String time = format.format(date);
		// 파일명 일괄 처리 ex) jieun_20200514172822.jpg
		String savedFileName =  vo.getP_id() + "_" + time + ".jpg";	
		logger.debug("savedFileName :" + savedFileName);
		
		vo.setP_photo(savedFileName);							// DB 이미지 이름 저장
		
		File target = new File(uploadPath, savedFileName);
		FileCopyUtils.copy(file.getBytes(), target);			// uploadPath 사진 저장
		vo.setP_filter(Integer.parseInt(request.getParameter("p_filter")));		// p_filter에 담긴 value 값을 P_filter에 담아줌.
		System.out.println(vo);
		postService.insert(vo);		// vo로 받은 데이터 DB 저장
		model.addAttribute("savedFileName", savedFileName);
				
		return "redirect:/post/postview";	// list 페이지
	}
	
	@RequestMapping("/replyInsert")
	public String replyInsert(HttpServletRequest request, Model model, ReplyVO replyVO) 
			throws Exception{
		
		logger.debug("PostController에 replyInsert()실행 ");
		
		int r_pno = Integer.parseInt(request.getParameter("r_pno"));
		String r_id = request.getParameter("r_id");
		String r_content = request.getParameter("r_content");
		postService.replycntUp(r_pno);
		
		replyVO.setR_pno(r_pno);
		replyVO.setR_id(r_id);
		replyVO.setR_content(r_content);
		postService.replyInsert(replyVO);
		
		return "redirect:/post/postview";
	}
	
	@RequestMapping(value="/getReply", method=RequestMethod.POST)
	@ResponseBody
	public void getReply(HttpServletRequest request, HttpServletResponse response) throws Exception{
	
		logger.debug("PostController에 getReply()실행 ");
		
		response.setContentType("text/html; charset=UTF-8");
		int r_pno = Integer.parseInt(request.getParameter("r_pno"));

		List<ReplyVO> replyList = postService.selectReply(r_pno);
		StringBuffer result = new StringBuffer();
		result.append("{\"result\":[");
		
		for (int i = 0; i < replyList.size(); i++) {
			result.append("[{\"value\":\"" + replyList.get(i).getR_id() + "\"},");
			result.append("{\"value\":\"" + replyList.get(i).getR_regDate() + "\"},");
			result.append("{\"value\":\"" + replyList.get(i).getR_content() + "\"}],");
		}
		result.append("]}");
		try {
			response.getWriter().write(result.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/getpost", method=RequestMethod.GET, produces = "application/json;")
	public @ResponseBody List<PostVO> getpost(HttpServletRequest request, Model model) throws Exception{
		
		logger.debug("PostController에 getpost()실행 ");
		
		int startNo = Integer.parseInt(request.getParameter("no"));
		List<PostVO> postList = postService.selectList(startNo);
		return postList;
	}
	

}
