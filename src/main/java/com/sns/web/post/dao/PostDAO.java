package com.sns.web.post.dao;

import java.util.List;

import com.sns.web.member.model.MemberVO;
import com.sns.web.post.model.PostVO;
import com.sns.web.post.model.ReplyVO;

/**
 * postmapper.xml로 해당 아이디를 넘겨주는 클래스 
 * @author 
 *
 */

//
public interface PostDAO {

	void insert(PostVO vo) throws Exception;
	List<PostVO> selectList(int startNo) throws Exception;
	void replyInsert(ReplyVO replyVO) throws Exception;
	void replycntUp(int r_pno) throws Exception;
	List<ReplyVO> selectReply(int r_pno) throws Exception;
	int getMaxPostNo() throws Exception;
	int selectCount() throws Exception;

	
}
