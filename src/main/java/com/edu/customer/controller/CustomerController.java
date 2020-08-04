package com.edu.customer.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.edu.customer.model.CustomerDto;
import com.edu.customer.service.CustomerService;
import com.edu.shop.sale.model.SaleDto;

@Controller
public class CustomerController {
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);

	@Autowired
	private CustomerService customerService;
	
	//로그인 화면으로 이동
		@RequestMapping(value="/login.do", method=RequestMethod.GET)
		public String login (HttpSession session, Model model, HttpServletRequest request) {
			logger.info("Welcome CustomerController login! ");
			
			String referer = (String)session.getAttribute("redirect");
			if (referer == null) {
				referer = request.getHeader("Referer");
				session.setAttribute("redirect", referer);
			}
			
			System.out.println(referer);
			
			return "customer/LoginForm";
		}
		
	//로그인 컨트롤러
	@RequestMapping(value="/loginCtr.do", method=RequestMethod.POST)
	public String loginStr (String customerId, String customerPwd,
			HttpSession session, Model model) {
		logger.info("Welcome CustomerController loginCtr! {}, {}", customerId, customerPwd);
			
		CustomerDto customerDto = customerService.customerExist(customerId, customerPwd);
		String referer = (String)session.getAttribute("redirect");
		String viewUrl = "";
		
		if (customerDto == null) {
			viewUrl = "/customer/LoginFail";
		}else if (customerDto.getCustomerId().equals("admin")) {
			session.setAttribute("customer", customerDto);
			viewUrl = "/common/AdminMain";
		}else if (customerDto != null && customerDto.getCustomerId() != "admin") {
			session.setAttribute("customer", customerDto);
			
			if (referer !=null) {
				viewUrl = "redirect:" + referer;
			}else {
				viewUrl = "redirect:/itemListCtm.do";
			}
			session.removeAttribute("redirect");
		}
		
		return viewUrl;
	}
	
	//로그아웃
	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public String logout (HttpSession session, Model model) {
		logger.info("Welcome CustomerController logout! ");
		
		//session 파기
		session.invalidate();
		
		return "redirect:/itemListCtm.do";
	}
	
	//회원가입 화면으로 이동
	@RequestMapping(value="/customerAdd.do", method=RequestMethod.GET)
	public String memberAdd (HttpSession session, Model model) {
		logger.info("Welcome CustomerController customerAdd! ");
		
		return "customer/CustomerAddForm";
	}
	
	//회원가입 컨트롤러
	@RequestMapping(value="/customerAddCtr.do", method=RequestMethod.POST)
	public String memberAddCtr (CustomerDto customerDto, Model model) {
		logger.info("Welcome CustomerController customerAddCtr! {} " + customerDto);
		
		customerService.customerInsertOne(customerDto);
		
		return "customer/CustomerAddSuccess";
	}
	
	// 아이디 중복체크 컨트롤러
	@RequestMapping(value="/customerIdOverlapCheckCtr.do", method=RequestMethod.POST)
	public String customerIdOverlapCheckCtr (CustomerDto customerDto, Model model) {
		logger.info("Welcome CustomerController customerIdOverlapCheckCtr! {} " + customerDto);
		
		CustomerDto customerDtoCheck = customerService.customerIdOverlapCheck(customerDto);
		
		if (customerDtoCheck == null) { //성공
			model.addAttribute("state", "pass");
		}else if (customerDtoCheck != null) { //실패
			model.addAttribute("state", "fail");
		}
		
		model.addAttribute("customerDto", customerDto);
		
		return "customer/CustomerAddForm";
	}
	
	// 회원정보 수정하기로 이동
	@RequestMapping(value="/customerUpdate.do", method=RequestMethod.GET)
	public String customerUpdate (HttpSession session, Model model) {
		logger.info("Welcome CustomerController customerUpdate! ");
		
		CustomerDto customerDto = (CustomerDto)session.getAttribute("customer");
		
		CustomerDto customerDtoNo = customerService.customerSelectOne(customerDto.getCustomerNo());
		
		model.addAttribute("customerDto", customerDtoNo);
		
		return "customer/CustomerUpdateForm";
	}
	
	// 회원정보 수정 컨트롤러
		@RequestMapping(value="/customerUpdateCtr.do", method=RequestMethod.POST)
		public String customerUpdateCtr (HttpSession session, CustomerDto customerDto
				, Model model) throws Exception {
			logger.info("Welcome CustomerController customerUpdateCtr! {} : : {}"
				, customerDto);
			
			CustomerDto sessionCustomerDto = 
					(CustomerDto)session.getAttribute("customer");
			customerDto.setCustomerNo(sessionCustomerDto.getCustomerNo());
			customerService.customerUpdateOne(customerDto);
			
			CustomerDto newCustomerDto = 
					customerService.customerSelectOne(customerDto.getCustomerNo());
			
			session.removeAttribute("customer");
			session.setAttribute("customer", newCustomerDto);
			
			return "customer/CustomerUpdateSuccess";
		}
		
		//마이페이지로 이동
		@RequestMapping(value="/myPage.do", method= RequestMethod.GET)
		public String myPage (HttpSession session, Model model) {
			logger.info("Welcome CustomerController MyPageView! ");
			
			CustomerDto customerDto = (CustomerDto)session.getAttribute("customer");
			
			CustomerDto customerDtoNo = customerService.customerSelectOne(customerDto.getCustomerNo());
			
			System.out.println(customerDtoNo.getCustomerName());
			
			model.addAttribute("customerDto", customerDtoNo);
			
			return "customer/MyPageView";
		}
		
		//관리자 페이지로 이동
		@RequestMapping(value="/adminMain.do", method= RequestMethod.GET)
		public String adminMain (HttpSession session, Model model) {
			logger.info("Welcome CustomerController AdminMainView! ");
			
			return "common/AdminMain";
		}
		
		//캐쉬 충전하기 화면으로 이동
		@RequestMapping(value="/moneyUpdate.do", method=RequestMethod.POST)
		public String moneyCharge (HttpSession session, Model model, HttpServletRequest request, SaleDto saleDto) {
			logger.info("Welcome CustomerController MoneyCharge! ");
			
			String referer = request.getHeader("Referer");
			System.out.println(referer);
			if (referer.equals("http://localhost:9080/jbgd/myPage.do") == false) {
				session.setAttribute("redirect", referer);
				session.setAttribute("saleDto", saleDto);
			}
			
			CustomerDto customerDto = (CustomerDto)session.getAttribute("customer");
			CustomerDto customerDtoNo = customerService.customerMoneySelectOne(customerDto.getCustomerNo());
			model.addAttribute("customerDto", customerDtoNo);
			
			return "customer/MoneyUpdate";
		}	
		
		//캐쉬 충전 컨트롤러
		@RequestMapping(value="/moneyUpdateCtr.do", method=RequestMethod.POST)
		public String moneyChargeCtr (HttpSession session, Model model
				, CustomerDto customerDto) {
			CustomerDto sessionCustomerDto = (CustomerDto)session.getAttribute("customer");
			customerDto.setCustomerNo(sessionCustomerDto.getCustomerNo());
			customerService.customerMoneyUpdateOne(customerDto);
			
			CustomerDto newCustomerDto = customerService.customerSelectOne(customerDto.getCustomerNo());
			
			session.removeAttribute("customer");
			session.setAttribute("customer", newCustomerDto);

			return "redirect:/moneyUpdateFin.do";
		}
		
		//캐쉬 충전완료 화면으로 이동
		@RequestMapping(value="/moneyUpdateFin.do", method=RequestMethod.GET)
		public String moneyChargeFin (HttpSession session, Model model
				, CustomerDto customerDto) {
			logger.info("Welcome CustomerController moneyChargeFin! ");
			
			customerDto = customerService.customerSelectOne(customerDto.getCustomerNo());
			
			model.addAttribute("customerDto", customerDto);
			
			return "customer/MoneyUpdateFin";
		}	
		
		
		//아이디찾기 화면으로 이동
		@RequestMapping(value="/idFind.do", method=RequestMethod.GET)
		public String idFind (HttpSession session, Model model) {
			logger.info("Welcome CustomerController IdFindForm! ");
			
			return "customer/IdFindForm";
		}
		
		// 아이디 찾기 결과 화면으로 이동
		@RequestMapping(value="/idFindResult.do", method=RequestMethod.GET)
		public String idFindFin (HttpSession session, Model model
				, String customerName, String customerEmail) {
			logger.info("Welcome CustomerController pwdReset! ");
			
			CustomerDto customerDto = customerService.customerIdFindOne(customerName, customerEmail);
			
			String viewUrl = "";
			
			if (customerDto != null) {
				model.addAttribute("customerDto", customerDto);
				viewUrl = "/customer/IdFindResult";
			}else{
				viewUrl = "/customer/IdFindFail";
			}
			
			return viewUrl;
		}


		
		//비밀번호 찾기 화면으로 이동
		@RequestMapping(value="/pwdFind.do", method=RequestMethod.GET)
		public String pwdFind (HttpSession session, Model model) {
			logger.info("Welcome CustomerController PwdFindForm! ");
				
			return "customer/PwdFindForm";
		}	
		
		//비밀번호 재설정 화면으로 이동
		@RequestMapping(value="/pwdReset.do", method=RequestMethod.POST)
		public String pwdReset (HttpSession session, Model model
				, CustomerDto customerDto) {
			logger.info("Welcome CustomerController pwdReset! ");
			
			customerDto = customerService.customerPwdFindOne(customerDto);
			
			String viewUrl = "";
			
			if (customerDto != null) {
				model.addAttribute("customerDto", customerDto);
				viewUrl = "/customer/PwdReset";
			}else{
				viewUrl = "/customer/PwdFindFail";
			}
			
			return viewUrl;
		}
		
		//비밀번호 재설정 컨트롤러
		@RequestMapping(value="/pwdResetCtr.do", method= {RequestMethod.GET, RequestMethod.POST})
		public String pwdResetCtr (HttpSession session, Model model
				, CustomerDto customerDto) throws Exception{
			logger.info("Welcome CustomerController pwdResetCtr! ");

			customerService.customerPwdResetOne(customerDto);
			
			model.addAttribute("customer", customerDto);
			
			return "customer/PwdFindSuccess";
		}
		
		
}
