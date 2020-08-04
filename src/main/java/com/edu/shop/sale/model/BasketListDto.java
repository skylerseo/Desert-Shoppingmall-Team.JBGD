package com.edu.shop.sale.model;

import java.util.Date;

public class BasketListDto {

	private int basketNo = 0;
	private int itemNo = 0;
	private String itemName = "";
	private int basketItemVolume = 0;
	private Date basketCreDate = null;
	private Date basketModDate = null;
	private int itemOptionNo = 0;
	private String itemOptionName = "";
	private int itemOptionStock = 0;
	private String itemOptionState = "";
	private int itemPrice = 0;
	private int itemStock = 0;
	private String itemState = "";
	private int customerNo = 0;
	
	public BasketListDto() {
		super();
	}

	public BasketListDto(int basketNo, int itemNo, String itemName, int basketItemVolume, Date basketCreDate,
			Date basketModDate, int itemOptionNo, String itemOptionName, String itemOptionState, int itemPrice,
			int itemStock, String itemState, int customerNo) {
		super();
		this.basketNo = basketNo;
		this.itemNo = itemNo;
		this.itemName = itemName;
		this.basketItemVolume = basketItemVolume;
		this.basketCreDate = basketCreDate;
		this.basketModDate = basketModDate;
		this.itemOptionNo = itemOptionNo;
		this.itemOptionName = itemOptionName;
		this.itemOptionState = itemOptionState;
		this.itemPrice = itemPrice;
		this.itemStock = itemStock;
		this.itemState = itemState;
		this.customerNo = customerNo;
	}

	public int getBasketNo() {
		return basketNo;
	}
	public void setBasketNo(int basketNo) {
		this.basketNo = basketNo;
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
	public int getBasketItemVolume() {
		return basketItemVolume;
	}
	public void setBasketItemVolume(int basketItemVolume) {
		this.basketItemVolume = basketItemVolume;
	}
	public Date getBasketCreDate() {
		return basketCreDate;
	}
	public void setBasketCreDate(Date basketCreDate) {
		this.basketCreDate = basketCreDate;
	}
	public Date getBasketModDate() {
		return basketModDate;
	}
	public void setBasketModDate(Date basketModDate) {
		this.basketModDate = basketModDate;
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
	public int getItemOptionStock() {
		return itemOptionStock;
	}

	public void setItemOptionStock(int itemOptionStock) {
		this.itemOptionStock = itemOptionStock;
	}

	public String getItemOptionState() {
		return itemOptionState;
	}
	public void setItemOptionState(String itemOptionState) {
		this.itemOptionState = itemOptionState;
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

	public int getCustomerNo() {
		return customerNo;
	}
	public void setCustomerNo(int customerNo) {
		this.customerNo = customerNo;
	}
	
	
}
