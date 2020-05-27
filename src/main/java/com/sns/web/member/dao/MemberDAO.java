package com.sns.web.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sns.web.member.model.MemberVO;

public interface MemberDAO {

	public List<MemberVO> getMemberList() throws Exception; 
	public MemberVO getMemberInfo(String m_id) throws Exception;
	public int checkId(String m_id) throws Exception;
	public int insertMember(MemberVO memberVO) throws Exception;
	public int updateMember(MemberVO memberVO) throws Exception;
	public int deleteMember(int m_no) throws Exception;
	public MemberVO loginCheck(MemberVO memberVO) throws Exception;
	 	
	// 추가
	public int checkEmail(String m_email) throws Exception;
	public void findPW(Map<String, Object> map);
	
	
}
