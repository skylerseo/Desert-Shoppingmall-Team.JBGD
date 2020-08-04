package com.edu.shop.item.model;

import java.util.Date;
import java.util.List;

import com.edu.shop.sale.model.BasketDto;

public class ItemOptionDto {

	private List<ItemOptionDto> itemOptionList;
	private int itemOptionNo = 0;
	private String itemOptionName = "";
	private int itemOptionPrice = 0;
	private int itemOptionStock = 0;
	private int itemOptionSoldCount = 0;
	private Date itemOptionCreDate = null;
	private Date itemOptionModDate = null;
	private String itemOptionState = "";
	private int itemNo = 0;
	public ItemOptionDto() {
		super();
	}
	public ItemOptionDto(int itemOptionNo, int itemOptionStock) {
		super();
		this.itemOptionNo = itemOptionNo;
		this.itemOptionStock = itemOptionStock;
	}
	public ItemOptionDto(List<ItemOptionDto> itemOptionList, int itemOptionNo, String itemOptionName,
			int itemOptionPrice, int itemOptionStock, int itemOptionSoldCount, Date itemOptionCreDate,
			Date itemOptionModDate, String itemOptionState, int itemNo) {
		super();
		this.itemOptionList = itemOptionList;
		this.itemOptionNo = itemOptionNo;
		this.itemOptionName = itemOptionName;
		this.itemOptionPrice = itemOptionPrice;
		this.itemOptionStock = itemOptionStock;
		this.itemOptionSoldCount = itemOptionSoldCount;
		this.itemOptionCreDate = itemOptionCreDate;
		this.itemOptionModDate = itemOptionModDate;
		this.itemOptionState = itemOptionState;
		this.itemNo = itemNo;
	}
	public List<ItemOptionDto> getItemOptionList() {
		return itemOptionList;
	}
	public void setItemOptionList(List<ItemOptionDto> itemOptionList) {
		this.itemOptionList = itemOptionList;
	}
	public int getItemOptionNo() {
		return itemOptionNo;
	}
	public void setItemOptionNo(int itemOptionNo) {
		this.itemOptionNo = itemOptionNo;
	}
	public String getItemOptionName() {
		return itemOptionName;
	}
	public void setItemOptionName(String itemOptionName) {
		this.itemOptionName = itemOptionName;
	}
	public int getItemOptionPrice() {
		return itemOptionPrice;
	}
	public void setItemOptionPrice(int itemOptionPrice) {
		this.itemOptionPrice = itemOptionPrice;
	}
	public int getItemOptionStock() {
		return itemOptionStock;
	}
	public void setItemOptionStock(int itemOptionStock) {
		this.itemOptionStock = itemOptionStock;
	}
	public int getItemOptionSoldCount() {
		return itemOptionSoldCount;
	}
	public void setItemOptionSoldCount(int itemOptionSoldCount) {
		this.itemOptionSoldCount = itemOptionSoldCount;
	}
	public Date getItemOptionCreDate() {
		return itemOptionCreDate;
	}
	public void setItemOptionCreDate(Date itemOptionCreDate) {
		this.itemOptionCreDate = itemOptionCreDate;
	}
	public Date getItemOptionModDate() {
		return itemOptionModDate;
	}
	public void setItemOptionModDate(Date itemOptionModDate) {
		this.itemOptionModDate = itemOptionModDate;
	}
	public String getItemOptionState() {
		return itemOptionState;
	}
	public void setItemOptionState(String itemOptionState) {
		this.itemOptionState = itemOptionState;
	}
	public int getItemNo() {
		return itemNo;
	}
	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}
	
	
}
