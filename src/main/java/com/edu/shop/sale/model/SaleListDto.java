package com.edu.shop.sale.model;

import java.util.Date;

public class SaleListDto {

	private int saleNo = 0;
	private String itemName = "";
	private int count = 0;
	private int salePrice = 0;
	private Date saleDate = null;
	private String saleState = "";
	

	public SaleListDto() {
		super();
	}
	public SaleListDto(int saleNo, String itemName, int count, int salePrice, Date saleDate, String saleState) {
		super();
		this.saleNo = saleNo;
		this.itemName = itemName;
		this.count = count;
		this.salePrice = salePrice;
		this.saleDate = saleDate;
		this.saleState = saleState;
	}
	public int getSaleNo() {
		return saleNo;
	}
	public void setSaleNo(int saleNo) {
		this.saleNo = saleNo;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}
	public Date getSaleDate() {
		return saleDate;
	}
	public void setSaleDate(Date saleDate) {
		this.saleDate = saleDate;
	}
	public String getSaleState() {
		return saleState;
	}
	public void setSaleState(String saleState) {
		this.saleState = saleState;
	}
	
	
}
