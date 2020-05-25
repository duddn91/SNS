package com.sns.web.post.dao;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.sns.web.member.model.MemberVO;
import com.sns.web.member.service.MemberService;
import com.sns.web.post.model.PostVO;
import com.sns.web.post.model.ReplyVO;

//

@Repository
public class PostDAOImpl implements PostDAO{

	private static final Logger logger = LoggerFactory.getLogger(MemberService.class);
	private String NAMESPACE = "com.sns.web.post.postMapper";
	
	@Inject
	private SqlSession sqlSession;

	/**
	 * 		게시물을 데이터베이스에 입력시켜주는 메소드
	 */
	@Override
	public void insert(PostVO vo) throws Exception {
		logger.debug("PostDAOImpl에 insert() 실행 ");
		sqlSession.insert(NAMESPACE + ".insert", vo);
	}

	/**
	 * 게시물 리스트를 받아와 넘겨주는 메소드
	 */
	@Override
	public List<PostVO> selectList(int startNo) throws Exception{
		logger.debug("PostDAOImpl에 selectList() 실행 ");
		return sqlSession.selectList(NAMESPACE + ".selectList", startNo);
	}

	/**
	 * 댓글을 입력시켜주는 메소드
	 */
	@Override
	public void replyInsert(ReplyVO replyVO) throws Exception {
		logger.debug("PostDAOImpl에 replyInsert() 실행 ");
		sqlSession.insert(NAMESPACE + ".replyInsert", replyVO);
	}

	/**
	 * 댓글입력시에 post테이블의 댓글개수를 1증가시켜주는 메소드
	 */
	@Override
	public void replycntUp(int r_pno) throws Exception {
		logger.debug("PostDAOImpl에 replycntUp() 실행 ");
		sqlSession.update(NAMESPACE + ".replycntUp", r_pno);
	}
	
	/**
	 *  post의 번호를 받아 해당 post에 달린 댓글목록을 가져오는 메소드
	 */
	@Override
	public List<ReplyVO> selectReply(int r_pno) throws Exception {
		logger.debug("PostDAOImpl에 selectReply() 실행 ");
		return sqlSession.selectList(NAMESPACE + ".selectReply", r_pno);
	}
	
	/**
	 * 현재 게시물의 최대 index를 가져오는 메소드
	 */
	@Override
	public int getMaxPostNo() throws Exception {
		logger.debug("PostDAOImpl에 getMaxPostNo() 실행 ");
		return sqlSession.selectOne(NAMESPACE + ".getMaxPostNo");
	}
	
	/**
	 * 전체 게시물의 개수를 가져오는 메소드
	 */
	@Override
	public int selectCount() throws Exception {
		logger.debug("PostDAOImpl에 selectCount() 실행 ");		
		return sqlSession.selectOne(NAMESPACE + ".selectCount");
	}



}
