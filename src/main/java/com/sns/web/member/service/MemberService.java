package com.sns.web.member.service;

import java.util.HashMap;
import java.util.List;

import com.sns.web.member.model.MemberVO;
/**
 *
 * 	MemberServiceImpl과 결합하는 인터페이스
 *  클래스간의 결합성을 낮춰 유지보수 측면에서 효율을 높인다
 *	@author youngwoo Byun
 */
public interface MemberService {
	
	public List<MemberVO> getMemberList() throws Exception; 
	public MemberVO getMemberInfo(String m_id) throws Exception;
	public int checkId(String m_id) throws Exception; 
	public int insertMember(MemberVO memberVO) throws Exception;
	public int updateMember(MemberVO memberVO) throws Exception;
	public int deleteMember(int m_no) throws Exception;
	public MemberVO loginCheck(MemberVO memberVO) throws Exception;
}
