package com.edu.shop.item.model;

import java.util.Date;

public class ItemDto {

	private int itemNo = 0;
	private String itemName = "";
	private int itemPrice = 0;
	private int itemStock = 0;
	private String itemContent = "";
	private Date itemCreDate = null;
	private Date itemModDate = null;
	private int itemViewCount = 0;
	private int itemSoldCount = 0;
	private String itemState = "";
	
	public ItemDto() {
		super();
	}
	
	
	public ItemDto(int itemNo, String itemName, int itemPrice, int itemStock, String itemContent) {
		super();
		this.itemNo = itemNo;
		this.itemName = itemName;
		this.itemPrice = itemPrice;
		this.itemStock = itemStock;
		this.itemContent = itemContent;
	}
	public ItemDto(String itemName, int itemPrice, int itemStock, String itemContent, String itemState) {
		super();
		this.itemName = itemName;
		this.itemPrice = itemPrice;
		this.itemStock = itemStock;
		this.itemContent = itemContent;
		this.itemState = itemState;
	}
	public ItemDto(int itemNo, int itemStock) {
		super();
		this.itemNo = itemNo;
		this.itemStock = itemStock;
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
	public String getItemContent() {
		return itemContent;
	}
	public void setItemContent(String itemContent) {
		this.itemContent = itemContent;
	}
	public Date getItemCreDate() {
		return itemCreDate;
	}
	public void setItemCreDate(Date itemCreDate) {
		this.itemCreDate = itemCreDate;
	}
	public Date getItemModDate() {
		return itemModDate;
	}
	public void setItemModDate(Date itemModDate) {
		this.itemModDate = itemModDate;
	}
	public int getItemViewCount() {
		return itemViewCount;
	}
	public void setItemViewCount(int itemViewCount) {
		this.itemViewCount = itemViewCount;
	}
	public int getItemSoldCount() {
		return itemSoldCount;
	}
	public void setItemSoldCount(int itemSoldCount) {
		this.itemSoldCount = itemSoldCount;
	}
	public String getItemState() {
		return itemState;
	}
	public void setItemState(String itemState) {
		this.itemState = itemState;
	}
	
	
	
}
