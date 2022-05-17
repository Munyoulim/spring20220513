package com.choong.spr.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.choong.spr.domain.BoardDto;

public interface BoardMapper {

	BoardDto getBoard(int id);

	int updateBoard(BoardDto board);

	int deleteBoard(int id);

	int insertBoard(BoardDto board);

	List<BoardDto> listBoardPage(@Param("from")int from, @Param("row")int rowPerPage, 
								@Param("keyword")String keyword, @Param("searchType")String searchType);

	int countBoards(@Param("keyword")String keyword, @Param("searchType")String searchType);
	
//	int getTotal(PageInfoDto info);

}
