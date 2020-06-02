package com.sns.web.member.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.sns.web.member.model.MemberVO;
import com.sns.web.post.model.PostVO;
/**
 * 	MemberDAOImpl과 결합하는 인터페이스
 * 	클래스간의 결합성을 낮춰주고 유지보수에 용이하게 해주는 인터페이스다.
 *	@author youngwoo Byun
 */
public interface MemberDAO {

	public List<MemberVO> getMemberList() throws Exception; 
	public MemberVO getMemberInfo(String m_id) throws Exception;
	public int checkId(String m_id) throws Exception;
	public int insertMember(MemberVO memberVO) throws Exception;
	public int updateMember(MemberVO memberVO) throws Exception;
	public int deleteMember(int m_no) throws Exception;
	public MemberVO loginCheck(MemberVO memberVO) throws Exception;
	public int checkEmail(String m_email) throws Exception;
	public void findPW(Map<String, Object> map) throws Exception;
	public ArrayList<PostVO> getList(String id);
}
