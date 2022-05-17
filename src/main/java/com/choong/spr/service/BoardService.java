package com.choong.spr.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.choong.spr.domain.BoardDto;
import com.choong.spr.mapper.BoardMapper;
import com.choong.spr.mapper.ReplyMapper;

@Service
public class BoardService {
	
	@Autowired
	private BoardMapper mapper;
	
	@Autowired
	private ReplyMapper replyMapper;
	
	// select
	public BoardDto getBoard(int id) {
		return mapper.getBoard(id);
	}
	// modify
	public boolean updateBoard(BoardDto board) {
		int cnt = mapper.updateBoard(board);
		return cnt == 1;
	}
	
	// delete
	@Transactional
	public boolean removeBoardById(int id) {
		
		// 댓글 지우기
		replyMapper.deleteReplyByBoard(id);
		
		// 게시물 지우기
		int cnt = mapper.deleteBoard(id);
		
		return cnt == 1;
	}

	// insert
	public boolean addBoard(BoardDto board) {
		board.setInserted(LocalDateTime.now());
		
		int cnt = mapper.insertBoard(board);
		
		return cnt == 1;
	}

	public List<BoardDto> listBoardPage(int page, int rowPerPage, String keyword, String searchType) {
		int from = (page-1) * rowPerPage;
		
		return mapper.listBoardPage(from, rowPerPage, keyword, searchType); 
	}

	public int countBoards(String keyword, String searchType) {
		return mapper.countBoards(keyword, searchType);
	}
	
//	public int getTotal(PageInfoDto info) { 
//		return mapper.getTotal(info);
//	}

}






















