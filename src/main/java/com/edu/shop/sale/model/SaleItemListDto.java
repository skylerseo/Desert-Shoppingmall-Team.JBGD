package com.edu.shop.sale.model;

public class SaleItemListDto {

	private int saleNo = 0;
	private int itemNo = 0;
	private String itemName = "";
	private int itemOptionNo = 0;
	private String itemOptionName = "";
	private int itemPrice = 0;
	private int basketItemVolume = 0;
	private int saleItemVolume = 0;
	
	public SaleItemListDto() {
		super();
	}
	public SaleItemListDto(int itemNo, int itemOptionNo) {
		super();
		this.itemNo = itemNo;
		this.itemOptionNo = itemOptionNo;
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
	public int getItemPrice() {
		return itemPrice;
	}
	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}
	public int getbasketItemVolume() {
		return basketItemVolume;
	}
	public void setbasketItemVolume(int basketItemVolume) {
		this.basketItemVolume = basketItemVolume;
	}
	public int getSaleItemVolume() {
		return saleItemVolume;
	}
	public void setSaleItemVolume(int saleItemVolume) {
		this.saleItemVolume = saleItemVolume;
	}
	
	
	
}
