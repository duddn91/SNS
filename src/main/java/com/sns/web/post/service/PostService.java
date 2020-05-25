package com.sns.web.post.service;

import java.util.List;

import com.sns.web.member.model.MemberVO;
import com.sns.web.post.model.PostVO;
import com.sns.web.post.model.ReplyVO;
/**
 * 	PostServiceImpl과 결합하는 인터페이스
 *  클래스간의 결합성을 낮춰 유지보수 측면에서 효율을 높인다
 *	@author youngwoo Byun
 *  @author Lim jongmin
 *  @author Oh jieun
 */
public interface PostService {

	void insert(PostVO vo) throws Exception;
	List<PostVO> selectList(int startNo) throws Exception;
	void replyInsert(ReplyVO replyVO) throws Exception;
	void replycntUp(int r_pno) throws Exception;
	List<ReplyVO> selectReply(int r_pno) throws Exception;
	int getMaxPostNo() throws Exception;
	int selectCount() throws Exception;
}
