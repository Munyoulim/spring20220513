package com.choong.spr.mapper;

import java.util.List;

import com.choong.spr.domain.ReplyDto;

public interface ReplyMapper {

	// 댓글 넣기
	int insertReply(ReplyDto reply);

	// 댓글 보여주기
	List<ReplyDto> selectReplyByBoardId(int boardId);

	// 댓글 삭제하기
	int deleteReplyById(int id);
	
	// 댓글 수정하기
	int updateReply(ReplyDto reply);
	
	// 댓글 있는 Board 삭제하기
	void deleteReplyByBoard(int boardId);
	
}
