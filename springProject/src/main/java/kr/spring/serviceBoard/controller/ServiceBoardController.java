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
import org.springframework.web.bind.annotation.RequestMapping;

import kr.spring.serviceBoard.service.ServiceBoardService;
import kr.spring.serviceBoard.vo.ServiceBoardVO;

/**
 * @Package Name   : kr.spring.serviceBoard.controller
 * @FileName  : ServiceBoardController.java
 * @작성일       : 2021. 10. 10. 
 * @작성자       : 나윤경
 * @프로그램 설명 : 고객센터 컨트롤러
 */
@Controller
public class ServiceBoardController {

	//로그 처리 (로그 대상 지정)
	private static final Logger log = LoggerFactory.getLogger(ServiceBoardController.class);
	
	@Autowired
	private ServiceBoardService serviceBoardService;
	
	//자바빈 초기화
	@ModelAttribute
	public ServiceBoardVO initCommand() {
		return new ServiceBoardVO();
	}
	
	@GetMapping("/serviceBoard/serviceBoardInsert.do")
	//글쓰기 폼 호출
	public String serviceBoardInsertForm() {
		log.debug("<<글쓰기 폼 호출>>");
		
		return "serviceBoard/serviceBoardInsertForm";
	}
	//글쓰기 처리
	@PostMapping("/serviceBoard/serviceBoardInsert.do")
	public String submit(@Valid ServiceBoardVO vo, BindingResult result) {
		//유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return serviceBoardInsertForm();
		}
		//글쓰기
		serviceBoardService.serviceBoardInsert(vo);
		
		return "redirect:/main/main.do";
	}
	
	/*
	 * //글쓰기 파일 첨부 업데이트(ajax)
	 * 
	 * @RequestMapping("/serviceBoard/serviceBoard")
	 */
	
}
