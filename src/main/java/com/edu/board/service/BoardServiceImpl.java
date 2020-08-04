package com.edu.board.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.board.dao.BoardDao;
import com.edu.board.model.BoardCtmDto;
import com.edu.board.model.BoardRplDto;

@Service
public class BoardServiceImpl implements BoardService {
	private static final Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);

	@Autowired
	public BoardDao boardDao;

	@Override
	public List<BoardCtmDto> boardSelectList(String searchOption, String keyword, int start, int end) {
		// TODO Auto-generated method stub

		return boardDao.boardSelectList(searchOption, keyword, start, end);
	}

	@Override
	public void boardInsertOne(BoardCtmDto boardCtmDto){
		// TODO Auto-generated method stub

		boardDao.boardInsertOne(boardCtmDto);

	}

	@Override
	public int boardSelectTotalCount(String searchOption, String keyword) {
		// TODO Auto-generated method stub
		return boardDao.boardSelectTotalCount(searchOption, keyword);
	}
	
	

	@Override
	public BoardCtmDto boardSelectOne(int boardNo) {
		// TODO Auto-generated method stub
		
		BoardCtmDto boardCtmDto = boardDao.boardSelectOne(boardNo);
		
		
		return boardCtmDto;
	}

	@Override
	public void boardUpdateOne(BoardCtmDto boardCtmDto) {
		// TODO Auto-generated method stub
		
		boardDao.boardUpdateOne(boardCtmDto);
	}

	@Override
	public void boardDeleteOne(int boardNo) {
		// TODO Auto-generated method stub
		
		boardDao.boardDeleteOne(boardNo);
		
	}

	@Override
	public void boardViewOneUp(int boardNo) {
		// TODO Auto-generated method stub
		
		boardDao.boardViewOneUp(boardNo);
		
	}

	@Override
	public List<BoardRplDto> replySelectList(int boardNo) {
		// TODO Auto-generated method stub
		return boardDao.replySelectList(boardNo);
	}

	@Override
	public void replyInsertOne(BoardRplDto boardRplDto) {
		// TODO Auto-generated method stub
		
			boardDao.replyInsertOne(boardRplDto);	
		
	}

	@Override
	public void replyUpdateOne(BoardRplDto boardRplDto) {
		// TODO Auto-generated method stub
		
		boardDao.replyUpdateOne(boardRplDto);
		
	}

	@Override
	public BoardRplDto replySelectOne(int replyNo) {
		// TODO Auto-generated method stub
		return boardDao.replySelectOne(replyNo);
	}

	@Override
	public void replyDeleteOne(int replyNo) {
		// TODO Auto-generated method stub
		boardDao.replyDeleteOne(replyNo);
		
	}
	
	

	
}
