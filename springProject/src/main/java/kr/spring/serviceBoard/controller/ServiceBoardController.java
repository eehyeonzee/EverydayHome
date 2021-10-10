package kr.spring.serviceBoard.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.serviceBoard.service.ServiceBoardService;
import kr.spring.serviceBoard.vo.ServiceBoardVO;
import kr.spring.util.PagingUtil;

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
	
	@GetMapping("service/serviceBoardInsert.do")
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
	
	//게시판 목록
	@RequestMapping("/serviceBoardList.do")
	public ModelAndView getServiceBoardList(
			@RequestParam(value="pageNum", defaultValue="1")int currentPage) {
		
		log.debug("<<currentPage>>: " + currentPage);
		
		//총 레코드 수
		int count = serviceBoardService.getServiceBoardCount();
		
		//페이지 처리
		PagingUtil page = new PagingUtil(currentPage, count, 10, 10, "serviceBoardList.do");
		
		//목록 호출
		List<ServiceBoardVO> list = null;
		if(count>0) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", page.getStartCount());
			map.put("end", page.getEndCount());
			
			list = serviceBoardService.getServiceBoardList(map);
		}
		
		ModelAndView mav = new ModelAndView();
		
		//뷰 이름 설정
		mav.setViewName("serviceBoardSelectList");
		
		//데이터 저장
		mav.addObject("count",count);
		mav.addObject("list", list);
		mav.addObject("pagingHtml", page.getPagingHtml());
		
		return mav;
		
	}
			
	
	
	
	
}
