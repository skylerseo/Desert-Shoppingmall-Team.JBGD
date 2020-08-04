package com.edu.board.service;

import java.util.List;

import com.edu.board.model.BoardCtmDto;
import com.edu.board.model.BoardRplDto;

public interface BoardService {
	
	public List<BoardCtmDto> boardSelectList(String searchOption, String keyword,
			int start, int end);
	public void boardInsertOne(BoardCtmDto boardCtmDto);
	
	public int boardSelectTotalCount(String searchOption, String keyword);
	public void boardUpdateOne(BoardCtmDto boardCtmDto);
	public BoardCtmDto boardSelectOne(int boardNo);
	public void boardDeleteOne(int boardNo);
	public void boardViewOneUp(int boardNo);
	
	public List<BoardRplDto>replySelectList(int boardNo);
	public void replyInsertOne(BoardRplDto boardRplDto);
	public void replyUpdateOne(BoardRplDto boardRplDto);
	public BoardRplDto replySelectOne(int replyNo);
	public void replyDeleteOne(int replyNo);

}
