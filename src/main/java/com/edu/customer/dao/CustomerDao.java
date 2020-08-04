package com.edu.customer.dao;

import java.util.List;
import java.util.Map;

import com.edu.customer.model.CustomerDto;

public interface CustomerDao {
	
	//회원 존재 확인
	public CustomerDto customerExist
		(String customerId, String customerPwd);
	
	//회원 추가
	public int customerInsertOne(CustomerDto customerDto);

	//아이디 중복체크
	public CustomerDto customerIdOverlapCheck(CustomerDto customerDto);
	
	//회원 상세 정보
	public CustomerDto customerSelectOne(int customerNo);
	
	//회원 캐쉬 조회
	public CustomerDto customerMoneySelectOne(int customerNo);
	
	//회원 캐쉬 충전하기
	public void customerMoneyUpdateOne(CustomerDto customerDto);
	
	//회원 캐쉬 사용하기
	public void customerUseMoneyUpdateOne(CustomerDto customerDto);
	
	//회원 정보 수정
	public int customerUpdateOne(CustomerDto customerDto);
	
	//회원 아이디 찾기
	public CustomerDto customerIdFindOne(String customerName, String customerEmail);
	
	//회원 비밀번호 찾기
	public CustomerDto customerPwdFindOne(CustomerDto customerDto);
	
	//회원 비밀번호 리셋
	public int customerPwdResetOne(CustomerDto customerDto);
}
