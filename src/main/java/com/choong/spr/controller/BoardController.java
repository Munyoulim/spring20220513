package com.choong.spr.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.domain.ex01.CustomerDto;
import org.zerock.domain.ex01.PageInfoDto;

import com.choong.spr.domain.BoardDto;
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
	
	@GetMapping("/list")
	public void listBoard(Model model) {
		List<BoardDto> list = service.listBoard();
		
		model.addAttribute("boardList", list);
	}
	
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
	
}
























































