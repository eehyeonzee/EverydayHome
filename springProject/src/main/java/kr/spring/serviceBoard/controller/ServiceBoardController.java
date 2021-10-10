package kr.spring.serviceBoard.controller;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import kr.spring.serviceBoard.service.ServiceBoardService;
import kr.spring.serviceBoard.vo.ServiceBoardVO;

/**
 * @Package Name   : kr.spring.serviceBoard.controller
 * @FileName  : ServiceBoardController.java
 * @작성일       : 2021. 10. 10. 
 * @작성자       : 나윤경
 * @프로그램 설명 : 
 */
@Controller
public class ServiceBoardController {

	@Autowired
	private ServiceBoardService serviceBoardService;
	
	//로그 처리 (로그 대상 지정)
		private static final Logger log = LoggerFactory.getLogger(ServiceBoardController.class);
	
	//자바빈 초기화
	@ModelAttribute
	public ServiceBoardVO initCommand() {
		return new ServiceBoardVO();
	}
	
	@GetMapping("/serviceBoardInsert.do")
	//글쓰기 폼 호출
	public String serviceBoardInsertForm() {
		return "serviceBoardInsertForm";
	}
	@PostMapping("/serviceBoardInsert.do")
	//글쓰기 처리
	public String submit(@Valid ServiceBoardVO vo, BindingResult result) {
		//유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return serviceBoardInsertForm();
		}
		//글쓰기
		serviceBoardService.serviceBoardInsert(vo);
		
		return "redirect:/serviceBoardList.do";
	}
	
	
	
	
	
}
