package com.sns.web.post.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.web.member.service.MemberService;
import com.sns.web.post.dao.PostDAO;
import com.sns.web.post.model.Param;
import com.sns.web.post.model.PostVO;
import com.sns.web.post.model.ReplyVO;

@Service
public class PostServiceImpl implements PostService{

	private static final Logger logger = LoggerFactory.getLogger(MemberService.class);
	
	@Autowired
	private PostDAO postDAO;
	
	@Override
	public void insert(PostVO vo) throws Exception {
		logger.debug("PostServiceImpl에 insert() 실행");
		System.out.println(vo);
		postDAO.insert(vo);
	}

	@Override
	public List<PostVO> selectList(int startNo) throws Exception {
		return postDAO.selectList(startNo);
	}


	@Override
	public void replycntUp(int r_pno) throws Exception {
		
		logger.debug("PostServiceImpl에 replycntUp() 실행");
		postDAO.replycntUp(r_pno);
		
		
	}

	@Override
	public List<ReplyVO> selectReply(int r_pno) throws Exception {
		logger.debug("PostServiceImpl에 selectReply() 실행");

		return postDAO.selectReply(r_pno);
	}

	@Override
	public int getMaxPostNo() throws Exception {
		logger.debug("PostServiceImpl에 getMaxPostNo() 실행");
		System.out.println(postDAO.getMaxPostNo());

		return postDAO.getMaxPostNo();
	}

	@Override
	public int selectCount() throws Exception {
		logger.debug("PostServiceImpl에 selectCount() 실행");

		return postDAO.selectCount();
	}

	@Override
	public void insertReply(ReplyVO replyVO) throws Exception {
		logger.debug("PostServiceImpl에 insertReply() 실행");
		postDAO.insertReply(replyVO);
		
	}

	@Override
	public ReplyVO getReply(int r_no) throws Exception {
		logger.debug("PostServiceImpl에 getReply() 실행");
		return postDAO.getReply(r_no);
	}

	@Override
	public void incrementSeq(ReplyVO replyVO) throws Exception {
		logger.debug("PostServiceImpl에 incrementSeq() 실행");
		postDAO.incrementSeq(replyVO);
	}

	@Override
	public void insertRecomment(ReplyVO replyVO) throws Exception {
		logger.debug("PostServiceImpl에 insertRecomment() 실행");
		postDAO.insertRecomment(replyVO);
		
	}

	@Override
	public int getReplycnt(int r_pno) throws Exception {
		logger.debug("PostServiceImpl에 getReplycnt() 실행");
		return postDAO.getReplycnt(r_pno);
	}

	@Override
	public void updateRecomment(ReplyVO replyVO) throws Exception {
		logger.debug("PostServiceImpl에 updateRecomment() 실행");	
		postDAO.updateRecomment(replyVO);
		
	}

	@Override
	public void replycntDown(int r_pno) throws Exception {
		logger.debug("PostServiceImpl에 replycntDown() 실행");	
		postDAO.replycntDown(r_pno);
	}

	@Override
	public void deleteRecomment(int r_no) throws Exception {
		logger.debug("PostServiceImpl에 deleteRecomment() 실행");	
		postDAO.deleteRecomment(r_no);
	}

	@Override
	public void likeUp(int p_no) throws Exception {
		logger.debug("PostServiceImpl에 likeUp() 실행");	
		postDAO.likeUp(p_no);
		
	}

	@Override
	public void likeDown(int p_no) throws Exception {
		logger.debug("PostServiceImpl에 likeDown() 실행");	
		postDAO.likeDown(p_no);
	}

	@Override
	public int getlikecnt(int p_no) throws Exception {
		logger.debug("PostServiceImpl에 getlikecnt() 실행");
		return postDAO.getlikecnt(p_no);
	}

	@Override
	public List<PostVO> searchId(String word) throws Exception {
		logger.debug("PostServiceImpl에 searchId() 실행");
		return postDAO.searchId(word);
	}

	@Override
	public ArrayList<PostVO> searchIdScroll(Param param) throws Exception {
		logger.debug("PostServiceImpl에 searchIdScroll() 실행");
		return postDAO.searchIdScroll(param);
	}


}
