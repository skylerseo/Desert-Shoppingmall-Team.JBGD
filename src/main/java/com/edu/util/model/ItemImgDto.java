package com.edu.util.model;

import java.util.Date;

public class ItemImgDto {

	private int itemImgNo = 0;
	private String itemOriginalImgName = "";
	private String itemStoredImgName = "";
	private int itemImgSize = 0;
	private String itemImgThumbnail = "";
	private Date itemImgCreDate = null;
	private Date itemImgModDate = null;
	private int itemNo = 0;
	
	
	
	public ItemImgDto(int itemImgNo, String itemOriginalImgName, String itemStoredImgName, String itemImgThumbnail) {
		super();
		this.itemImgNo = itemImgNo;
		this.itemOriginalImgName = itemOriginalImgName;
		this.itemStoredImgName = itemStoredImgName;
		this.itemImgThumbnail = itemImgThumbnail;
	}
	public ItemImgDto(int itemImgNo, String itemStoredImgName) {
		super();
		this.itemImgNo = itemImgNo;
		this.itemStoredImgName = itemStoredImgName;
	}
	public ItemImgDto() {
		super();
	}
	public int getItemImgNo() {
		return itemImgNo;
	}
	public void setItemImgNo(int itemImgNo) {
		this.itemImgNo = itemImgNo;
	}
	public String getItemOriginalImgName() {
		return itemOriginalImgName;
	}
	public void setItemOriginalImgName(String itemOriginalImgName) {
		this.itemOriginalImgName = itemOriginalImgName;
	}
	public String getItemStoredImgName() {
		return itemStoredImgName;
	}
	public void setItemStoredImgName(String itemStoredImgName) {
		this.itemStoredImgName = itemStoredImgName;
	}
	public int getItemImgSize() {
		return itemImgSize;
	}
	public void setItemImgSize(int itemImgSize) {
		this.itemImgSize = itemImgSize;
	}
	public String getItemImgThumbnail() {
		return itemImgThumbnail;
	}
	public void setItemImgThumbnail(String itemImgThumbnail) {
		this.itemImgThumbnail = itemImgThumbnail;
	}
	public Date getItemImgCreDate() {
		return itemImgCreDate;
	}
	public void setItemImgCreDate(Date itemImgCreDate) {
		this.itemImgCreDate = itemImgCreDate;
	}
	public Date getItemImgModDate() {
		return itemImgModDate;
	}
	public void setItemImgModDate(Date itemImgModDate) {
		this.itemImgModDate = itemImgModDate;
	}
	public int getItemNo() {
		return itemNo;
	}
	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}
	
	
	
}
