package com.edu.shop.sale.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.edu.customer.model.CustomerDto;
import com.edu.customer.service.CustomerService;
import com.edu.shop.item.service.ItemService;
import com.edu.shop.sale.model.BasketDto;
import com.edu.shop.sale.model.BasketListDto;
import com.edu.shop.sale.model.SaleDto;
import com.edu.shop.sale.model.SaleItemDto;
import com.edu.shop.sale.model.SaleItemListDto;
import com.edu.shop.sale.model.SaleListDto;
import com.edu.shop.sale.service.SaleService;
import com.edu.util.CommonUtils;
import com.edu.util.Paging;

@Controller
public class SaleController {
	
	private static final Logger logger = LoggerFactory.getLogger(SaleController.class);
	
	@Autowired
	private SaleService saleService;
	@Autowired
	private ItemService itemService;
	@Autowired
	private CustomerService customerService;

	@RequestMapping(value="/itemDirectBuy.do", method=RequestMethod.GET)
	public String itemDirectBuy(HttpSession session, Model model, int itemNo, int basketItemVolume, int itemOptionNo) {
		logger.info("Welcome itemDirectBuy login! ");
		
		SaleItemListDto saleItemListDto = new SaleItemListDto();

		List<SaleItemListDto> saleItemList = new ArrayList<SaleItemListDto>();
		saleItemListDto = saleService.itemSaleSelectOne(itemNo, itemOptionNo);
		saleItemListDto.setbasketItemVolume(basketItemVolume);
		saleItemListDto.setItemPrice(basketItemVolume * saleItemListDto.getItemPrice());
		
		saleItemList.add(saleItemListDto);
		
		
		SaleDto saleDto = (SaleDto)session.getAttribute("saleDto");
		if (saleDto != null) {
			session.removeAttribute("saleDto");
			session.removeAttribute("redirect");
			model.addAttribute("saleDto", saleDto);
		}
		
		model.addAttribute("saleOption", "direct");
		model.addAttribute("saleItemList", saleItemList);
//		CostomerService 회원정보조회
		
		return "shop/sale/ItemBuy";
	}
	
	@RequestMapping(value="/basketBuy.do", method=RequestMethod.GET)
	public String basketBuy(HttpSession session, Model model) {
		logger.info("Welcome itemBuy login! ");
		
		CustomerDto customerDto = (CustomerDto)session.getAttribute("customer");
		
		List<BasketListDto> saleItemList = new ArrayList<BasketListDto>();
		saleItemList = saleService.basketSelectList(customerDto.getCustomerNo());
		
		SaleDto saleDto = (SaleDto)session.getAttribute("saleDto");
		if (saleDto != null) {
			session.removeAttribute("saleDto");
			session.removeAttribute("redirect");
			model.addAttribute("saleDto", saleDto);
		}
		
		model.addAttribute("saleOption", "basket");
		model.addAttribute("saleItemList", saleItemList);
		
		return "shop/sale/ItemBuy";
	}
	@RequestMapping(value="/basketInsertCtr.do", method=RequestMethod.POST)
	public String basketInsertCtr(HttpSession session, Model model, @ModelAttribute BasketDto basketDto) {
		logger.info("Welcome basketInsertCtr login! ");
		
		CustomerDto customerDto = (CustomerDto)session.getAttribute("customer");
		
		List<BasketDto> basketList = basketDto.getBasketList();
		
		int newVolume = 0;
		
		BasketDto oldBasketDto = null;
		
		for (BasketDto basketDtoOne : basketList) {
			basketDtoOne.setCustomerNo(customerDto.getCustomerNo());
			Map<String, Object> basketMap = new HashMap<String, Object>();
			basketMap.put("itemNo", basketDtoOne.getItemNo());
			basketMap.put("itemOptionNo", basketDtoOne.getItemOptionNo());
			basketMap.put("customerNo", basketDtoOne.getCustomerNo());
			oldBasketDto = saleService.basketSelectOne(basketMap);
			if (oldBasketDto != null) {
				newVolume = oldBasketDto.getBasketItemVolume() + basketDtoOne.getBasketItemVolume();
				saleService.basketUpdateOne(oldBasketDto.getBasketNo(), newVolume);
			}else {
				saleService.basketInsertOne(basketDtoOne);
			}
		}
		
		return "redirect:/basketList.do";
	}
	@RequestMapping(value="/basketList.do", method=RequestMethod.GET)
	public String basketList(HttpSession session, Model model) {
		logger.info("Welcome basketList login! ");
		
		
		CustomerDto customerDto = (CustomerDto)session.getAttribute("customer");
		
		List<BasketListDto> basketList = new ArrayList<BasketListDto>();
		basketList = saleService.basketSelectList(customerDto.getCustomerNo());
		
		model.addAttribute("basketList", basketList);
		
		return "shop/sale/BasketList";
	}
	
