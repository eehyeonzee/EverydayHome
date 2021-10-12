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
	public ModelAndView noticeList(@RequestParam(value="pageNum",defaultValue="1") int currentPage,HttpSession session) {
		
		//총 레코드 수
		int count = noticeService.noticeTotalCount();
		//페이징 처리
		PagingUtil page = new PagingUtil(currentPage, count ,10, 10, "/EverydayHome/notice/noticeList.do");
		//목록출력
		List<NoticeVO> list = null;
		//만약 글이 있을 시
		if(count > 0) {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("start", page.getStartCount());
			map.put("end", page.getEndCount());
			
			list = noticeService.noticeGetList(map);
		}
		
		//권한정보 받아오기
		Integer user_auth = (Integer)session.getAttribute("user_auth");
		//전달 객체 생성
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("noticeList");
		mav.addObject("count",count);
		mav.addObject("list",list);
		mav.addObject("pagingHtml",page.getPagingHtml());
		mav.addObject("user_auth",user_auth);
		return mav;
	}
	//공지 상세정보가기
	@GetMapping("notice/noticeDetail.do")
	public ModelAndView noticeDetail(@RequestParam(value="notice_num") int notice_num,HttpSession session) {
		//조회수 증가 처리
		//상세정보 저장
		NoticeVO notice = noticeService.noticeDetail(notice_num);
		//권한정보저장
		Integer user_num=(Integer)session.getAttribute("user_auth");
		//mav객체생성
		ModelAndView mav= new ModelAndView();
		//갈 페이지 앨리어스
		mav.setViewName("noticeDetail");
		//보낼 데이터 정보
		mav.addObject("notice", notice);
		mav.addObject("user_num",user_num);
		
		return mav;
	}
	
	//공지 작성하기
	@GetMapping("/notice/noticeWrite.do")
	//글쓰기 폼 호출
	public String form() {
		return "noticeWrite";
	}
	
	@PostMapping("/notice/noticeWrite.do")
	public String submit(@Valid NoticeVO noticeVo, BindingResult result, HttpSession session) {
		logger.debug("<<공지정보>> : " + noticeVo);

		if(result.hasErrors()) {
			return form();
		}
		noticeService.noticeWrite(noticeVo);
		
		return "redirect:noticeList.do";
	}
	
	//공지 수정폼 호출
	@GetMapping("/notice/noticeUpdate.do")
	public String updateForm(@RequestParam int notice_num, Model model, HttpSession session ) {
		
		NoticeVO noticeVO=noticeService.noticeDetail(notice_num);
		
		Integer user_auth = (Integer)session.getAttribute("user_auth");
		
		model.addAttribute("noticeVO", noticeVO);
		model.addAttribute("user_num",user_auth);
		return "noticeUpdate";
	}
	
	@PostMapping("/notice/noticeUpdate.do")
	public String submitUpdate(@Valid NoticeVO noticeVO, BindingResult result) {
		
		noticeService.noticeUpdate(noticeVO);
		
		return "redirect:noticeList.do";
	}
	//공지 삭제하기
	@GetMapping("/notice/noticeDelete.do")
	public String deleteForm(@RequestParam int notice_num, HttpSession session) {
		
		noticeService.noticeDelete(notice_num);
		return "redirect:noticeList.do";
		}
	
}
