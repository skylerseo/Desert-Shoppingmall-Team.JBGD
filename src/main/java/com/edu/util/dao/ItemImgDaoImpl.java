package com.edu.util.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.util.model.ItemImgDto;

@Repository
public class ItemImgDaoImpl implements ItemImgDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "com.edu.util.";

	@Override
	public void itemImgInsertOne(Map<String, Object> imgMap, String option) {
		// TODO Auto-generated method stub
		imgMap.put("option", option);
		
		sqlSession.insert(namespace + "itemImgInsertOne", imgMap);
	}
	
	@Override
	public void itemImgThumbnailInsertOne(Map<String, Object> imgMap) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + "itemImgThumbnailInsertOne", imgMap);
	}

	@Override
	public List<ItemImgDto> itemImgSelectList(int itemNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + "itemImgSelectList", itemNo);
	}

	@Override
	public void itemImgUpdateOne(Map<String, Object> imgMap, int itemImgNo) {
		// TODO Auto-generated method stub
		imgMap.put("itemImgNo", itemImgNo);
		sqlSession.update(namespace + "itemImgUpdateOne", imgMap);
	}

	@Override
	public void itemImgDeleteOne(int itemImgNo) {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace + "itemImgDeleteOne", itemImgNo);
	}

	@Override
	public void itemImgDeleteList(int itemNo) {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace + "itemImgDeleteList", itemNo);
	}

	@Override
	public String itemImgSelectOne(int itemImgNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "itemImgSelectOne", itemImgNo);
	}
}
