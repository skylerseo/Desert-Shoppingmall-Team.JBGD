package com.edu.shop.item.dao;

import java.util.List;
import java.util.Map;

import com.edu.shop.item.model.ItemDto;
import com.edu.shop.item.model.ItemListDto;
import com.edu.shop.item.model.ItemOptionDto;
import com.edu.shop.sale.model.SaleItemDto;

public interface ItemDao {

	public List<ItemListDto> itemSelectList(Map<String, Object> searchOptionMap);
	public int itemSelectTotalCount(String keyword);
	public void itemEzUpdateOne(ItemOptionDto itemOptionDto);
	public void itemOptionStockUpdateOne(SaleItemDto saleItemDto, String mark);
	public void itemEzDeleteOne(int itemOptionNo);
	public void itemInsertOne(ItemDto itemDto);
	public ItemDto itemSelectOne(Map<String, Object> map);
	public void itemOptionInsertOne(ItemOptionDto itemOptionDto);
	public void itemStateUpdateOne(int itemNo, String itemState);
	public List<ItemOptionDto> itemOptionSelectList(int itemNo);
	public void itemUpdateOne(ItemDto itemDto);
	public void itemOptionUpdateOne(ItemOptionDto itemOptionDto);
	public void itemOptionStateUpdateOne(ItemOptionDto itemOptionDto);
	public void itemDeleteOne(int itemNo);
	public void itemOptionDeleteList(int itemNo);
	public void itemViewCountUpdateOne(int itemNo);
	public void itemStockUpdateOne(int itemNo);
	public void itemSoldCountUpdateOne(SaleItemDto saleItemDto, String mark);
	public void itemOptionSoldCountUpdateOne(SaleItemDto saleItemDto, String mark);
	public List<ItemDto> itemStatisticsSelectList(Map<String, Object> searchOptionMap);
}
