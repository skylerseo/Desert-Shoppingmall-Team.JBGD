package com.edu.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.board.model.BoardCtmDto;
import com.edu.board.model.BoardRplDto;

@Repository
public class BoardDaoImpl implements BoardDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "com.edu.board.";


	@Override
	public List<BoardCtmDto> boardSelectList(String searchOption, String keyword,
			int start, int end) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		
		
		
		return sqlSession.selectList(namespace + "boardSelectList", map);
	}

	@Override
	public int boardInsertOne(BoardCtmDto boardCtmDto) {
		// TODO Auto-generated method stub
		
		return sqlSession.insert(namespace + "boardInsertOne", boardCtmDto);
	}

	@Override
	public int boardSelectTotalCount(String searchOption, String keyword) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		
		return sqlSession.selectOne(namespace + 
				"boardSelectTotalCount", map);
	}

	@Override
	public int boardUpdateOne(BoardCtmDto boardCtmDto){
		// TODO Auto-generated method stub

		
		return sqlSession.update(namespace + "boardUpdateOne", boardCtmDto);
	}

	@Override
	public BoardCtmDto boardSelectOne(int boardNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "boardSelectOne", boardNo);
	}

	@Override
	public void boardDeleteOne(int boardNo) {
		// TODO Auto-generated method stub
		
		sqlSession.delete(namespace + "boardDeleteOne", boardNo);
		
	}

	@Override
	public int boardViewOneUp(int boardNo) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "boardViewOneUp", boardNo);
	}

	@Override
	public List<BoardRplDto> replySelectList(int boardNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + "replySelectList", boardNo);
	}

	@Override
	public int replyInsertOne(BoardRplDto boardRplDto) {
		// TODO Auto-generated method stub
		

		return sqlSession.insert(namespace + "replyInsertOne", boardRplDto);
	}

	@Override
	public int replyUpdateOne(BoardRplDto boardRplDto) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "replyUpdateOne", boardRplDto);
	}

	@Override
	public BoardRplDto replySelectOne(int replyNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "replySelectOne", replyNo);
	}

	@Override
	public int replyDeleteOne(int replyNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace + "replyDeleteOne", replyNo);
	}
	

}
