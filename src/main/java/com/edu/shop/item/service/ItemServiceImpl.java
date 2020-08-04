package com.edu.shop.item.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.board.service.BoardServiceImpl;
import com.edu.shop.item.dao.ItemDao;
import com.edu.shop.item.model.ItemDto;
import com.edu.shop.item.model.ItemListDto;
import com.edu.shop.item.model.ItemOptionDto;
import com.edu.shop.sale.model.SaleItemDto;

@Service
public class ItemServiceImpl implements ItemService{
	private static final Logger log = LoggerFactory.getLogger(BoardServiceImpl.class);
	
	@Autowired
	public ItemDao itemDao;
	
	@Override
	public List<ItemListDto> itemSelectList(Map<String, Object> searchOptionMap) {
		// TODO Auto-generated method stub
		return itemDao.itemSelectList(searchOptionMap);
	}

	@Override
	public int itemSelectTotalCount(String keyword) {
		// TODO Auto-generated method stub
		return itemDao.itemSelectTotalCount(keyword);
	}

	@Override
	public void itemEzUpdateOne(ItemOptionDto itemOptionDto) {
		// TODO Auto-generated method stub
		itemDao.itemEzUpdateOne(itemOptionDto);
	}
	
	@Override
	public void itemOptionStockUpdateOne(SaleItemDto SaleItemDto, String mark) {
		// TODO Auto-generated method stub
		itemDao.itemOptionStockUpdateOne(SaleItemDto, mark);
	}
	
	@Override
	public void itemEzDeleteOne(int itemOptionNo) {
		// TODO Auto-generated method stub
		itemDao.itemEzDeleteOne(itemOptionNo);
	}

	@Override
	public void itemInsertOne(ItemDto itemDto) {
		// TODO Auto-generated method stub
		itemDao.itemInsertOne(itemDto);
	}

	@Override
	public ItemDto itemSelectOne(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
		return itemDao.itemSelectOne(map);
	}

	@Override
	public void itemOptionInsertOne(ItemOptionDto itemOptionDto) {
		// TODO Auto-generated method stub
		
		itemDao.itemOptionInsertOne(itemOptionDto);
	}

	@Override
	public void itemStateUpdateOne(int itemNo, String itemState) {
		// TODO Auto-generated method stub
		
		itemDao.itemStateUpdateOne(itemNo, itemState);
	}

	@Override
	public List<ItemOptionDto> itemOptionSelectList(int itemNo) {
		// TODO Auto-generated method stub
		return itemDao.itemOptionSelectList(itemNo);
	}

	@Override
	public void itemUpdateOne(ItemDto itemDto) {
		// TODO Auto-generated method stub
		itemDao.itemUpdateOne(itemDto);
	}

	@Override
	public void itemOptionUpdateOne(ItemOptionDto itemOptionDto) {
		// TODO Auto-generated method stub
		itemDao.itemOptionUpdateOne(itemOptionDto);
	}

	@Override
	public void itemOptionStateUpdateOne(ItemOptionDto itemOptionDto) {
		// TODO Auto-generated method stub
		itemDao.itemOptionStateUpdateOne(itemOptionDto);
	}

	@Override
	public void itemDeleteOne(int itemNo) {
		// TODO Auto-generated method stub
		itemDao.itemDeleteOne(itemNo);
	}

	@Override
	public void itemOptionDeleteList(int itemNo) {
		// TODO Auto-generated method stub
		itemDao.itemOptionDeleteList(itemNo);
	}

	@Override
	public void itemViewCountUpdateOne(int itemNo) {
		// TODO Auto-generated method stub
		itemDao.itemViewCountUpdateOne(itemNo);
	}

	@Override
	public void itemStockUpdateOne(int itemNo) {
		// TODO Auto-generated method stub
		itemDao.itemStockUpdateOne(itemNo);
	}
	
	@Override
	public void itemSoldCountUpdateOne(SaleItemDto saleItemDto, String mark) {
		// TODO Auto-generated method stub
		itemDao.itemSoldCountUpdateOne(saleItemDto, mark);
		itemDao.itemOptionSoldCountUpdateOne(saleItemDto, mark);
	}
	
	@Override
	public List<ItemDto> itemStatisticsSelectList(Map<String, Object> searchOptionMap) {
		// TODO Auto-generated method stub
		return itemDao.itemStatisticsSelectList(searchOptionMap);
	}
}
