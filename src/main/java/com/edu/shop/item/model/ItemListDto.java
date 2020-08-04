package com.edu.shop.item.model;

import java.util.Date;

public class ItemListDto {

	private int itemNo = 0;
	private String itemName = "";
	private int itemPrice = 0;
	private int itemStock = 0;
	private String itemState = "";
	private Date itemCreDate = null;
	private String itemStoredImgName = "";
	
	public ItemListDto() {
		super();
	}
	public ItemListDto(int itemNo, String itemName, int itemPrice, int itemStock, String itemState, Date itemCreDate,
			String itemStoredImgName) {
		super();
		this.itemNo = itemNo;
		this.itemName = itemName;
		this.itemPrice = itemPrice;
		this.itemStock = itemStock;
		this.itemState = itemState;
		this.itemCreDate = itemCreDate;
		this.itemStoredImgName = itemStoredImgName;
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
	public int getItemPrice() {
		return itemPrice;
	}
	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}
	public int getItemStock() {
		return itemStock;
	}
	public void setItemStock(int itemStock) {
		this.itemStock = itemStock;
	}
	public String getItemState() {
		return itemState;
	}
	public void setItemState(String itemState) {
		this.itemState = itemState;
	}
	public Date getItemCreDate() {
		return itemCreDate;
	}
	public void setItemCreDate(Date itemCreDate) {
		this.itemCreDate = itemCreDate;
	}
	public String getItemStoredImgName() {
		return itemStoredImgName;
	}
	public void setItemStoredImgName(String itemStoredImgName) {
		this.itemStoredImgName = itemStoredImgName;
	}
	
	
	
}
