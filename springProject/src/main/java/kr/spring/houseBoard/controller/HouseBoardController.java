package kr.spring.houseBoard.controller;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import kr.spring.houseBoard.service.HouseBoardService;
import kr.spring.houseBoard.vo.HouseBoardVO;

/**
 * @Package Name   : kr.spring.houseBoard.controller
 * @FileName  : HouseBoardController.java
 * @작성일       : 2021. 10. 10. 
 * @작성자       : 이현지
 * @프로그램 설명 : 집들이 게시판 컨드롤러
 */

@Controller
public class HouseBoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(HouseBoardController.class);
	
	@Autowired
	private HouseBoardService houseBoardService;
	
	// 자바빈(VO) 초기화
	@ModelAttribute
	public HouseBoardVO initCommand() {
		return new HouseBoardVO();
	}
	
	// 글쓰기 폼 호출
	@GetMapping("/houseBoard/houseBoardWrite.do")
	public String insertHBoardForm() {
		
		logger.debug("<<글쓰기 폼 호출>>");
		
		return "houseBoardWrite"; // 타일스 식별자 호출
	}
	
	// 글쓰기 처리
	@PostMapping("/houseBoard/houseBoardWrite.do")
	public String submitInsert(@Valid HouseBoardVO houseBoardVO, BindingResult result) {
		
		// 유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return insertHBoardForm();
		}
		
		houseBoardService.insertHBoard(houseBoardVO);
		
		return "redirect:/main/main.do";
	}
	

}

