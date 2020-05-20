package com.sns.web.post.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.web.member.model.MemberVO;
import com.sns.web.member.service.MemberService;
import com.sns.web.post.dao.PostDAO;
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
	public void replyInsert(ReplyVO replyVO) throws Exception {

		logger.debug("PostServiceImpl에 replyInsert() 실행");
		postDAO.replyInsert(replyVO);
		
		
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

}
