package com.sns.web.post.dao;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.sns.web.member.service.MemberService;
import com.sns.web.post.model.Param;
import com.sns.web.post.model.PostVO;
import com.sns.web.post.model.ReplyVO;

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

	@Override
	public void insertReply(ReplyVO replyVO) throws Exception {
		logger.debug("PostDAOImpl에 insertReply() 실행 ");
		sqlSession.insert(NAMESPACE + ".insertReply", replyVO);
		
	}

	@Override
	public ReplyVO getReply(int r_no) throws Exception {
		logger.debug("PostDAOImpl에 getReply() 실행 ");
		return sqlSession.selectOne(NAMESPACE + ".getReply", r_no);
	}

	@Override
	public void incrementSeq(ReplyVO replyVO) throws Exception {
		logger.debug("PostDAOImpl에 incrementSeq() 실행 ");		
		sqlSession.update(NAMESPACE + ".incrementSeq", replyVO);
		
	}

	@Override
	public void insertRecomment(ReplyVO replyVO) throws Exception {
		logger.debug("PostDAOImpl에 insertRecomment() 실행 ");		
		sqlSession.update(NAMESPACE + ".insertRecomment", replyVO);
		
	}

	@Override
	public int getReplycnt(int r_pno) throws Exception {
		logger.debug("PostDAOImpl에 getReplycnt() 실행 ");		
		return sqlSession.selectOne(NAMESPACE + ".getReplycnt", r_pno);
	}

	@Override
	public void updateRecomment(ReplyVO replyVO) throws Exception {
		logger.debug("PostDAOImpl에 updateRecomment() 실행 ");	
		sqlSession.update(NAMESPACE + ".updateRecomment", replyVO);
	}

	@Override
	public void replycntDown(int r_pno) throws Exception {
		logger.debug("PostDAOImpl에 replycntDown() 실행 ");	
		sqlSession.update(NAMESPACE + ".replycntDown", r_pno);
	}

	@Override
	public void deleteRecomment(int r_no) throws Exception {
		logger.debug("PostDAOImpl에 deleteRecomment() 실행 ");	
		sqlSession.update(NAMESPACE + ".deleteRecomment", r_no);
		
	}

	@Override
	public void likeUp(int p_no) throws Exception {
		logger.debug("PostDAOImpl에 likeUp() 실행 ");	
		sqlSession.update(NAMESPACE + ".likeUp", p_no);
		
	}

	@Override
	public void likeDown(int p_no) throws Exception {
		logger.debug("PostDAOImpl에 likeDown() 실행 ");	
		sqlSession.update(NAMESPACE + ".likeDown", p_no);
		
	}

	@Override
	public int getlikecnt(int p_no) throws Exception {
		logger.debug("PostDAOImpl에 getlikecnt() 실행 ");		
		return sqlSession.selectOne(NAMESPACE + ".getlikecnt", p_no);
	
	}

	@Override
	public List<PostVO> searchId(String word) throws Exception {
		logger.debug("PostDAOImpl에 searchId() 실행 ");
		return sqlSession.selectList(NAMESPACE + ".searchId", word);
	}

	@Override
	public ArrayList<PostVO> searchIdScroll(Param param) throws Exception {
		logger.debug("PostDAOImpl에 searchIdScroll() 실행 ");	
		List<PostVO> vo = sqlSession.selectList(NAMESPACE + ".searchIdScroll", param);
		return (ArrayList<PostVO>)vo;
	}


}
