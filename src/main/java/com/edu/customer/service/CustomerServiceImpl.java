package com.edu.customer.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.customer.dao.CustomerDao;
import com.edu.customer.model.CustomerDto;

@Service
public class CustomerServiceImpl implements CustomerService {
	private static final Logger log = LoggerFactory.getLogger(CustomerServiceImpl.class);
	
	@Autowired
	public CustomerDao customerDao;
	
	@Override
	public CustomerDto customerExist
		(String customerId, String customerPwd) {
		// TODO Auto-generated method stub
		
		return customerDao.customerExist(customerId, customerPwd);
	}

	@Override
	public void customerInsertOne(CustomerDto customerDto) {
		// TODO Auto-generated method stub
		
		customerDao.customerInsertOne(customerDto);
	}


	@Override
	public CustomerDto customerSelectOne(int customerNo) {
		// TODO Auto-generated method stub
		
		return customerDao.customerSelectOne(customerNo);
	}

	@Override
	public int customerUpdateOne(CustomerDto customerDto) 
			throws Exception {
		// TODO Auto-generated method stub
//		int resultNum = 0;
		
		return customerDao.customerUpdateOne(customerDto);
	}

	@Override
	public CustomerDto customerMoneySelectOne(int customerNo) {
		// TODO Auto-generated method stub

		CustomerDto customerDto = customerDao.customerMoneySelectOne(customerNo);

		return customerDto;
	}

	@Override
	public void customerMoneyUpdateOne(CustomerDto customerDto){
		// TODO Auto-generated method stub
		
		customerDao.customerMoneyUpdateOne(customerDto);
	}

	@Override
	public CustomerDto customerIdFindOne(String customerName, String customerEmail) {
		// TODO Auto-generated method stub
		return customerDao.customerIdFindOne(customerName, customerEmail);
	}

	@Override
	public CustomerDto customerPwdFindOne(CustomerDto customerDto) {
		// TODO Auto-generated method stub
		return customerDao.customerPwdFindOne(customerDto);
	}

	@Override
	public int customerPwdResetOne(CustomerDto customerDto) throws Exception {
		// TODO Auto-generated method stub

		return customerDao.customerPwdResetOne(customerDto);
	}

	@Override
	public void customerUseMoneyUpdateOne(CustomerDto customerDto) {
		// TODO Auto-generated method stub
		customerDao.customerUseMoneyUpdateOne(customerDto);
	}

	@Override
	public CustomerDto customerIdOverlapCheck(CustomerDto customerDto) {
		// TODO Auto-generated method stub
		return customerDao.customerIdOverlapCheck(customerDto);
	}

}
