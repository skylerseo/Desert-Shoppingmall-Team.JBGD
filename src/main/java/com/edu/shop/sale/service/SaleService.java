package com.edu.shop.sale.service;

import java.util.List;
import java.util.Map;

import com.edu.shop.sale.model.BasketDto;
import com.edu.shop.sale.model.BasketListDto;
import com.edu.shop.sale.model.SaleDto;
import com.edu.shop.sale.model.SaleItemDto;
import com.edu.shop.sale.model.SaleItemListDto;
import com.edu.shop.sale.model.SaleListDto;

public interface SaleService {
	
	public SaleItemListDto itemSaleSelectOne(int itemNo, int itemOptionNo);
	public void basketInsertOne(BasketDto basketDto);
	public List<BasketListDto> basketSelectList(int customerNo);
	public BasketDto basketSelectOne(Map<String, Object> basketMap);
	public void basketUpdateOne(int basketNo, int basketItemVolume);
	public void basketDeleteOne(int basketNo);
	public void saleInsertOne(SaleDto saleDto);
	public SaleDto saleSelectOne(Map<String, Object> saleMap);
	public void saleUpdateStateOne(int saleNo, String saleState);
	public void saleItemInsertOne(SaleItemDto saleItemDto);
	public void basketDeleteList(int customerNo);
	public int saleItemSelectTotalCount(int customerNo);
	public List<SaleListDto> saleItemSelectList(int customerNo, int start, int end);
	public List<SaleItemListDto> saleItemDetailSelectList(int saleNo);
	public void saleStateUpdateOne(int saleNo, String state);
	public List<SaleItemDto> saleItemSimpleSelectList(int saleNo);
	
}
