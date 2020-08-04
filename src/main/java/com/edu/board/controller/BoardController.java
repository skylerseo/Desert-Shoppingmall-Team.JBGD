package com.edu.board.controller;

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

import com.edu.board.model.BoardCtmDto;
import com.edu.board.model.BoardRplDto;
import com.edu.board.service.BoardService;
import com.edu.util.FileUtils;
import com.edu.util.Paging;

@Controller
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private BoardService boardService;
	@Resource(name = "fileUtils")
	private FileUtils fileUtils;

	// 게시판 리스트 화면으로
	@RequestMapping(value = "/board.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String boardList(@RequestParam(defaultValue = "1") int curPage,
			@RequestParam(defaultValue = "all") String searchOption, @RequestParam(defaultValue = "") String keyword,
			Model model) {
		logger.info("Welcome BoardController boardListView!:{} {}", curPage, keyword);

		int boardTotal = boardService.boardSelectTotalCount(searchOption, keyword);

		Paging customerPaging = new Paging(boardTotal, curPage, 10);
		int start = customerPaging.getPageBegin();
		int end = customerPaging.getPageEnd();

		List<BoardCtmDto> boardList = boardService.boardSelectList(searchOption, keyword, start, end);

		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("searchOption", searchOption);
		searchMap.put("keyword", keyword);

		Map<String, Object> pagingMap = new HashMap<>();
		pagingMap.put("boardTotal", boardTotal);
		pagingMap.put("customerPaging", customerPaging);

		model.addAttribute("boardList", boardList);
		model.addAttribute("searchMap", searchMap);
		model.addAttribute("pagingMap", pagingMap);

		return "board/boardListView";
	}

	// 게시판 등록 화면으로

	@RequestMapping(value = "/boardAdd.do", method = RequestMethod.GET)
	public String boardAdd(HttpSession session, Model model) {
		logger.info("Welcome BoardController boardAdd! -{}");

		return "board/boardAddForm";
	}

	// 게시판 등록
	@RequestMapping(value = "/boardAddCtr.do", method = RequestMethod.POST)
	public String boardAddCtr(BoardCtmDto boardCtmDto, Model model,
			MultipartHttpServletRequest multipartHttpServletRequestd) {
		logger.info("Welcome BoardController boardAddCtr! - {} {}", boardCtmDto);

		try {
			List<Map<String, Object>> fileList = new ArrayList<Map<String, Object>>();

			String itemOriginalImgName = "";
			int itemImgSize = 0;
			String itemStoredImgName = "";

			if (multipartHttpServletRequestd != null) {
				fileList = fileUtils.parseInsertFileInfo(1, multipartHttpServletRequestd);
				
					
				if(fileList.get(0).get("new_file_check").equals("new")) {
				itemOriginalImgName = (String) fileList.get(0).get("item_original_img_name");
				itemImgSize = Integer.parseInt(fileList.get(0).get("item_img_size").toString());
				itemStoredImgName = (String) fileList.get(0).get("item_stored_img_name");

				boardCtmDto.setBoardOriginalImg(itemOriginalImgName);
				boardCtmDto.setBoardImgSize(itemImgSize);
				boardCtmDto.setBoardStoredImg(itemStoredImgName);

				}
			}		


		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("이미지가 들어간다~");
			e.printStackTrace();
		}
		boardService.boardInsertOne(boardCtmDto);

		return "redirect:/board.do";

	}

