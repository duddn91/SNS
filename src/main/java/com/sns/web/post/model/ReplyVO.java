package com.sns.web.post.model;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class ReplyVO {
	
	private int r_no;		
	private int r_pno;	
	private String r_id;	
	private String r_content;	
	private Date r_regDate;	
	private int r_ref;		
	private int r_lev;	
	private int r_seq;
	private int r_delete;
	
	public int getR_delete() {
		return r_delete;
	}
	public void setR_delete(int r_delete) {
		this.r_delete = r_delete;
	}
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public int getR_pno() {
		return r_pno;
	}
	public void setR_pno(int r_pno) {
		this.r_pno = r_pno;
	}
	public String getR_id() {
		return r_id;
	}
	public void setR_id(String r_id) {
		this.r_id = r_id;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public Date getR_regDate() {
		return r_regDate;
	}
	public void setR_regDate(Date r_regDate) {
		this.r_regDate = r_regDate;
	}
	public int getR_ref() {
		return r_ref;
	}
	public void setR_ref(int r_ref) {
		this.r_ref = r_ref;
	}
	public int getR_lev() {
		return r_lev;
	}
	public void setR_lev(int r_lev) {
		this.r_lev = r_lev;
	}
	public int getR_seq() {
		return r_seq;
	}
	public void setR_seq(int r_seq) {
		this.r_seq = r_seq;
	}
	@Override
	public String toString() {
		return "ReplyVO [r_no=" + r_no + ", r_pno=" + r_pno + ", r_id=" + r_id + ", r_content=" + r_content
				+ ", r_regDate=" + r_regDate + ", r_ref=" + r_ref + ", r_lev=" + r_lev + ", r_seq=" + r_seq
				+ ", r_delete=" + r_delete + "]";
	}
	
	
	
}
