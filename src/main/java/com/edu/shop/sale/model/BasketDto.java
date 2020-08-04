package com.edu.shop.sale.model;

import java.util.List;

public class BasketDto {

	private List<BasketDto> basketList;
	private int basketNo = 0;
	private int itemNo = 0;
	private int basketItemVolume = 0;
	private int itemOptionNo = 0;
	private int customerNo = 0;
	public BasketDto() {
		super();
	}
	public BasketDto(List<BasketDto> basketList, int basketNo, int itemNo, int basketItemVolume, int itemOptionNo,
			int customerNo) {
		super();
		this.basketList = basketList;
		this.basketNo = basketNo;
		this.itemNo = itemNo;
		this.basketItemVolume = basketItemVolume;
		this.itemOptionNo = itemOptionNo;
		this.customerNo = customerNo;
	}
	public List<BasketDto> getBasketList() {
		return basketList;
	}
	public void setBasketList(List<BasketDto> basketList) {
		this.basketList = basketList;
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
	public int getBasketItemVolume() {
		return basketItemVolume;
	}
	public void setBasketItemVolume(int basketItemVolume) {
		this.basketItemVolume = basketItemVolume;
	}
	public int getItemOptionNo() {
		return itemOptionNo;
	}
	public void setItemOptionNo(int itemOptionNo) {
		this.itemOptionNo = itemOptionNo;
	}
	public int getCustomerNo() {
		return customerNo;
	}
	public void setCustomerNo(int customerNo) {
		this.customerNo = customerNo;
	}
	
	
}
