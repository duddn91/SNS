package com.sns.web.post.model;

import org.springframework.stereotype.Component;

@Component
public class Param {
	
	private String word;
	private int startNo;
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
	public int getStartNo() {
		return startNo;
	}
	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}
	@Override
	public String toString() {
		return "Param [word=" + word + ", startNo=" + startNo + "]";
	}
	
	
	
}
