package com.edu.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component("fileUtils")
public class FileUtils {

	private static final String filePath = "D:\\upload";
	
	public List<Map<String, Object>> parseInsertFileInfo(int itemNo, 
			MultipartHttpServletRequest multipartHttpServletRequest) 
					throws Exception{
		
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		MultipartFile multipartFile = null;
		String itemOriginalImgName = null;
		String originalFileExtension = null;
		String itemStoredImgName = null;
		
		List<Map<String, Object>> fileList = new ArrayList<Map<String,Object>>();
		Map<String, Object> fileInfoMap = null;
		
		File file = new File(filePath);
		
		if(file.exists() == false) {
			file.mkdirs();
		}
		
		while(iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			fileInfoMap = new HashMap<String, Object>();
			if(multipartFile.isEmpty() == false) {
				itemOriginalImgName = multipartFile.getOriginalFilename();
				originalFileExtension = itemOriginalImgName.
						substring(itemOriginalImgName.lastIndexOf("."));
				itemStoredImgName = CommonUtils.getRandomString() 
						+ originalFileExtension;
				
				file = new File(filePath, itemStoredImgName);
				multipartFile.transferTo(file);
				
				fileInfoMap.put("item_no", itemNo);
				fileInfoMap.put("item_original_img_name", itemOriginalImgName);
				fileInfoMap.put("item_stored_img_name", itemStoredImgName);
				fileInfoMap.put("item_img_size", multipartFile.getSize());
				fileInfoMap.put("new_file_check", "new");
				
				fileList.add(fileInfoMap);
			}else {
				fileInfoMap.put("new_file_check", "nothing");
				fileList.add(fileInfoMap);
			}
			
		}
		
		return fileList;
	} // 메서드 종료
	
	public void parseUpdateFileInfo(String storedFileName) {
		
		File file = new File(filePath + "\\" + storedFileName);

		if(file.exists()) {
			System.out.println(file.getAbsolutePath());
			System.out.println(file.getName());
			if (file.delete()) {
				System.out.println("파일삭제");
			}else {
				System.out.println("파일삭제실패");
			}
		}else {
			System.out.println("파일이 존재하지 않습니다.");
		}
		
	}
	
}
