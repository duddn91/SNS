package com.sns.web.post.dao;

import java.util.ArrayList;
import java.util.List;

import com.sns.web.post.model.Param;
import com.sns.web.post.model.PostVO;
import com.sns.web.post.model.ReplyVO;
/**
 * 	PostDAOImpl과 결합하는 인터페이스
 * 	클래스간의 결합성을 낮춰주고 유지보수에 용이하게 해주는 인터페이스다.
 *	@author youngwoo Byun
 *  @author Lim jongmin
 *  @author Oh jieun
 */
public interface PostDAO {

	// 게시물
	void insert(PostVO vo) throws Exception;
	List<PostVO> selectList(int startNo) throws Exception;
	int getMaxPostNo() throws Exception;
	int selectCount() throws Exception;
	
	// 답글
	void replycntUp(int r_pno) throws Exception;
	List<ReplyVO> selectReply(int r_pno) throws Exception;
	void insertReply(ReplyVO replyVO) throws Exception;
	ReplyVO getReply(int r_no) throws Exception;
	void incrementSeq(ReplyVO replyVO) throws Exception;
	void insertRecomment(ReplyVO replyVO) throws Exception;
	int getReplycnt(int r_pno) throws Exception;
	void updateRecomment(ReplyVO replyVO) throws Exception;
	void replycntDown(int r_pno) throws Exception;
	void deleteRecomment(int r_no) throws Exception;
	
	// 좋아요
	void likeUp(int p_no) throws Exception;
	void likeDown(int p_no) throws Exception;
	int getlikecnt(int p_no) throws Exception;
	
	// 검색
	List<PostVO> searchId(String word) throws Exception;
	ArrayList<PostVO> searchIdScroll(Param param) throws Exception;
}
