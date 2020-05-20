package com.sns.web.post.model;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class PostVO {

	int p_no; 				// 게시물 전체 번호(시퀀스 설정해둠)
	String p_id;			// 글 게시자
	String p_photo; 		// 이미지파일 이름 (아이디 + 글 등록일 + .jpg) 일괄 적용
	String p_content; 		// 글 내용
	Date p_regdate;			// 글 등록일
	int p_replycnt;			// 댓글 개수 (오라클 기본값 0 설정)
	int p_filter;			// 필터 번호 (오라클 기본값 0 설정)
	
	
	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public String getP_id() {
		return p_id;
	}

	public void setP_id(String p_id) {
		this.p_id = p_id;
	}

	public String getP_photo() {
		return p_photo;
	}

	public void setP_photo(String p_photo) {
		this.p_photo = p_photo;
	}

	public String getP_content() {
		return p_content;
	}

	public void setP_content(String p_content) {
		this.p_content = p_content;
	}

	public Date getP_regdate() {
		return p_regdate;
	}

	public void setP_regdate(Date p_regdate) {
		this.p_regdate = p_regdate;
	}

	public int getP_replycnt() {
		return p_replycnt;
	}

	public void setP_replycnt(int p_replycnt) {
		this.p_replycnt = p_replycnt;
	}

	public int getP_filter() {
		return p_filter;
	}
	
	public void setP_filter(int p_filter) {
		this.p_filter = p_filter;
	}

	@Override
	public String toString() {
		return "PostVO [p_no=" + p_no + ", p_id=" + p_id + ", p_photo=" + p_photo + ", p_content=" + p_content
				+ ", p_regdate=" + p_regdate + ", replucnt=" + p_replycnt + ", p_filter=" + p_filter + "]";
	}
		
}
