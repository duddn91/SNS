package com.sns.web.post.controller;

import java.io.File;
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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sns.web.member.model.MemberVO;
import com.sns.web.post.model.Param;
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
	@RequestMapping(value= "/postview", method = RequestMethod.GET)
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
	@RequestMapping(value= "/posting", method = RequestMethod.GET)
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
		
		String savedFileName =  vo.getP_id() + "_" + time + ".jpg";	
		logger.debug("savedFileName :" + savedFileName);
		
		vo.setP_photo(savedFileName);							// DB 이미지 이름 저장
		File target = new File(uploadPath, savedFileName);
		
		FileCopyUtils.copy(file.getBytes(), target);			// uploadPath 사진 저장
		
		System.out.println(vo);
		postService.insert(vo);		// vo로 받은 데이터 DB 저장
		model.addAttribute("savedFileName", savedFileName);
		
		return "redirect:/post/postview";	// list 페이지
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
			result.append("{\"value\":\"" + replyList.get(i).getR_no() + "\"},");
			result.append("{\"value\":\"" + replyList.get(i).getR_ref() + "\"},");
			result.append("{\"value\":\"" + replyList.get(i).getR_lev() + "\"},");
			result.append("{\"value\":\"" + replyList.get(i).getR_seq() + "\"},");
			result.append("{\"value\":\"" + replyList.get(i).getR_delete() + "\"},");
			result.append("{\"value\":\"" + replyList.get(i).getR_content() + "\"}],");
		}
		result.append("]}");
		response.getWriter().write(result.toString());
		
	}
	
	@RequestMapping(value="/getpost", method=RequestMethod.GET)
	public @ResponseBody List<PostVO> getpost(HttpServletRequest request, Model model) throws Exception{
		
		logger.debug("PostController에 getpost()실행 ");
		
		int startNo = Integer.parseInt(request.getParameter("no"));
		List<PostVO> postList = postService.selectList(startNo);
		return postList;
	}
	
	@RequestMapping(value="/insertReply", method=RequestMethod.GET)
	@ResponseBody
	public int insertReply(HttpServletRequest request, Model model, ReplyVO replyVO) throws Exception{
		
		logger.debug("PostController에 replyInsert()실행 ");
		
		int r_pno = Integer.parseInt(request.getParameter("r_pno"));
		String r_id = request.getParameter("r_id");
		String r_content = request.getParameter("r_content");
		postService.replycntUp(r_pno);
		
		replyVO.setR_pno(r_pno);
		replyVO.setR_id(r_id);
		replyVO.setR_content(r_content);
		
		postService.insertReply(replyVO);
		
		return 1;
	}
	
	@RequestMapping(value="/insertRecomment", method=RequestMethod.GET)
	public @ResponseBody int insertRecomment(HttpServletRequest request, Model model, ReplyVO replyVO) throws Exception{
		
		
		int r_no = replyVO.getR_no();
		int r_pno = replyVO.getR_pno();
		String r_content = replyVO.getR_content();
		String r_id = replyVO.getR_id();
//		답글달 게시물 1건 가져오기
		replyVO = postService.getReply(r_no);
		replyVO.setR_content(r_content);
		replyVO.setR_id(r_id);
		replyVO.setR_lev(replyVO.getR_lev()+1);
		replyVO.setR_seq(replyVO.getR_seq()+1);
		System.out.println(replyVO);
//		seq 값 증가시켜 댓글자리 만들기
		postService.incrementSeq(replyVO);
//		댓글 입력
		postService.insertRecomment(replyVO);
//		댓글개수 1 증가
		try {
			postService.replycntUp(r_pno);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		댓글개수 가져오기
		int replycnt = postService.getReplycnt(r_pno);
		return replycnt;
	}
	
//	댓글 수정
	@RequestMapping(value="/updateRecomment", method=RequestMethod.GET)
	public @ResponseBody int updateRecomment(HttpServletRequest request, Model model, ReplyVO replyVO) throws Exception{
		System.out.println("replyUpdate 실행");
		postService.updateRecomment(replyVO);
		return 1;
	}
	
//	댓글 삭제
	@RequestMapping(value="/deleteRecomment", method=RequestMethod.GET)
	public @ResponseBody int deleteRecomment(HttpServletRequest request, Model model, ReplyVO replyVO) throws Exception{
		System.out.println(replyVO);
		
		int r_pno = replyVO.getR_pno();
//		메인포스트의 댓글 카운트 1 다운
//		postService.replycntDown(r_pno);
//		댓글 삭제
		postService.deleteRecomment(replyVO.getR_no());
//		댓글개수 return
		int replycnt = postService.getReplycnt(r_pno);
		return replycnt;
	}
	
// 	좋아요
	@RequestMapping(value="/like", method=RequestMethod.GET)
	public @ResponseBody int like(HttpServletRequest request, Model model) throws Exception{
		int p_no = Integer.parseInt(request.getParameter("p_no"));
		String mode = request.getParameter("mode");
		
		if(mode.equals("like")) {
			System.out.println("좋아요 +1 ");
			postService.likeUp(p_no);
		}else {
			System.out.println("좋아요 -1 ");
			postService.likeDown(p_no);
		}
		int likecnt = postService.getlikecnt(p_no);
		
		return likecnt;

	}
	
	@RequestMapping(value="/searchId", method=RequestMethod.GET, produces = "application/json;")
	public @ResponseBody List<PostVO> searchId(HttpServletRequest request, Model model) throws Exception{
		System.out.println("getpost 실행");
		String word = request.getParameter("word");
		List<PostVO> postList = postService.searchId(word);
		return postList;
	}

	// id 검색을 하고 스크롤을 내렸을때 실행해주는 ajax
	@RequestMapping(value="/searchIdScroll", method=RequestMethod.GET, produces = "application/json;")
	public @ResponseBody ArrayList<PostVO> searchIdScroll(HttpServletRequest request, Model model ) throws Exception{
		System.out.println("searchIdScroll 실행");
		int startNo = Integer.parseInt(request.getParameter("startNo"));
		String word = request.getParameter("word");
		Param param = new Param();
		param.setStartNo(startNo);
		param.setWord(word);
		ArrayList<PostVO> postList = postService.searchIdScroll(param);
		return postList;
	}
	
	

}
