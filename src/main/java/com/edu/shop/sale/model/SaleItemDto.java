package com.edu.shop.sale.model;

import java.util.List;

public class SaleItemDto {

	private List<SaleItemDto> saleItemList;
	private int saleNo = 0;
	private int itemNo = 0;
	private String itemName = "";
	private int itemOptionNo = 0;
	private String itemOptionName = "";
	private int saleItemVolume = 0;
	
	public SaleItemDto() {
		super();
	}
	public SaleItemDto(List<SaleItemDto> saleItemList, int saleNo, int itemNo, String itemName, int itemOptionNo,
			String itemOptionName, int saleItemVolume) {
		super();
		this.saleItemList = saleItemList;
		this.saleNo = saleNo;
		this.itemNo = itemNo;
		this.itemName = itemName;
		this.itemOptionNo = itemOptionNo;
		this.itemOptionName = itemOptionName;
		this.saleItemVolume = saleItemVolume;
	}
	public List<SaleItemDto> getSaleItemList() {
		return saleItemList;
	}
	public void setSaleItemList(List<SaleItemDto> saleItemList) {
		this.saleItemList = saleItemList;
	}
	public int getSaleNo() {
		return saleNo;
	}
	public void setSaleNo(int saleNo) {
		this.saleNo = saleNo;
	}
	public int getItemNo() {
		return itemNo;
	}
	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public int getSaleItemVolume() {
		return saleItemVolume;
	}
	public void setSaleItemVolume(int saleItemVolume) {
		this.saleItemVolume = saleItemVolume;
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
	
	
}
