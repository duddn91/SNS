package com.sns.web.member.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.sns.web.member.model.MemberVO;
import com.sns.web.post.model.PostVO;
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
	public void updateMember(MemberVO memberVO) throws Exception;
	public int deleteMember(int m_no) throws Exception;
	public MemberVO loginCheck(MemberVO memberVO) throws Exception;
	public int checkEmail(String m_email) throws Exception;
	public void findPW(Map<String, Object> map) throws Exception;
	public ArrayList<PostVO> getList(String id);
	public void updatePassword(MemberVO vo) throws Exception;
}
