package com.edu.util.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.edu.util.model.ItemImgDto;

public interface ItemImgService {

	public void itemImgInsertOne(Map<String, Object> imgMap, String option);
	public void itemImgThumbnailInsertOne(Map<String, Object> imgMap);
	public List<ItemImgDto> itemImgSelectList(int itemNo);
	public void itemImgUpdateOne(Map<String, Object> imgMap, int itemImgNo);
	public void itemImgDeleteOne(int itemImgNo);
	public void itemImgDeleteList(int itemNo);
	public String itemImgSelectOne(int itemImgNo);
}
