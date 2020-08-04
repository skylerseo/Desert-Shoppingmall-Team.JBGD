package com.edu.shop.sale.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.board.service.BoardServiceImpl;
import com.edu.shop.sale.dao.SaleDao;
import com.edu.shop.sale.model.BasketDto;
import com.edu.shop.sale.model.BasketListDto;
import com.edu.shop.sale.model.SaleDto;
import com.edu.shop.sale.model.SaleItemDto;
import com.edu.shop.sale.model.SaleItemListDto;
import com.edu.shop.sale.model.SaleListDto;

@Service
public class SaleServiceImpl implements SaleService{
	private static final Logger log = LoggerFactory.getLogger(BoardServiceImpl.class);
	
	@Autowired
	public SaleDao saleDao;

	@Override
	public SaleItemListDto itemSaleSelectOne(int itemNo, int itemOptionNo) {
		// TODO Auto-generated method stub
		return saleDao.itemSaleSelectOne(itemNo, itemOptionNo);
	}

	@Override
	public void basketInsertOne(BasketDto basketDto) {
		// TODO Auto-generated method stub
		saleDao.basketInsertOne(basketDto);
	}

	@Override
	public List<BasketListDto> basketSelectList(int customerNo) {
		// TODO Auto-generated method stub
		return saleDao.basketSelectList(customerNo);
	}

	@Override
	public BasketDto basketSelectOne(Map<String, Object> basketMap) {
		// TODO Auto-generated method stub
		return saleDao.basketSelectOne(basketMap);
	}
	
	@Override
	public void basketUpdateOne(int basketNo, int basketItemVolume) {
		// TODO Auto-generated method stub
		saleDao.basketUpdateOne(basketNo, basketItemVolume);
	}

	@Override
	public void basketDeleteOne(int basketNo) {
		// TODO Auto-generated method stub
		saleDao.basketDeleteOne(basketNo);
	}

	@Override
	public void saleInsertOne(SaleDto saleDto) {
		// TODO Auto-generated method stub
		saleDao.saleInsertOne(saleDto);
	}

	@Override
	public SaleDto saleSelectOne(Map<String, Object> saleMap) {
		// TODO Auto-generated method stub
		return saleDao.saleSelectOne(saleMap);
	}

	@Override
	public void saleUpdateStateOne(int saleNo, String saleState) {
		// TODO Auto-generated method stub
		saleDao.saleUpdateStateOne(saleNo, saleState);
	}

	@Override
	public void saleItemInsertOne(SaleItemDto saleItemDto) {
		// TODO Auto-generated method stub
		saleDao.saleItemInsertOne(saleItemDto);
	}

	@Override
	public List<SaleListDto> saleItemSelectList(int customerNo, int start, int end) {
		// TODO Auto-generated method stub
		return saleDao.saleItemSelectList(customerNo, start, end);
	}
	
	@Override
	public List<SaleItemListDto> saleItemDetailSelectList(int saleNo) {
		// TODO Auto-generated method stub
		return saleDao.saleItemDetailSelectList(saleNo);
	}
	
	@Override
	public int saleItemSelectTotalCount(int customerNo) {
		// TODO Auto-generated method stub
		return saleDao.saleItemSelectTotalCount(customerNo);
	}

	@Override
	public void basketDeleteList(int customerNo) {
		// TODO Auto-generated method stub
		saleDao.basketDeleteList(customerNo);
	}

	@Override
	public void saleStateUpdateOne(int saleNo, String state) {
		// TODO Auto-generated method stub
		saleDao.saleStateUpdateOne(saleNo, state);
	}

	@Override
	public List<SaleItemDto> saleItemSimpleSelectList(int saleNo) {
		// TODO Auto-generated method stub
		return saleDao.saleItemSimpleSelectList(saleNo);
	}

}
