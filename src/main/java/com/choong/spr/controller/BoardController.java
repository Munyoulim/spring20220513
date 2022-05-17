package com.choong.spr.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.choong.spr.domain.BoardDto;
import com.choong.spr.domain.PageInfoDto;
import com.choong.spr.domain.ReplyDto;
import com.choong.spr.service.BoardService;
import com.choong.spr.service.ReplyService;

@Controller
@RequestMapping("Board")
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@Autowired
	private ReplyService replyService;
	
	// select 
	@GetMapping("/{id}")
	public String getBoard(@PathVariable("id")int id, Model model) {
		
		BoardDto dto = service.getBoard(id);
		
		List<ReplyDto> replyList = replyService.listReplyByBoardId(id);
		
		model.addAttribute("board", dto); 
		model.addAttribute("replyList", replyList);
		
		return "/Board/get";
	}
	
	// modify
	@PostMapping("/modify")
	public String modifyBoard(BoardDto board) {
		service.updateBoard(board);
		return "redirect:/Board/" + board.getId();
	}
	
	// delete
	@PostMapping("/remove") 
	public String removeBoard(int id) {
		service.removeBoardById(id);
		
		return "redirect:/Board/list";
	}
	
	// insert
	@GetMapping("/write")
	public void writeBoard() {
		
	}
	
	@PostMapping("/write")
	public String writeBoardProcess(BoardDto board) {
		service.addBoard(board);
		
		return "redirect:/Board/list";
	}
	
	@GetMapping("/list") 
	public void listBoardPage(@RequestParam(name="page", defaultValue="1")int page, 
							  Model model, 
							  String keyword, 
							  String searchType) {
		int rowPerPage = 10;
		
		List<BoardDto> list = service.listBoardPage(page, rowPerPage, keyword, searchType); 
		int totalRecords = service.countBoards(keyword, searchType);
		
		int end = (totalRecords - 1) / rowPerPage + 1;
		
		PageInfoDto pageInfo = new PageInfoDto();
		pageInfo.setCurrent(page);
		pageInfo.setEnd(end);
		pageInfo.setKeyword(keyword);
		
		model.addAttribute("boardList", list);
		model.addAttribute("pageInfo", pageInfo); 
		
	}
	
}
























































