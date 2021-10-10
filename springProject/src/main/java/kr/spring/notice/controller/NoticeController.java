package kr.spring.notice.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
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

import kr.spring.notice.service.NoticeService;
import kr.spring.notice.vo.NoticeVO;
import kr.spring.util.PagingUtil;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@ModelAttribute
	public NoticeVO initCommand() {

		return new NoticeVO();
	}
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	//공지 리스트 출력
	@RequestMapping("notice/noticeList.do")
	public ModelAndView noticeList(@RequestParam(value="pageNum",defaultValue="1") int currentPage) {
		
		//총 레코드 수
		int count = noticeService.noticeTotalCount();
		
		PagingUtil page = new PagingUtil(currentPage, count ,10, 10, "notice/noticeList.do");
		
		List<NoticeVO> list = null;
		
		if(count > 0) {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("start", page.getStartCount());
			map.put("end", page.getEndCount());
			
			list = noticeService.noticeGetList(map);
		}
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/notice/noticeList");
		mav.addObject("count",count);
		mav.addObject("list",list);
		mav.addObject("pagingHtml",page.getPagingHtml());
		
		return mav;
	}
	//공지 상세정보가기
	@GetMapping("notice/noticeDetail.do")
	public ModelAndView noticeDetail(@RequestParam(value="notice_num") int notice_num) {
		NoticeVO notice = noticeService.noticeDetail(notice_num);
		return new ModelAndView("/notice/noticeDetail","notice",notice);
	}
	
	//공지 작성하기
	@GetMapping("/notice/noticeWrite.do")
	//글쓰기 폼 호출
	public String form() {
		return "/notice/noticeWrite";
	}
	
	@PostMapping("/notice/noticeWrite.do")
	public String submit(@Valid NoticeVO noticeVo, BindingResult result) {
		logger.debug("<<공지정보>> : " + noticeVo);

		if(result.hasErrors()) {
			return form();
		}
		/*
		vo.setMem_num((Integer)session.getAttribute("mem_num"));
		 * if(vo.getMem_num()!=3) { return form(); }
		 */
		noticeService.noticeWrite(noticeVo);
		
		return "redirect:noticeList.do";
	}
	
	//공지 수정폼 호출
	@GetMapping("/notice/noticeUpdate.do")
	public String updateForm(@RequestParam int notice_num, Model model) {
		
		NoticeVO noticeVO=noticeService.noticeDetail(notice_num);
		
		model.addAttribute("noticeVO", noticeVO);
		
		return "notice/noticeUpdate";
	}
	
	@PostMapping("/notice/noticeUpdate.do")
	public String submitUpdate(@Valid NoticeVO noticeVO, BindingResult result) {
		
		noticeService.noticeUpdate(noticeVO);
		
		return "redirect:noticeList.do";
	}
	
	
}
