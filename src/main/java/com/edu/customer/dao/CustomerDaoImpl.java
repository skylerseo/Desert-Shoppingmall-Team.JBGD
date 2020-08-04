package com.edu.customer.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.customer.model.CustomerDto;

@Repository
public class CustomerDaoImpl implements CustomerDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "com.edu.customer.";
	
	public CustomerDto customerExist(String customerId, String customerPwd) {
		// TODO Auto-generated method stub
		
		HashMap<String, Object> paramMap = new HashMap<>();
		paramMap.put("customerId", customerId);
		paramMap.put("customerPwd", customerPwd);
		
		return sqlSession.selectOne(namespace + "customerExist", paramMap);
	}
	
	@Override
	public int customerInsertOne(CustomerDto customerDto) {
		// TODO Auto-generated method stub
		
		return sqlSession.insert(namespace + "customerInsertOne", customerDto);
	}

	@Override
	public CustomerDto customerSelectOne(int customerNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "customerSelectOne", customerNo);
	}

	@Override
	public int customerUpdateOne(CustomerDto customerDto) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "customerUpdateOne", customerDto);
	}

	@Override
	public CustomerDto customerMoneySelectOne(int customerNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "customerMoneySelectOne", customerNo);
	}

	@Override
	public void customerMoneyUpdateOne(CustomerDto customerDto) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace + "customerMoneyUpdateOne", customerDto);
	}

	@Override
	public CustomerDto customerIdFindOne(String customerName, String customerEmail) {
		// TODO Auto-generated method stub
		
		HashMap<String, Object> paramMap = new HashMap<>();
		paramMap.put("customerName", customerName);
		paramMap.put("customerEmail", customerEmail);
		
		return sqlSession.selectOne(namespace + "customerIdFindOne", paramMap);
		
//		return sqlSession.selectOne(namespace + "customerIdFindOne", customerName, customerEmail);
	}

	@Override
	public CustomerDto customerPwdFindOne(CustomerDto customerDto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "customerPwdFindOne", customerDto);
	}

	@Override
	public int customerPwdResetOne(CustomerDto customerDto) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "customerPwdResetOne", customerDto);
	}

	@Override
	public void customerUseMoneyUpdateOne(CustomerDto customerDto) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace + "customerUseMoneyUpdateOne", customerDto);
	}

	@Override
	public CustomerDto customerIdOverlapCheck(CustomerDto customerDto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "customerIdOverlapCheck", customerDto);
	}


}
