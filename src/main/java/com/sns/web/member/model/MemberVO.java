package com.sns.web.member.model;

import org.springframework.stereotype.Component;

/**
 * 회원 정보 형식을 저장하는 클래스
 * @author youngwoo Byun
 */
@Component
public class MemberVO {
	
	private int m_no;
	private String m_name;
	private String m_id;
	private String m_pw;
	private String m_email;
	private String m_birth;
	private String m_phone;
	private String m_profile;
	
	
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pw() {
		return m_pw;
	}
	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_birth() {
		return m_birth;
	}
	public void setM_birth(String m_birth) {
		this.m_birth = m_birth;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	public String getM_profile() {
		return m_profile;
	}
	public void setM_profile(String m_profile) {
		this.m_profile = m_profile;
	}
	
	@Override
	public String toString() {
		return "MemberVO [m_no=" + m_no + ", m_name=" + m_name + ", m_id=" + m_id + ", m_pw=" + m_pw + ", m_email="
				+ m_email + ", m_birth=" + m_birth + ", m_phone=" + m_phone + ", m_profile=" + m_profile + "]";
	}
	
	
	
	
}
