package com.sns.web.member.service;

import java.util.HashMap;
import java.util.List;

import com.sns.web.member.model.MemberVO;

public interface MemberService {
	
	public List<MemberVO> getMemberList() throws Exception; 
	public MemberVO getMemberInfo(String m_id) throws Exception;
	public int checkId(String m_id) throws Exception; 
	public int insertMember(MemberVO memberVO) throws Exception;
	public int updateMember(MemberVO memberVO) throws Exception;
	public int deleteMember(int m_no) throws Exception;
	public MemberVO loginCheck(MemberVO memberVO) throws Exception;
}
