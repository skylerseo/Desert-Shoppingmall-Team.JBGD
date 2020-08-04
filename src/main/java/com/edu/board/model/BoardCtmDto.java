package com.edu.board.model;

import java.util.Date;

public class BoardCtmDto {

	private String customerId = "";
	private int customerNo = 0;

	private int boardNo = 0;
	private String boardTitle = "";
	private String boardContent = "";
	private String boardOriginalImg = "";
	private String boardStoredImg = "";
	private int boardImgSize = 0;
	private String boardViewCount = "";
	private int rcount = 0;
	private Date boardCreDate = null;
	private Date boardModDate = null;

	public BoardCtmDto() {
		super();
	}



	public BoardCtmDto(String customerId, int customerNo, int boardNo, String boardTitle, String boardContent,
			String boardOriginalImg, String boardStoredImg, int boardImgSize, String boardViewCount, Date boardCreDate,
			Date boardModDate) {
		super();
		this.customerId = customerId;
		this.customerNo = customerNo;
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardOriginalImg = boardOriginalImg;
		this.boardStoredImg = boardStoredImg;
		this.boardImgSize = boardImgSize;
		this.boardViewCount = boardViewCount;
		this.boardCreDate = boardCreDate;
		this.boardModDate = boardModDate;

	}



	public BoardCtmDto(String boardTitle, String boardContent) {
		super();
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
	}

	public BoardCtmDto(String customerId, int boardNo, String boardTitle, String boardViewCount, Date boardCreDate) {
		super();
		this.customerId = customerId;
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardViewCount = boardViewCount;
		this.boardCreDate = boardCreDate;
	}

	public BoardCtmDto(String customerId, int customerNo, int boardNo, String boardTitle, String boardContent,
			String boardOriginalImg, String boardStoredImg, int boardImgSize, String boardViewCount, int rcount,
			Date boardCreDate, Date boardModDate) {
		super();
		this.customerId = customerId;
		this.customerNo = customerNo;
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardOriginalImg = boardOriginalImg;
		this.boardStoredImg = boardStoredImg;
		this.boardImgSize = boardImgSize;
		this.boardViewCount = boardViewCount;
		this.rcount = rcount;
		this.boardCreDate = boardCreDate;
		this.boardModDate = boardModDate;
	}



	public int getCustomerNo() {
		return customerNo;
	}

	public void setCustomerNo(int customerNo) {
		this.customerNo = customerNo;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getBoardOriginalImg() {
		return boardOriginalImg;
	}

	public void setBoardOriginalImg(String boardOriginalImg) {
		this.boardOriginalImg = boardOriginalImg;
	}

	public String getBoardStoredImg() {
		return boardStoredImg;
	}

	public void setBoardStoredImg(String boardStoredImg) {
		this.boardStoredImg = boardStoredImg;
	}

	public int getBoardImgSize() {
		return boardImgSize;
	}

	public void setBoardImgSize(int boardImgSize) {
		this.boardImgSize = boardImgSize;
	}

	public String getBoardViewCount() {
		return boardViewCount;
	}

	public void setBoardViewCount(String boardViewCount) {
		this.boardViewCount = boardViewCount;
	}

	public int getRcount() {
		return rcount;
	}

	public void setRcount(int rcount) {
		this.rcount = rcount;
	}
	public Date getBoardCreDate() {
		return boardCreDate;
	}

	public void setBoardCreDate(Date boardCreDate) {
		this.boardCreDate = boardCreDate;
	}

	public Date getBoardModDate() {
		return boardModDate;
	}

	public void setBoardModDate(Date boardModDate) {
		this.boardModDate = boardModDate;
	}





	@Override
	public String toString() {
		return "BoardCtmDto [customerId=" + customerId + ", customerNo=" + customerNo + ", boardNo=" + boardNo
				+ ", boardTitle=" + boardTitle + ", boardContent=" + boardContent + ", boardOriginalImg="
				+ boardOriginalImg + ", boardStoredImg=" + boardStoredImg + ", boardImgSize=" + boardImgSize
				+ ", boardViewCount=" + boardViewCount + ", boardCreDate=" + boardCreDate + ", boardModDate="
				+ boardModDate + "]";
	}

	
	
	

}
