package com.sns.web.post.service;

import java.util.ArrayList;
import java.util.List;

import com.sns.web.post.model.Param;
import com.sns.web.post.model.PostVO;
import com.sns.web.post.model.ReplyVO;

public interface PostService {

	// 게시물
	void insert(PostVO vo) throws Exception;
	List<PostVO> selectList(int startNo) throws Exception;
	void replycntUp(int r_pno) throws Exception;
	List<ReplyVO> selectReply(int r_pno) throws Exception;
	int getMaxPostNo() throws Exception;
	int selectCount() throws Exception;
	
	// 답글
	void insertReply(ReplyVO replyVO) throws Exception;
	ReplyVO getReply(int r_no) throws Exception;
	void incrementSeq(ReplyVO replyVO) throws Exception;
	void insertRecomment(ReplyVO replyVO) throws Exception;
	int getReplycnt(int r_pno) throws Exception;
	void updateRecomment(ReplyVO replyVO) throws Exception;
	void replycntDown(int r_pno) throws Exception;
	void deleteRecomment(int r_no) throws Exception;
	
	// 검색
	List<PostVO> searchId(String word) throws Exception;
	ArrayList<PostVO> searchIdScroll(Param param) throws Exception;
	
	// 좋아요
	void likeUp(int p_no) throws Exception;
	void likeDown(int p_no) throws Exception;
	int getlikecnt(int p_no) throws Exception;
}
