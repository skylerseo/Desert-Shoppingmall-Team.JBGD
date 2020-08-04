package com.edu.util.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.edu.board.service.BoardServiceImpl;
import com.edu.util.FileUtils;
import com.edu.util.dao.ItemImgDao;
import com.edu.util.model.ItemImgDto;

@Service
public class ItemImgServiceImpl implements ItemImgService {
	private static final Logger log = LoggerFactory.getLogger(BoardServiceImpl.class);
	
	@Autowired
	public ItemImgDao itemImgDao;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	@Override
	public void itemImgInsertOne(Map<String, Object> imgMap, String option){
		// TODO Auto-generated method stub
		itemImgDao.itemImgInsertOne(imgMap, option);
	}
	@Override
	public void itemImgThumbnailInsertOne(Map<String, Object> imgMap){
		// TODO Auto-generated method stub
		itemImgDao.itemImgThumbnailInsertOne(imgMap);
	}
	@Override
	public List<ItemImgDto> itemImgSelectList(int itemNo) {
		// TODO Auto-generated method stub
		return itemImgDao.itemImgSelectList(itemNo);
	}
	@Override
	public void itemImgUpdateOne(Map<String, Object> imgMap, int itemImgNo) {
		// TODO Auto-generated method stub
		itemImgDao.itemImgUpdateOne(imgMap, itemImgNo);
	}
	@Override
	public void itemImgDeleteOne(int itemImgNo) {
		// TODO Auto-generated method stub
		itemImgDao.itemImgDeleteOne(itemImgNo);
	}
	@Override
	public void itemImgDeleteList(int itemNo) {
		// TODO Auto-generated method stub
		itemImgDao.itemImgDeleteList(itemNo);
	}
	@Override
	public String itemImgSelectOne(int itemImgNo) {
		// TODO Auto-generated method stub
		return itemImgDao.itemImgSelectOne(itemImgNo);
	}
}
