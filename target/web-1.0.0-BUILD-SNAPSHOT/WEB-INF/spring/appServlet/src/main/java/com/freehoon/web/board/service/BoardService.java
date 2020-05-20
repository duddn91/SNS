package com.freehoon.web.board.service;

import java.util.List;

import com.freehoon.web.board.model.BoardVO;

/*
	게시판 리스트 조회(getBoardList)
	게시물 상세조회(getBoardContent)
	게시물 입력(insertBoard)
	게시물 수정(updateBoard)
	게시물 삭제(deleteBoard)
*/
public interface BoardService {

	public List<BoardVO> getBoardList() throws Exception;




}