	@RequestMapping(value="/basketEzUpdateCtr.do", method=RequestMethod.GET)
	public String basketEzUpdateCtr(HttpSession session, Model model, int basketNo, int basketItemVolume) {
		logger.info("Welcome basketEzUpdateCtr login! ");
		
		saleService.basketUpdateOne(basketNo, basketItemVolume);
		
		return "redirect:/basketList.do";
	}
	
	@RequestMapping(value="/basketEzDeleteCtr.do", method=RequestMethod.GET)
	public String basketEzDeleteCtr(Model model, int basketNo) {
		logger.info("Welcome basketEzUpdateCtr login! ");
		
		saleService.basketDeleteOne(basketNo);
		
		return "redirect:/basketList.do";
	}
	@RequestMapping(value="/saleCtr.do", method=RequestMethod.POST)
	public String saleCtr(HttpSession session, Model model, String saleOption
			, @ModelAttribute SaleDto saleDto, @ModelAttribute SaleItemDto saleItemDto) {
		logger.info("Welcome saleCtr login! ");
		
		CustomerDto customerDto = (CustomerDto)session.getAttribute("customer");
		saleDto.setCustomerNo(customerDto.getCustomerNo());
		
		String saleState = CommonUtils.getRandomString() ;
		List<SaleItemDto> saleItemList = saleItemDto.getSaleItemList();
		
		saleDto.setSaleState(saleState);
		
		saleService.saleInsertOne(saleDto);
		
		String option = "SALE_STATE";
		
		Map<String, Object> saleMap = new HashMap<String, Object>();
		saleMap.put("option", option);
		saleMap.put("value", saleState);
		
		saleDto = saleService.saleSelectOne(saleMap);
		saleState = "결제완료";
		saleService.saleUpdateStateOne(saleDto.getSaleNo(), saleState);
		String mark = "";
		
		for (SaleItemDto saleItemDtoOne : saleItemList) {
			saleItemDtoOne.setSaleNo(saleDto.getSaleNo());
			saleService.saleItemInsertOne(saleItemDtoOne);
			mark = "-";
			itemService.itemOptionStockUpdateOne(saleItemDtoOne, mark);
			itemService.itemStockUpdateOne(saleItemDtoOne.getItemNo());
			mark = "+";
			itemService.itemSoldCountUpdateOne(saleItemDtoOne, mark);
		}
		
		int setMoney = customerDto.getCustomerMoney() - saleDto.getSalePrice();
		
		customerDto.setCustomerMoney(setMoney);
		customerService.customerUseMoneyUpdateOne(customerDto);
		
		if (saleOption.equals("basket")) {
			saleService.basketDeleteList(customerDto.getCustomerNo());
		}
		
		return "redirect:/saleList.do";
	}
	@RequestMapping(value="/saleList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String saleList(HttpSession session, Model model
			, @RequestParam(defaultValue = "1") int curPage
			, @RequestParam(defaultValue="") String keyword) {
		logger.info("Welcome saleList login! ");
		
		CustomerDto customerDto = (CustomerDto)session.getAttribute("customer");
		System.out.println(customerDto.getCustomerNo());
		int totalCount = saleService.saleItemSelectTotalCount(customerDto.getCustomerNo());
		
		Paging customerPaging = new Paging(totalCount, curPage , 10);
		int start = customerPaging.getPageBegin();
		int end = customerPaging.getPageEnd();
		
		List<SaleListDto> saleList = saleService.saleItemSelectList(customerDto.getCustomerNo(), start, end);
		
		Map<String, Object> pagingMap = new HashMap<>();
		pagingMap.put("totalCount", totalCount);
		pagingMap.put("customerPaging", customerPaging);
		
		model.addAttribute("saleList", saleList);
		model.addAttribute("pagingMap", pagingMap);
		model.addAttribute("curPage", curPage);
		model.addAttribute("keyword", keyword);
		
		return "shop/sale/SaleList";
	}
	@RequestMapping(value="/saleDetail.do", method=RequestMethod.GET)
	public String saleDetail(HttpSession session, Model model, int saleNo
			, @RequestParam(defaultValue = "1") int curPage
			, @RequestParam(defaultValue="") String keyword) {
		logger.info("Welcome SaleController login! ");
		
		CustomerDto customerDto = (CustomerDto)session.getAttribute("customer");
		
		String option = "SALE_NO";
		
		Map<String, Object> saleMap = new HashMap<String, Object>();
		saleMap.put("option", option);
		saleMap.put("value", saleNo);
		
		SaleDto saleDto = saleService.saleSelectOne(saleMap);
		
		if (customerDto.getCustomerNo() == 1) {
			
			customerDto = customerService.customerSelectOne(saleDto.getCustomerNo());
			model.addAttribute("customerDto", customerDto);
			
		}
		
		List<SaleItemListDto> saleItemList = saleService.saleItemDetailSelectList(saleNo);
		
		model.addAttribute("saleDto", saleDto);
		model.addAttribute("saleItemList", saleItemList);
		model.addAttribute("curPage", curPage);
		model.addAttribute("keyword", keyword);
		
		return "shop/sale/SaleDetail";
	}
	@RequestMapping(value="/refundCtr.do", method=RequestMethod.POST)
	public String refundCtr(Model model, int saleNo, String saleState, int salePrice
			, @RequestParam(defaultValue = "1") int curPage
			, @RequestParam(defaultValue="") String keyword) {
		logger.info("Welcome SaleController login! ");
		
		String state = "";
		String mark = "";
		
		if (saleState.equals("application")) {
			state = "환불대기";
			saleService.saleStateUpdateOne(saleNo, state);
		}else if (saleState.equals("cancle")) {
			state = "결제완료";
			saleService.saleStateUpdateOne(saleNo, state);
		}else if (saleState.equals("confirm")) {
			List<SaleItemDto> saleItemList = saleService.saleItemSimpleSelectList(saleNo);
			
			for (SaleItemDto saleItemDto : saleItemList) {
				mark = "+";
				itemService.itemOptionStockUpdateOne(saleItemDto, mark);
				itemService.itemStockUpdateOne(saleItemDto.getItemNo());
				mark = "-";
				itemService.itemSoldCountUpdateOne(saleItemDto, mark);
			}
			
			Map<String, Object> saleMap = new HashMap<String, Object>();
			saleMap.put("option", "SALE_NO");
			saleMap.put("value", saleNo);
			SaleDto saleDto = saleService.saleSelectOne(saleMap);
			
			CustomerDto customerDto = customerService.customerSelectOne(saleDto.getCustomerNo());
			
			int setMoney = customerDto.getCustomerMoney() + salePrice;
			
			customerDto.setCustomerMoney(setMoney);
			customerService.customerUseMoneyUpdateOne(customerDto);
			
			state = "환불완료";
			saleService.saleStateUpdateOne(saleNo, state);
		}else if (saleState.equals("rejection")) {
			state = "결제완료";
			saleService.saleStateUpdateOne(saleNo, state);
		}

		model.addAttribute("curPage", curPage);
		model.addAttribute("keyword", keyword);
		
		return "redirect:/saleList.do";
	}
	@RequestMapping(value="/sale.do", method=RequestMethod.GET)
	public String login(Model model) {
		logger.info("Welcome SaleController login! ");
		
		return "common/test";
	}
}
