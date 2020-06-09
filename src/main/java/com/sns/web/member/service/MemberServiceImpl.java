package com.sns.web.member.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.web.member.dao.MemberDAO;
import com.sns.web.member.model.MemberVO;
import com.sns.web.post.model.PostVO;
/**
 * 	MemberService를 상속받아 비즈니스 로직을 작성하는 클래스
 *  MemberDAO로 매개변수를 전달해주고 받아온 값을 controller로 리턴해준다.
 *	@author youngwoo Byun
 */
@Service
public class MemberServiceImpl implements MemberService{

	private static final Logger logger = LoggerFactory.getLogger(MemberService.class);

	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public List<MemberVO> getMemberList() throws Exception {
		logger.debug("MemberServiceImpld에 getMemberList() 실행");
		return memberDAO.getMemberList();
	}
	
	@Override
	public MemberVO getMemberInfo(String m_id) throws Exception {
		logger.debug("MemberServiceImpld에 getMemberInfo() 실행");
		return memberDAO.getMemberInfo(m_id);
	}
	
	@Override
	public int insertMember(MemberVO memberVO) throws Exception {
		logger.debug("MemberServiceImpld에 insertMember() 실행");
		return memberDAO.insertMember(memberVO);
	}

	@Override
	public void updateMember(MemberVO memberVO) throws Exception {
		logger.debug("MemberServiceImpld에 updateMember() 실행");
		memberDAO.updateMember(memberVO);
	}

	@Override
	public int deleteMember(int m_no) throws Exception {
		logger.debug("MemberServiceImpld에 deleteMember() 실행");
		return memberDAO.deleteMember(m_no);
	}

	@Override
	public int checkId(String m_id) throws Exception {
		logger.debug("MemberServiceImpld에 checkId() 실행");
		return memberDAO.checkId(m_id);
	}

	@Override
	public MemberVO loginCheck(MemberVO memberVO) throws Exception {
		logger.debug("MemberServiceImpld에 loginCheck() 실행");
		return memberDAO.loginCheck(memberVO);
	}

	@Override
	public int checkEmail(String m_email) throws Exception {
		logger.debug("MemberServiceImpld에 checkEmail() 실행");
		return memberDAO.checkEmail(m_email);
	}

	@Override
	public void findPW(Map<String, Object> map) throws Exception {
		logger.debug("MemberServiceImpld에 findPW() 실행");
		memberDAO.findPW(map);		
	}

	@Override
	public ArrayList<PostVO> getList(String id) {
		logger.debug("MemberServiceImpld에 getList() 실행");
			
		return memberDAO.getList(id);
	}

	@Override
	public void updatePassword(MemberVO vo) throws Exception {
		logger.debug("MemberServiceImpld에 updatePassword() 실행");
		memberDAO.updatePassword(vo);
		
	}
	

}
