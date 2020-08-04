package com.edu.shop.item.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.edu.customer.model.CustomerDto;
import com.edu.shop.item.model.ItemDto;
import com.edu.shop.item.model.ItemListDto;
import com.edu.shop.item.model.ItemOptionDto;
import com.edu.shop.item.service.ItemService;
import com.edu.util.CommonUtils;
import com.edu.util.FileUtils;
import com.edu.util.Paging;
import com.edu.util.SessionCheck;
import com.edu.util.model.ItemImgDto;
import com.edu.util.service.ItemImgService;

@Controller
public class ItemController {
	private static final Logger logger = LoggerFactory.getLogger(ItemController.class);
	
	@Autowired
	private ItemService itemService;
	@Autowired
	private ItemImgService itemImgService;
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	@Resource(name="sessionCheck")
	private SessionCheck sessionCheck;
	
	@RequestMapping(value="/itemListAdmin.do", method={RequestMethod.GET, RequestMethod.POST})
	public String itemList(HttpSession session, Model model
			, @RequestParam(defaultValue = "1") int curPage
			, @RequestParam(defaultValue = "") String keyword
			, @RequestParam(defaultValue = "ITEM_NO") String orderBy
			, @RequestParam(defaultValue = "DESC") String orderOption) {
		
		logger.info("Welcome itemList login! ");
		
		CustomerDto customerDto = (CustomerDto)session.getAttribute("customer");
		
		int totalCount = itemService.itemSelectTotalCount(keyword);
		
		Paging customerPaging = new Paging(totalCount, curPage, 10);
		int start = customerPaging.getPageBegin();
		int end = customerPaging.getPageEnd();
		
		Map<String, Object> searchOptionMap = new HashMap<String, Object>();
		searchOptionMap.put("customerNo", customerDto.getCustomerNo());
		searchOptionMap.put("keyword", keyword);
		searchOptionMap.put("start", start);
		searchOptionMap.put("end", end);
		searchOptionMap.put("orderBy", orderBy);
		searchOptionMap.put("orderOption", orderOption);
		
		List<ItemListDto> itemList = itemService.itemSelectList(searchOptionMap);
		List<List<ItemOptionDto>> itemOptionTotalList = new ArrayList<List<ItemOptionDto>>();
		
		for(ItemListDto itemListDto : itemList) {
			List<ItemOptionDto> itemOptionList = itemService.itemOptionSelectList(itemListDto.getItemNo());
			itemOptionTotalList.add(itemOptionList);
		}
		 
		
		Map<String, Object> pagingMap = new HashMap<>();
		pagingMap.put("totalCount", totalCount);
		pagingMap.put("customerPaging", customerPaging);
		
		if (orderOption.equals("DESC")) {
			orderOption = "ASC";
		}else {
			orderOption = "DESC";
		}
		
		model.addAttribute("itemList", itemList);
		model.addAttribute("itemOptionTotalList", itemOptionTotalList);
		model.addAttribute("keyword", keyword);
		model.addAttribute("pagingMap", pagingMap);
		model.addAttribute("orderBy", orderBy);
		model.addAttribute("orderOption", orderOption);
		
		return "shop/item/ItemList";
	}
	@RequestMapping(value="/itemEzUpdateCtr.do", method=RequestMethod.POST)
	public String itemEzUpdateCtr(HttpSession session, Model model
			, @RequestParam(defaultValue = "1") int tempCurPage
			, @RequestParam(defaultValue = "0") int itemNo 
			, @RequestParam(defaultValue = "0") int itemOptionNo
			, @RequestParam(defaultValue = "0") int itemOptionStock
			, @RequestParam(defaultValue = "") String keyword) {
		logger.info("Welcome itemEzUpdateCtr login! ");
		
		ItemOptionDto itemOptionDto = new ItemOptionDto(itemOptionNo, itemOptionStock);
		
		itemService.itemEzUpdateOne(itemOptionDto);
		
		itemService.itemStockUpdateOne(itemNo);
		
		model.addAttribute("curPage", tempCurPage);
		model.addAttribute("keyword", keyword);
		
		return "redirect:/itemListAdmin.do";
	}
	@RequestMapping(value="/itemEzDeleteCtr.do", method=RequestMethod.POST)
	public String itemEzDeleteCtr(HttpSession session, Model model
			,@RequestParam(defaultValue = "1") int tempCurPage
			,@RequestParam(defaultValue = "")  String keyword
			, ItemOptionDto itemOptionDto) {
		logger.info("Welcome itemEzUpdateCtr login! ");
		
		itemService.itemEzDeleteOne(itemOptionDto.getItemOptionNo());
		
		itemService.itemStockUpdateOne(itemOptionDto.getItemNo());
		
		model.addAttribute("curPage", tempCurPage);
		model.addAttribute("keyword", keyword);
		
		return "redirect:/itemListAdmin.do";
	}
	@RequestMapping(value="/itemAdd.do", method=RequestMethod.GET)
	public String itemAdd(HttpSession session, Model model
			, @RequestParam(defaultValue = "1") int curPage
			, @RequestParam(defaultValue="") String keyword) {
		logger.info("Welcome itemAdd login! ");
		
		model.addAttribute("curPage", curPage);
		model.addAttribute("keyword", keyword);
		
		return "shop/item/ItemAdd";
	}
	@RequestMapping(value="/itemAddCtr.do", method=RequestMethod.POST)
	public String itemAddCtr(HttpSession session, Model model
			, MultipartHttpServletRequest multipartHttpServletRequest
			, ItemDto itemDto, ItemOptionDto itemOptionDto) {
		logger.info("Welcome itemAddCtr login! ");

		String uniqueItemName = CommonUtils.getRandomString() ;
		itemDto.setItemState(uniqueItemName);
		
		int stock = 0;
		List<ItemOptionDto> itemOptionList = itemOptionDto.getItemOptionList();
		for(ItemOptionDto itemOptionDtoOne : itemOptionList) {
			stock += itemOptionDtoOne.getItemOptionStock();
		}
		
		itemDto.setItemStock(stock);
		itemService.itemInsertOne(itemDto);
		
		String option = "ITEM_STATE";
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uniqueKey", uniqueItemName);
		map.put("option", option);
		
		itemDto = itemService.itemSelectOne(map);
		int itemNo = itemDto.getItemNo();
		try {
			List<Map<String, Object>> imgList = fileUtils.parseInsertFileInfo(itemNo, multipartHttpServletRequest);
			if (multipartHttpServletRequest != null) {
				
				int count = 0;
				
				for(Map<String, Object> imgMap : imgList) {
					
					if (count == 0) {
						option = "true";
					}else {
						option = "false";
					}
					
					if (imgMap.get("new_file_check").equals("new")) {
						itemImgService.itemImgInsertOne(imgMap, option);
					}
					count++;
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		for(ItemOptionDto itemOptionDtoOne : itemOptionList) {
			itemOptionDtoOne.setItemNo(itemNo);
			itemService.itemOptionInsertOne(itemOptionDtoOne);
		}
		
		String itemState = "활성화";
		itemService.itemStateUpdateOne(itemNo, itemState);
		
		return "redirect:/itemListAdmin.do";
	}
	@RequestMapping(value="/itemView.do", method=RequestMethod.GET)
	public String itemView(Model model, int itemNo
			, @RequestParam(defaultValue = "1") int curPage
			, @RequestParam(defaultValue="") String keyword) {
		logger.info("Welcome itemView login! ");
		
		String option = "ITEM_NO";
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uniqueKey", itemNo);
		map.put("option", option);
		
		ItemDto itemDto = itemService.itemSelectOne(map);
		List<ItemOptionDto> itemOptionList = itemService.itemOptionSelectList(itemNo);
		List<ItemImgDto> itemImgList = itemImgService.itemImgSelectList(itemNo);
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("curPage", curPage);
		searchMap.put("keyword", keyword);
		
		model.addAttribute("itemDto", itemDto);
		model.addAttribute("itemOptionList", itemOptionList);
		model.addAttribute("itemImgList", itemImgList);
		model.addAttribute("searchMap", searchMap);
		
		return "shop/item/ItemView";
	}
	
	@RequestMapping(value="/itemViewCtr.do", method=RequestMethod.POST)
	public String itemViewCtr(Model model, int itemNo
			, @RequestParam(defaultValue = "1") int curPage
			, @RequestParam(defaultValue="") String keyword) {
		logger.info("Welcome ItemController login! ");
		
		itemService.itemViewCountUpdateOne(itemNo);
		
		model.addAttribute("itemNo", itemNo);
		model.addAttribute("curPage", curPage);
		model.addAttribute("keyword", keyword);
		
		return "redirect:/itemView.do";
	}
	
	@RequestMapping(value="/itemUpdate.do", method=RequestMethod.GET)
	public String itemUpdate(HttpSession session, Model model, int itemNo
			, @RequestParam(defaultValue = "1") int curPage
			, @RequestParam(defaultValue="") String keyword) {
		logger.info("Welcome ItemController login! ");
		
		String option = "ITEM_NO";
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uniqueKey", itemNo);
		map.put("option", option);
		
		ItemDto itemDto = itemService.itemSelectOne(map);
		List<ItemOptionDto> itemOptionList = itemService.itemOptionSelectList(itemNo);
		List<ItemImgDto> itemImgList = itemImgService.itemImgSelectList(itemNo);
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("curPage", curPage);
		searchMap.put("keyword", keyword);
		
		model.addAttribute("itemDto", itemDto);
		model.addAttribute("itemOptionList", itemOptionList);
		model.addAttribute("itemImgList", itemImgList);
		model.addAttribute("searchMap", searchMap);
		
		return "shop/item/ItemUpdate";
	}
	@RequestMapping(value="/itemUpdateCtr.do", method=RequestMethod.POST)
	public String itemUpdateCtr(HttpSession session, Model model
			, MultipartHttpServletRequest multipartHttpServletRequest
			, ItemDto itemDto
			, ItemOptionDto itemOptionDto, String[] itemOptionState
			, int[] itemImgNo, String[] itemImgState
			, @RequestParam(defaultValue = "1") int curPage
			, @RequestParam(defaultValue="") String keyword) {
		logger.info("Welcome ItemController login! ");
		
		int stock = 0;
		List<ItemOptionDto> itemOptionList = itemOptionDto.getItemOptionList();
		for(ItemOptionDto itemOptionDtoOne : itemOptionList) {
			stock += itemOptionDtoOne.getItemOptionStock();
		}
		
		itemDto.setItemStock(stock);
		itemService.itemUpdateOne(itemDto);
		
		int ImgFileCount = 0;
		int ImgNoCount = 0;
		String option = "";
		String storedFileName = "";
		try {
			List<Map<String, Object>> imgList = fileUtils.parseInsertFileInfo(itemDto.getItemNo(), multipartHttpServletRequest);
			for (int i = 0; i < itemImgState.length; i++){
				
				if (ImgFileCount == 0) {
					option = "true";
				}else {
					option = "false";
				}
				
				if (itemImgState[i].equals("new")) {
					if (imgList.get(ImgFileCount).get("new_file_check").equals("nothing")) {
						ImgFileCount++;
					}else {
						itemImgService.itemImgInsertOne(imgList.get(ImgFileCount), option);
						ImgFileCount++;
					}
				}else if (itemImgState[i].equals("update")) {
					storedFileName = itemImgService.itemImgSelectOne(itemImgNo[ImgNoCount]);
					fileUtils.parseUpdateFileInfo(storedFileName);
					itemImgService.itemImgUpdateOne(imgList.get(ImgFileCount), itemImgNo[ImgNoCount]);
					ImgFileCount++;
					ImgNoCount++;
				}else if (itemImgState[i].equals("delete")) {
					storedFileName = itemImgService.itemImgSelectOne(itemImgNo[ImgNoCount]);
					fileUtils.parseUpdateFileInfo(storedFileName);
					itemImgService.itemImgDeleteOne(itemImgNo[ImgNoCount]);
					ImgNoCount++;
				}else if (itemImgState[i].equals("old")) {
					ImgFileCount++;
					ImgNoCount++;
				}
				if (ImgFileCount == 0) {
					ImgFileCount++;
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		for (int i = 0; i < itemOptionState.length; i++){
			
			if (itemOptionState[i].equals("new")) {
				itemOptionList.get(i).setItemNo(itemDto.getItemNo());
				itemService.itemOptionInsertOne(itemOptionList.get(i));
			}else if (itemOptionState[i].equals("update")) {
				itemOptionList.get(i).setItemNo(itemDto.getItemNo());
				itemService.itemOptionUpdateOne(itemOptionList.get(i));
			}else if (itemOptionState[i].equals("delete")) {
				itemService.itemOptionStateUpdateOne(itemOptionList.get(i));
			}else if (itemOptionState[i].equals("old")) {
			}
		}
		
		model.addAttribute("itemNo", itemDto.getItemNo());
		model.addAttribute("curPage", curPage);
		model.addAttribute("keyword", keyword);
		
		return "redirect:/itemView.do";
		
	}
	@RequestMapping(value="/itemAbleCtr.do", method=RequestMethod.POST)
	public String itemAbleCtr(HttpSession session, Model model
			, @RequestParam(defaultValue = "1") int itemNo
			, @RequestParam(defaultValue = "") String itemState) {
		logger.info("Welcome ItemController login! ");
		
		String state = "";
		
		if (itemState.equals("활성화")) {
			state = "비활성화";
		}else if (itemState.equals("비활성화")) {
			state = "활성화";
		}
		
		itemService.itemStateUpdateOne(itemNo, state);
		
		return "redirect:/itemListAdmin.do";
	}
	@RequestMapping(value="/itemListCtm.do", method={RequestMethod.GET, RequestMethod.POST})
	public String itemListCtm(HttpSession session, Model model
			, @RequestParam(defaultValue = "1") int curPage
			, @RequestParam(defaultValue="") String keyword
			, @RequestParam(defaultValue="ITEM_NO") String orderBy
			, @RequestParam(defaultValue="DESC") String orderOption) {
		
		logger.info("Welcome ItemController login! ");
		

		int totalCount = itemService.itemSelectTotalCount(keyword);
		
		Paging customerPaging = new Paging(totalCount, curPage, 8);
		int start = customerPaging.getPageBegin();
		int end = customerPaging.getPageEnd();
		
		Map<String, Object> searchOptionMap = new HashMap<String, Object>();
		searchOptionMap.put("keyword", keyword);
		searchOptionMap.put("customerNo", 2);
		searchOptionMap.put("start", start);
		searchOptionMap.put("end", end);
		searchOptionMap.put("orderBy", orderBy);
		searchOptionMap.put("orderOption", orderOption);
		
		List<ItemListDto> itemList = itemService.itemSelectList(searchOptionMap);
		
		Map<String, Object> pagingMap = new HashMap<>();
		pagingMap.put("totalCount", totalCount);
		pagingMap.put("customerPaging", customerPaging);
		
		model.addAttribute("itemList", itemList);
		model.addAttribute("keyword", keyword);
		model.addAttribute("pagingMap", pagingMap);
		model.addAttribute("orderBy", orderBy);
		model.addAttribute("orderOption", orderOption);
		
		return "shop/item/ItemListCtm";
	}
	@RequestMapping(value="/itemStatistics.do", method={RequestMethod.GET, RequestMethod.POST})
	public String itemStatistics(HttpSession session, Model model
			, @RequestParam(defaultValue = "1") int curPage
			, @RequestParam(defaultValue="") String keyword
			, @RequestParam(defaultValue="ITEM_NO") String orderBy
			, @RequestParam(defaultValue="DESC") String orderOption) {
		logger.info("Welcome ItemController login! ");
		
		int totalCount = itemService.itemSelectTotalCount(keyword);
		
		Paging customerPaging = new Paging(totalCount, curPage, 10);
		int start = customerPaging.getPageBegin();
		int end = customerPaging.getPageEnd();
		
		Map<String, Object> searchOptionMap = new HashMap<String, Object>();
		searchOptionMap.put("keyword", keyword);
		searchOptionMap.put("start", start);
		searchOptionMap.put("end", end);
		searchOptionMap.put("orderBy", orderBy);
		searchOptionMap.put("orderOption", orderOption);
		
		List<ItemDto> itemList = itemService.itemStatisticsSelectList(searchOptionMap);
		List<List<ItemOptionDto>> itemOptionTotalList = new ArrayList<List<ItemOptionDto>>();
		
		for(ItemDto itemDto : itemList) {
			List<ItemOptionDto> itemOptionList = itemService.itemOptionSelectList(itemDto.getItemNo());
			itemOptionTotalList.add(itemOptionList);
		}
		
		if (orderOption.equals("DESC")) {
			orderOption = "ASC";
		}else {
			orderOption = "DESC";
		}
		
		Map<String, Object> pagingMap = new HashMap<String, Object>();
		pagingMap.put("customerPaging", customerPaging);
		pagingMap.put("totalCount", totalCount);
		pagingMap.put("curPage", curPage);
		pagingMap.put("keyword", keyword);
		pagingMap.put("orderBy", orderBy);
		pagingMap.put("orderOption", orderOption);
		
		model.addAttribute("itemList", itemList);
		model.addAttribute("itemOptionTotalList", itemOptionTotalList);
		model.addAttribute("pagingMap", pagingMap);
		
		return "shop/item/ItemStatistics";
	}
	@RequestMapping(value="/main.do", method=RequestMethod.GET)
	public String main(HttpSession session, Model model) {
		logger.info("Welcome main login! ");
		
		return "common/AdminMain";
	}
	@RequestMapping(value="/item.do", method=RequestMethod.GET)
	public String login(HttpSession session, Model model) {

		
		logger.info("Welcome ItemController login! ");
		
		return "common/AdminMain";
	}

}
