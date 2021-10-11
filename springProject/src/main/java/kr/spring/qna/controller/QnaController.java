package kr.spring.qna.controller;

import java.util.List;

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

import kr.spring.qna.service.QnaService;
import kr.spring.qna.vo.QnaVO;
import kr.spring.util.PagingUtil;

@Controller
public class QnaController {
	//로그 처리 (로그 대상 지정)
		private static final Logger log = LoggerFactory.getLogger(QnaController.class);
		
		@Autowired
		private QnaService qnaService;
		
		//자바빈 초기화
		@ModelAttribute
		public QnaVO initCommand() {
			return new QnaVO();
		}
		
		@GetMapping("/qna/qnaInsert.do")
		//글쓰기 폼 호출
		public String qnaInsert() {
			log.debug("<<글쓰기 폼 호출>>");
			
			return "qna/qnaInsert";
		}
		//글쓰기 처리
		@PostMapping("/qna/qnaInsert.do")
		public String qnaInsertSubmit(@Valid QnaVO vo, BindingResult result) {
			//유효성 체크 결과 오류가 있으면 폼 호출
			if(result.hasErrors()) {
				return qnaInsert();
			}
			//글쓰기
			qnaService.qnaInsert(vo);
			
			return "redirect:/qna/qnaList.do";
		}

		/*
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
			mav.setViewName("serviceBoardList");
			
			//데이터 저장
			mav.addObject("count",count);
			mav.addObject("list", list);
			mav.addObject("pagingHtml", page.getPagingHtml());
			
			return mav;
			
		}
				
		//글 상세
		@RequestMapping("/serviceBoard/serviceBoardDetail.do")
		public ModelAndView serviceBoardDetail(@RequestParam int num) {
			QnaVO serviceboard = serviceBoardService.getServiceBoard(num);
									//뷰 이름					//속성명		//속성값
			return new ModelAndView("/serviceBoard/serviceBoardDetail","serviceboard","serviceboard");
		}
		
		//수정폼
		@GetMapping("/serviceBoard/serviceBoardUpdate.do")
		public String serviceBoardUpdateForm(@RequestParam int num, Model model) {
			ServiceBoardVO serviceboard = serviceBoardService.getServiceBoard(num);
			
			model.addAttribute("serviceBoardVO", serviceboard);
			return "serviceBoardUpdateForm";
			
		}
		//수정 처리
		@PostMapping("/serviceBoard/serviceBoardUpdate.do")
		public String serviceBoardUpdateSubmit(@Valid ServiceBoardVO vo, BindingResult result) {
			//유효성 체크 결과 오류가 있으면 폼을 호출
			if(result.hasErrors()) {
				return "serviceBoardUpdateForm";
				
			}
			serviceBoardService.serviceBoardUpdate(vo);
			return "redirect:/serviceBoardList.do";
		}
		
		//글 삭제 폼
		@GetMapping("/serviceBoard/serviceBoardDelete.do")
		public String serviceBoardDeleteForm(@RequestParam int num, Model model) {
			QnaVO vo = new QnaVO();
			vo.setService_num(num);
			
			model.addAttribute("serviceBoardVO",vo);
			
			return "serviceBoardDeleteForm";
		}
		//글 삭제 처리
		@PostMapping("/serviceBoard/serviceBoardDelete.do")
		public String serviceBoardDeleteSubmit(@Valid ServiceBoardVO vo, BindingResult result) {
			
			serviceBoardService.serviceBoardDelete(vo.getService_num());
			
			return "redirect:/serviceBoardList.do";
		}
		
		*/
}
