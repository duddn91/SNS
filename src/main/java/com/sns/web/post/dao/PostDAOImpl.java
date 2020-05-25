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
/**
 *	PostDAO를 상속받아 postMapper.xml에 접근해서
 *	sql문을 실행시켜서 db에서 값을 받아와 리턴 시켜준다.
 *	@author youngwoo Byun	
 *  @author Lim jongmin
 *  @author Oh jieun
 */
@Repository
public class PostDAOImpl implements PostDAO{

	private static final Logger logger = LoggerFactory.getLogger(MemberService.class);
	private String NAMESPACE = "com.sns.web.post.postMapper";
	
	@Inject
	private SqlSession sqlSession;

	
	@Override
	public void insert(PostVO vo) throws Exception {
		logger.debug("PostDAOImpl에 insert() 실행 ");
		sqlSession.insert(NAMESPACE + ".insert", vo);
	}

	@Override
	public List<PostVO> selectList(int startNo) throws Exception{
		logger.debug("PostDAOImpl에 selectList() 실행 ");
		return sqlSession.selectList(NAMESPACE + ".selectList", startNo);
	}

	@Override
	public void replyInsert(ReplyVO replyVO) throws Exception {
		logger.debug("PostDAOImpl에 replyInsert() 실행 ");
		sqlSession.insert(NAMESPACE + ".replyInsert", replyVO);
	}

	@Override
	public void replycntUp(int r_pno) throws Exception {
		logger.debug("PostDAOImpl에 replycntUp() 실행 ");
		sqlSession.update(NAMESPACE + ".replycntUp", r_pno);
	}

	@Override
	public List<ReplyVO> selectReply(int r_pno) throws Exception {
		logger.debug("PostDAOImpl에 selectReply() 실행 ");
		return sqlSession.selectList(NAMESPACE + ".selectReply", r_pno);
	}

	@Override
	public int getMaxPostNo() throws Exception {
		logger.debug("PostDAOImpl에 getMaxPostNo() 실행 ");
		return sqlSession.selectOne(NAMESPACE + ".getMaxPostNo");
	}

	@Override
	public int selectCount() throws Exception {
		logger.debug("PostDAOImpl에 selectCount() 실행 ");		
		return sqlSession.selectOne(NAMESPACE + ".selectCount");
	}

}
