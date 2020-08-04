package com.edu.customer.model;

import java.util.Date;

public class CustomerDto {
	
	private int customerNo = 0;
	private String customerId = "";
	private String customerPwd = "";
	private String customerName = "";
	private String customerEmail = "";
	private String customerAddr = "";
	private String customerPhone = "";
	private Date customerCreDate = null;
	private Date customerModDate = null;
	private int customerMoney = 0;
	
	public CustomerDto() {
		super();
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

	public String getCustomerPwd() {
		return customerPwd;
	}

	public void setCustomerPwd(String customerPwd) {
		this.customerPwd = customerPwd;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCustomerEmail() {
		return customerEmail;
	}

	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}

	public String getCustomerAddr() {
		return customerAddr;
	}

	public void setCustomerAddr(String customerAddr) {
		this.customerAddr = customerAddr;
	}

	public String getCustomerPhone() {
		return customerPhone;
	}

	public void setCustomerPhone(String customerPhone) {
		this.customerPhone = customerPhone;
	}

	public Date getCustomerCreDate() {
		return customerCreDate;
	}

	public void setCustomerCreDate(Date customerCreDate) {
		this.customerCreDate = customerCreDate;
	}

	public Date getCustomerModDate() {
		return customerModDate;
	}

	public void setCustomerModDate(Date customerModDate) {
		this.customerModDate = customerModDate;
	}

	public int getCustomerMoney() {
		return customerMoney;
	}

	public void setCustomerMoney(int customerMoney) {
		this.customerMoney = customerMoney;
	}

	public CustomerDto(int customerNo, String customerId, String customerPwd) {
		super();
		this.customerNo = customerNo;
		this.customerId = customerId;
		this.customerPwd = customerPwd;
	}

	public CustomerDto(String customerId, String customerName, String customerEmail) {
		super();
		this.customerId = customerId;
		this.customerName = customerName;
		this.customerEmail = customerEmail;
	}

	public CustomerDto(String customerId, String customerPwd, String customerName, String customerEmail) {
		super();
		this.customerId = customerId;
		this.customerPwd = customerPwd;
		this.customerName = customerName;
		this.customerEmail = customerEmail;
	}

	public CustomerDto(int customerNo, String customerId, String customerPwd, String customerName, String customerEmail) {
		super();
		this.customerNo = customerNo;
		this.customerId = customerId;
		this.customerPwd = customerPwd;
		this.customerName = customerName;
		this.customerEmail = customerEmail;
	}
	
	public CustomerDto(String customerPwd, String customerName, String customerEmail, String customerAddr, String customerPhone) {
		super();
		this.customerPwd = customerPwd;
		this.customerName = customerName;
		this.customerEmail = customerEmail;
		this.customerAddr = customerAddr;
		this.customerPhone = customerPhone;
	}

	public CustomerDto(String customerPwd, String customerName, String customerEmail, String customerAddr, String customerPhone,
			Date customerModDate) {
		super();
		this.customerPwd = customerPwd;
		this.customerName = customerName;
		this.customerEmail = customerEmail;
		this.customerAddr = customerAddr;
		this.customerPhone = customerPhone;
		this.customerModDate = customerModDate;
	}

	public CustomerDto(String customerId, String customerPwd, String customerName, String customerEmail, String customerAddr, String customerPhone) {
		super();
		this.customerId = customerId;
		this.customerPwd = customerPwd;
		this.customerName = customerName;
		this.customerEmail = customerEmail;
		this.customerAddr = customerAddr;
		this.customerPhone = customerPhone;
	}

	public CustomerDto(String customerPwd, String customerName, String customerEmail, String customerAddr, String customerPhone, Date customerCreDate,
			Date customerModDate) {
		super();
		this.customerPwd = customerPwd;
		this.customerName = customerName;
		this.customerEmail = customerEmail;
		this.customerAddr = customerAddr;
		this.customerPhone = customerPhone;
		this.customerCreDate = customerCreDate;
		this.customerModDate = customerModDate;
	}

	public CustomerDto(int customerNo, String customerId, String customerPwd, String customerName, String customerEmail, String customerAddr,
			String customerPhone, Date customerCreDate, Date customerModDate, int customerMoney) {
		super();
		this.customerNo = customerNo;
		this.customerId = customerId;
		this.customerPwd = customerPwd;
		this.customerName = customerName;
		this.customerEmail = customerEmail;
		this.customerAddr = customerAddr;
		this.customerPhone = customerPhone;
		this.customerCreDate = customerCreDate;
		this.customerModDate = customerModDate;
		this.customerMoney = customerMoney;
	}

	@Override
	public String toString() {
		return "CustomerDto [customerNo=" + customerNo + ", customerId=" + customerId + ", customerPwd=" + customerPwd + ", customerName=" + customerName
				+ ", customerEmail=" + customerEmail + ", customerAddr=" + customerAddr + ", customerPhone=" + customerPhone + ", customerCreDate="
				+ customerCreDate + ", customerModDate=" + customerModDate + ", customerMoney=" + customerMoney + "]";
	}
	
}
