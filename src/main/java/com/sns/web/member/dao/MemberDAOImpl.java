package com.sns.web.member.dao;

import java.util.HashMap;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.sns.web.member.model.MemberVO;
import com.sns.web.member.service.MemberService;

/**
 *	MemberDAO를 상속받아 memberMapper.xml에 접근해서
 *	sql문을 실행시켜서 db에서 값을 받아와 리턴 시켜준다.
 *	@author youngwoo Byun
 */
@Repository
public class MemberDAOImpl implements MemberDAO{

	private static final Logger logger = LoggerFactory.getLogger(MemberService.class);
	private String NAMESPACE = "com.sns.web.member.memberMapper";
	
	@Inject
	private SqlSession sqlSession;

	
	@Override
	public List<MemberVO> getMemberList() throws Exception {
		logger.debug("MemberDAOImpl에 getMemberList() 실행 ");
		return sqlSession.selectList(NAMESPACE+".getMemberList");
	}
	
	@Override
	public MemberVO getMemberInfo(String m_id) throws Exception {
		logger.debug("MemberDAOImpl에 getMemberInfo() 실행 ");
		return sqlSession.selectOne(NAMESPACE+".getMemberInfo", m_id);
	}
	
	@Override
	public int insertMember(MemberVO memberVO) throws Exception {
		logger.debug("MemberDAOImpl에 insertMember() 실행 ");
		return sqlSession.insert(NAMESPACE+".insertMember", memberVO);
	}

	@Override
	public int updateMember(MemberVO memberVO) throws Exception {
		logger.debug("MemberDAOImpl에 updateMember() 실행 ");
		return sqlSession.update(NAMESPACE+".updateMember", memberVO);
	}

	@Override
	public int deleteMember(int m_no) throws Exception {
		logger.debug("MemberDAOImpl에 deleteMember() 실행 ");
		return sqlSession.delete(NAMESPACE+".deleteMember", m_no);
	}

	@Override
	public int checkId(String m_id) throws Exception {
		logger.debug("MemberDAOImpl에 checkId() 실행 ");
		return sqlSession.selectOne(NAMESPACE+".checkId", m_id);
	}

	@Override
	public MemberVO loginCheck(MemberVO memberVO) {
		logger.debug("MemberDAOImpl에 loginCheck() 실행 ");
		return sqlSession.selectOne(NAMESPACE+".loginCheck", memberVO);
	}


}
