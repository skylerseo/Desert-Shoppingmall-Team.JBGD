package com.edu.shop.sale.model;

import java.util.Date;

public class SaleDto {

	private int saleNo = 0;
	private String saleName = "";
	private String saleAddr = "";
	private String salePhone = "";
	private String saleComment = "";
	private Date saleDate = null;
	private int salePrice = 0;
	private String saleState = "";
	private int customerNo = 0;
	public SaleDto() {
		super();
	}
	public SaleDto(int saleNo, String saleName, String saleAddr, String salePhone, String saleComment, Date saleDate,
			int salePrice, String saleState, int customerNo) {
		super();
		this.saleNo = saleNo;
		this.saleName = saleName;
		this.saleAddr = saleAddr;
		this.salePhone = salePhone;
		this.saleComment = saleComment;
		this.saleDate = saleDate;
		this.salePrice = salePrice;
		this.saleState = saleState;
		this.customerNo = customerNo;
	}
	public int getSaleNo() {
		return saleNo;
	}
	public void setSaleNo(int saleNo) {
		this.saleNo = saleNo;
	}
	public String getSaleName() {
		return saleName;
	}
	public void setSaleName(String saleName) {
		this.saleName = saleName;
	}
	public String getSaleAddr() {
		return saleAddr;
	}
	public void setSaleAddr(String saleAddr) {
		this.saleAddr = saleAddr;
	}
	public String getSalePhone() {
		return salePhone;
	}
	public void setSalePhone(String salePhone) {
		this.salePhone = salePhone;
	}
	public String getSaleComment() {
		return saleComment;
	}
	public void setSaleComment(String saleComment) {
		this.saleComment = saleComment;
	}
	public Date getSaleDate() {
		return saleDate;
	}
	public void setSaleDate(Date saleDate) {
		this.saleDate = saleDate;
	}
	public int getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}
	public String getSaleState() {
		return saleState;
	}
	public void setSaleState(String saleState) {
		this.saleState = saleState;
	}
	public int getCustomerNo() {
		return customerNo;
	}
	public void setCustomerNo(int customerNo) {
		this.customerNo = customerNo;
	}
	@Override
	public String toString() {
		return "SaleDto [saleNo=" + saleNo + ", saleName=" + saleName + ", saleAddr=" + saleAddr + ", salePhone="
				+ salePhone + ", saleComment=" + saleComment + ", saleDate=" + saleDate + ", salePrice=" + salePrice
				+ ", saleState=" + saleState + ", customerNo=" + customerNo + "]";
	}
	
	
}
