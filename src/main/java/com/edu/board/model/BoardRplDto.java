package com.edu.board.model;

import java.util.Date;

public class BoardRplDto {
	private String customerId = "";
	private int customerNo 	= 0;
	
	private int boardNo = 0; 		
	
	private int replyNo = 0; 		
	private String replyContent = "";  	
	private Date replyCreDate = null;
	
	
	
	public BoardRplDto() {
		super();
	}



	public BoardRplDto(String customerId, int customerNo, int boardNo, int replyNo, String replyContent,
			Date replyCreDate, Date replyModDate) {
		super();
		this.customerId = customerId;
		this.customerNo = customerNo;
		this.boardNo = boardNo;
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.replyCreDate = replyCreDate;
	}

	


	public BoardRplDto(int customerNo, int boardNo, int replyNo, String replyContent) {
		super();
		this.customerNo = customerNo;
		this.boardNo = boardNo;
		this.replyNo = replyNo;
		this.replyContent = replyContent;
	}



	public String getCustomerId() {
		return customerId;
	}



	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}



	public int getCustomerNo() {
		return customerNo;
	}



	public void setCustomerNo(int customerNo) {
		this.customerNo = customerNo;
	}



	public int getBoardNo() {
		return boardNo;
	}



	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}



	public int getReplyNo() {
		return replyNo;
	}



	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}



	public String getReplyContent() {
		return replyContent;
	}



	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}



	public Date getReplyCreDate() {
		return replyCreDate;
	}



	public void setReplyCreDate(Date replyCreDate) {
		this.replyCreDate = replyCreDate;
	}



	@Override
	public String toString() {
		return "BoardRplDto [customerId=" + customerId + ", customerNo=" + customerNo + ", boardNo=" + boardNo
				+ ", replyNo=" + replyNo + ", replyContent=" + replyContent + ", replyCreDate=" + replyCreDate + "]";
	}


	

}