//	boardDetail.do 게시판 내용화면으로 이동 및 덧글 조회

	@RequestMapping(value = "/boardDetail.do", method = RequestMethod.GET)
	public String boardDetail(HttpSession sessoin, int boardNo, int curPage, Model model) {
		logger.info("Welcome BoardController boardDetail! -" + "customerNo: {}");

		BoardCtmDto boardCtmDto = boardService.boardSelectOne(boardNo);

		List<BoardRplDto> boradRplList = boardService.replySelectList(boardNo);

		model.addAttribute("boradRplList", boradRplList);
		model.addAttribute("boardCtmDto", boardCtmDto);
		model.addAttribute("curPage", curPage);

		return "board/boardDetailVeiw";

	}

	// 게시판 수정 화면으로 이동
	@RequestMapping(value = "/boardUpdate.do", method = RequestMethod.GET)
	public String boardUpdate(int boardNo, int curPage, Model model) {
		logger.info("Welcome BoardController boardUpdate! boardNo: {}, curPage: {}");

		BoardCtmDto boardCtmDto = boardService.boardSelectOne(boardNo);

		model.addAttribute("boardCtmDto", boardCtmDto);
		model.addAttribute("curPage", curPage);

		return "board/boardUpdateForm";

	}

	// 게시판 수정
	@RequestMapping(value = "/boardUpdateCtr.do", method = RequestMethod.POST)
	public String boardUpdateCtr(BoardCtmDto boardCtmDto, int curPage, Model model,
			MultipartHttpServletRequest multipartHttpServletRequestd) {
		logger.info("Welcome BoardController boardUpdateCtr!");

		try {
			List<Map<String, Object>> fileList = new ArrayList<Map<String, Object>>();

			String  itemOriginalImgName = "";
			int 	itemImgSize         = 0;
			String  itemStoredImgName   = "";

			if (multipartHttpServletRequestd != null) {
				fileList = fileUtils.parseInsertFileInfo(1, multipartHttpServletRequestd);
				
				if(fileList.get(0).get("new_file_check").equals("new")) {
					itemOriginalImgName = (String) fileList.get(0).get("item_original_img_name");
					itemImgSize = Integer.parseInt(fileList.get(0).get("item_img_size").toString());
					itemStoredImgName = (String) fileList.get(0).get("item_stored_img_name");

					boardCtmDto.setBoardOriginalImg(itemOriginalImgName);
					boardCtmDto.setBoardImgSize(itemImgSize);
					boardCtmDto.setBoardStoredImg(itemStoredImgName);
				}	
				if(boardCtmDto.getBoardOriginalImg() == "") {
					itemOriginalImgName = "";
					itemImgSize       = 0; 
					itemStoredImgName  = "";
					
				}
			}
			if(boardCtmDto.getBoardOriginalImg() == boardCtmDto.getBoardOriginalImg()) {
				boardService.boardUpdateOne(boardCtmDto);					
			}

			boardService.boardUpdateOne(boardCtmDto);

			model.addAttribute("boardNo", boardCtmDto.getBoardNo());
			model.addAttribute("boardCtmDto", boardCtmDto);
			model.addAttribute("curPage", curPage);

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("이미지가 들어간다~");
			e.printStackTrace();
		}
		return "redirect:/boardDetail.do";
	}

	// 게시판 삭제

	@RequestMapping(value = "/boardDeleteCtr.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String boardDeleteCtr(int boardNo, @RequestParam(defaultValue = "name") String searchOption,
			@RequestParam(defaultValue = "") String keyword, int curPage, Model model) {
		logger.info("Welcome BoardController boardDeleteCtr! {} ", boardNo);

		boardService.boardDeleteOne(boardNo);

		model.addAttribute("searchoption", searchOption);
		model.addAttribute("keyword", keyword);
		model.addAttribute("curPage", curPage);

		return "redirect:/board.do";

	}

	// 조회수

	@RequestMapping(value = "/boardViewCountCtr.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String boardViewCountCtr(int boardNo, int curPage, Model model) {
		logger.info("Welcome BoardController boardViewCountCtr! {} ");

		boardService.boardViewOneUp(boardNo);

		model.addAttribute("boardNo", boardNo);
		model.addAttribute("curPage", curPage);

		return "redirect:/boardDetail.do";

	}

	// 덧글 등록

	@RequestMapping(value = "/replyAddCtr.do", method = RequestMethod.POST)
	public String replyAddCtr(BoardRplDto boardRplDto, int curPage, Model model) {
		logger.info("Welcome BoardController replyAddCtr! - {} {}", boardRplDto.toString(), curPage);

		boardService.replyInsertOne(boardRplDto);

		model.addAttribute("boardNo", boardRplDto.getBoardNo());
		model.addAttribute("curPage", curPage);
		model.addAttribute("boardRplDto", boardRplDto);

		return "redirect:/boardDetail.do";

	}

	// 댓글 수정
	@RequestMapping(value = "/replyUpdateCtr.do", method = RequestMethod.POST)
	public String replyUpdateCtr(BoardRplDto boardRplDto, int curPage, Model model) {
		logger.info("Welcome BoardController boardUpdateCtr! {}", boardRplDto.toString());

		boardService.replyUpdateOne(boardRplDto);

		model.addAttribute("boardNo", boardRplDto.getBoardNo());
		model.addAttribute("curPage", curPage);

		return "redirect:/boardDetail.do";

	}
//	덧글 삭제

	@RequestMapping(value = "/replyDeleteCtr.do", method = RequestMethod.POST)
	public String replyDeleteCtr(int replyNo, int boardNo, int curPage, Model model) {
		logger.info("Welcome BoardController boardDeleteCtr! {} ", replyNo);

		boardService.replyDeleteOne(replyNo);

		model.addAttribute("boardNo", boardNo);
		model.addAttribute("curPage", curPage);

		return "redirect:/boardDetail.do";

	}

}
