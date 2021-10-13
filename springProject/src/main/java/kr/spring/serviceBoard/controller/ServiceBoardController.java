package kr.spring.serviceBoard.controller;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import kr.spring.util.StringUtil;

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
		
		return "redirect:/serviceBoard/serviceBoardList.do";
	}
	
	//게시판 목록
	@RequestMapping("/serviceBoard/serviceBoardList.do")
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
		mav.setViewName("serviceBoard/serviceBoardList");
		
		//데이터 저장
		mav.addObject("count",count);
		mav.addObject("list", list);
		mav.addObject("pagingHtml", page.getPagingHtml());
		
		return mav;
		
	}
			
	//글 상세
	@RequestMapping("/serviceBoard/serviceBoardDetail.do")
	public ModelAndView serviceBoardDetail(@RequestParam int num) {
		ServiceBoardVO serviceboard = serviceBoardService.getServiceBoard(num);
		//HTML 태그 불허
		serviceboard.setService_title(StringUtil.useNoHtml(serviceboard.getService_title()));
		//HTML 태그 불허, 줄바꿈 허용
		serviceboard.setService_content(StringUtil.useBrNoHtml(serviceboard.getService_content()));
								//뷰 이름					//속성명		//속성값
		return new ModelAndView("/serviceBoard/serviceBoardDetail","serviceboard","serviceboard");
	}
	
	//이미지 출력
	@RequestMapping("/serviceBoard/imageView.do")
	public ModelAndView viewImage(@RequestParam int service_num) {
		
	ServiceBoardVO serviceboard = serviceBoardService.getServiceBoard(service_num);
	
	ModelAndView mav = new ModelAndView();
	mav.setViewName("imageView");
	                //속성명         속성값(byte[]의 데이터)     
	mav.addObject("imageFile", serviceboard.getService_file());
	mav.addObject("filename", serviceboard.getService_filename());
			
	return mav;
}
	
	
	//수정폼
	@GetMapping("/serviceBoard/serviceBoardUpdate.do")
	public String serviceBoardUpdateForm(@RequestParam int num, Model model) {
		ServiceBoardVO serviceboard = serviceBoardService.getServiceBoard(num);
		
		model.addAttribute("serviceBoardVO", serviceboard);
		return "serviceBoard/serviceBoardUpdateForm";
		
	}
	//수정 처리
	@PostMapping("/serviceBoard/serviceBoardUpdate.do")
	public String serviceBoardUpdateSubmit(@Valid ServiceBoardVO vo, BindingResult result) {
		//유효성 체크 결과 오류가 있으면 폼을 호출
		if(result.hasErrors()) {
			return "serviceBoard/serviceBoardUpdateForm";
			
		}
		serviceBoardService.serviceBoardUpdate(vo);
		return "redirect:/serviceBoard/serviceBoardList.do";
	}
	
	//글 삭제 폼
	@GetMapping("/serviceBoard/serviceBoardDelete.do")
	public String serviceBoardDeleteForm(@RequestParam int num, Model model) {
		ServiceBoardVO vo = new ServiceBoardVO();
		vo.setService_num(num);
		
		model.addAttribute("serviceBoardVO",vo);
		
		return "serviceBoard/serviceBoardDeleteForm";
	}
	//글 삭제 처리
	@PostMapping("/serviceBoard/serviceBoardDelete.do")
	public String serviceBoardDeleteSubmit(@Valid ServiceBoardVO vo, BindingResult result) {
		
		serviceBoardService.serviceBoardDelete(vo.getService_num());
		
		return "redirect:/serviceBoard/serviceBoardList.do";
	}
	
	
}
