package com.edu.shop.item.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.shop.item.model.ItemDto;
import com.edu.shop.item.model.ItemListDto;
import com.edu.shop.item.model.ItemOptionDto;
import com.edu.shop.sale.model.SaleItemDto;

@Repository
public class ItemDaoImpl implements ItemDao{
	@Autowired
	SqlSessionTemplate sqlSession;
	
	String itemSqlSpace = "com.edu.shop.item.";
	String listSqlSpace = "com.edu.shop.list.";

	@Override
	public List<ItemListDto> itemSelectList(Map<String, Object> searchOptionMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(listSqlSpace + "itemSelectList", searchOptionMap);
	}

	@Override
	public int itemSelectTotalCount(String keyword) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		
		return sqlSession.selectOne(itemSqlSpace + "itemSelectTotalCount", map);
	}

	@Override
	public void itemEzUpdateOne(ItemOptionDto itemOptionDto) {
		// TODO Auto-generated method stub
		sqlSession.update(itemSqlSpace + "itemEzUpdateOne", itemOptionDto);
	}
	
	@Override
	public void itemOptionStockUpdateOne(SaleItemDto saleItemDto, String mark) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("itemOptionNo", saleItemDto.getItemOptionNo());
		map.put("saleItemVolume", saleItemDto.getSaleItemVolume());
		map.put("mark", mark);
		
		sqlSession.update(itemSqlSpace + "itemOptionStockUpdateOne", map);
	}
	
	@Override
	public void itemEzDeleteOne(int itemOptionNo) {
		// TODO Auto-generated method stub
		sqlSession.update(itemSqlSpace + "itemOptionStateUpdateOne", itemOptionNo);
	}

	@Override
	public void itemInsertOne(ItemDto itemDto) {
		// TODO Auto-generated method stub
		sqlSession.insert(itemSqlSpace + "itemInsertOne", itemDto);
	}

	@Override
	public ItemDto itemSelectOne(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(itemSqlSpace + "itemSelectOne", map);
	}

	@Override
	public void itemOptionInsertOne(ItemOptionDto itemOptionDto) {
		// TODO Auto-generated method stub
		sqlSession.insert(itemSqlSpace + "itemOptionInsertOne", itemOptionDto);
	}

	@Override
	public void itemStateUpdateOne(int itemNo, String itemState) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("itemNo", itemNo);
		map.put("itemState", itemState);
		sqlSession.update(itemSqlSpace + "itemStateUpdateOne", map);
	}

	@Override
	public List<ItemOptionDto> itemOptionSelectList(int itemNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(itemSqlSpace + "itemOptionSelectList", itemNo);
	}

	@Override
	public void itemUpdateOne(ItemDto itemDto) {
		// TODO Auto-generated method stub
		sqlSession.update(itemSqlSpace + "itemUpdateOne", itemDto);
	}

	@Override
	public void itemOptionUpdateOne(ItemOptionDto itemOptionDto) {
		// TODO Auto-generated method stub
		sqlSession.update(itemSqlSpace + "itemOptionUpdateOne", itemOptionDto);
	}

	@Override
	public void itemOptionStateUpdateOne(ItemOptionDto itemOptionDto) {
		// TODO Auto-generated method stub
		sqlSession.delete(itemSqlSpace + "itemOptionStateUpdateOne", itemOptionDto);
	}

	@Override
	public void itemDeleteOne(int itemNo) {
		// TODO Auto-generated method stub
		sqlSession.delete(itemSqlSpace + "itemDeleteOne", itemNo);
	}

	@Override
	public void itemOptionDeleteList(int itemNo) {
		// TODO Auto-generated method stub
		sqlSession.delete(itemSqlSpace + "itemOptionDeleteList", itemNo);
	}

	@Override
	public void itemViewCountUpdateOne(int itemNo) {
		// TODO Auto-generated method stub
		sqlSession.update(itemSqlSpace + "itemViewCountUpdateOne", itemNo);
	}

	@Override
	public void itemStockUpdateOne(int itemNo) {
		// TODO Auto-generated method stub
		sqlSession.update(itemSqlSpace + "itemStockUpdateOne", itemNo);
	}
	
	@Override
	public void itemSoldCountUpdateOne(SaleItemDto saleItemDto, String mark) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("itemNo", saleItemDto.getItemNo());
		map.put("mark", mark);
		map.put("saleItemVolume", saleItemDto.getSaleItemVolume());
		
		sqlSession.update(itemSqlSpace + "itemSoldCountUpdateOne", map);
	}
	
	@Override
	public void itemOptionSoldCountUpdateOne(SaleItemDto saleItemDto, String mark) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("itemOptionNo", saleItemDto.getItemOptionNo());
		map.put("mark", mark);
		map.put("saleItemVolume", saleItemDto.getSaleItemVolume());
		
		sqlSession.update(itemSqlSpace + "itemOptionSoldCountUpdateOne", map);
	}

	@Override
	public List<ItemDto> itemStatisticsSelectList(Map<String, Object> searchOptionMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(itemSqlSpace + "itemStatisticsSelectList", searchOptionMap);
	}
}
