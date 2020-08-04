package com.edu.board.dao;

import java.util.List;

import com.edu.board.model.BoardCtmDto;
import com.edu.board.model.BoardRplDto;

public interface BoardDao {
	
	public List<BoardCtmDto> boardSelectList(String searchOption, String keyword, 
			int start, int end);
	public int boardInsertOne(BoardCtmDto boardCtmDto);	
	public int boardSelectTotalCount(String searchOption, String keyword);
	public int boardUpdateOne(BoardCtmDto boardCtmDto);
	public BoardCtmDto boardSelectOne(int boardNo);
	public void boardDeleteOne(int boardNo);
	public int boardViewOneUp(int boardNo);
	
	public List<BoardRplDto> replySelectList(int boardNo);
	public int replyInsertOne(BoardRplDto boardRplDto);
	public BoardRplDto replySelectOne(int replyNo);
	public int replyUpdateOne(BoardRplDto boardRplDto);
	public int replyDeleteOne(int replyNo);
	
	
}
