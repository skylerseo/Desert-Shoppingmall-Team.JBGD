package com.edu.shop.sale.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.shop.sale.model.BasketDto;
import com.edu.shop.sale.model.BasketListDto;
import com.edu.shop.sale.model.SaleDto;
import com.edu.shop.sale.model.SaleItemDto;
import com.edu.shop.sale.model.SaleItemListDto;
import com.edu.shop.sale.model.SaleListDto;

@Repository
public class SaleDaoImpl implements SaleDao{
	@Autowired
	SqlSessionTemplate sqlSession;
	
	String saleSqlSpace = "com.edu.shop.sale.";
	String listSqlSpace = "com.edu.shop.list.";

	@Override
	public SaleItemListDto itemSaleSelectOne(int itemNo, int itemOptionNo) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("itemNo", itemNo);
		map.put("itemOptionNo", itemOptionNo);
		
		return sqlSession.selectOne(listSqlSpace + "itemSaleSelectOne", map);
	}

	@Override
	public BasketDto basketSelectOne(Map<String, Object> basketMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(saleSqlSpace + "basketSelectOne", basketMap);
	}
	
	@Override
	public void basketInsertOne(BasketDto basketDto) {
		// TODO Auto-generated method stub
		sqlSession.insert(saleSqlSpace + "basketInsertOne", basketDto);
	}

	@Override
	public List<BasketListDto> basketSelectList(int customerNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(listSqlSpace + "basketSelectList", customerNo);
	}

	@Override
	public void basketUpdateOne(int basketNo, int basketItemVolume) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("basketNo", basketNo);
		map.put("basketItemVolume", basketItemVolume);
		
		sqlSession.update(saleSqlSpace + "basketUpdateOne", map);
	}

	@Override
	public void basketDeleteOne(int basketNo) {
		// TODO Auto-generated method stub
		sqlSession.delete(saleSqlSpace + "basketDeleteOne", basketNo);
	}

	@Override
	public void saleInsertOne(SaleDto saleDto) {
		// TODO Auto-generated method stub
		sqlSession.insert(saleSqlSpace + "saleInsertOne", saleDto);
	}

	@Override
	public SaleDto saleSelectOne(Map<String, Object> saleMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(saleSqlSpace + "saleSelectOne", saleMap);
	}

	@Override
	public void saleUpdateStateOne(int saleNo, String saleState) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("saleNo", saleNo);
		map.put("saleState", saleState);
		
		sqlSession.update(saleSqlSpace + "saleUpdateStateOne", map);
	}

	@Override
	public void saleItemInsertOne(SaleItemDto saleItemDto) {
		// TODO Auto-generated method stub
		sqlSession.insert(saleSqlSpace + "saleItemInsertOne", saleItemDto);
	}

	@Override
	public void basketDeleteList(int customerNo) {
		// TODO Auto-generated method stub
		sqlSession.delete(saleSqlSpace + "basketDeleteList", customerNo);
	}
	
	@Override
	public int saleItemSelectTotalCount(int customerNo) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("customerNo", customerNo);
		return sqlSession.selectOne(saleSqlSpace + "saleItemSelectTotalCount", map);
	}
	
	@Override
	public List<SaleListDto> saleItemSelectList(int customerNo, int start, int end) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("customerNo", customerNo);
		map.put("start", start);
		map.put("end", end);
		
		return sqlSession.selectList(listSqlSpace + "saleItemSelectList", map);
	}
	
	@Override
	public List<SaleItemListDto> saleItemDetailSelectList(int saleNo) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectList(listSqlSpace + "saleItemDetailSelectList", saleNo);
	}

	@Override
	public void saleStateUpdateOne(int saleNo, String state) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("saleNo", saleNo);
		map.put("state", state);
		
		sqlSession.update(saleSqlSpace + "saleStateUpdateOne", map);
	}

	@Override
	public List<SaleItemDto> saleItemSimpleSelectList(int saleNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(saleSqlSpace + "saleItemSimpleSelectList", saleNo);
	}

}
