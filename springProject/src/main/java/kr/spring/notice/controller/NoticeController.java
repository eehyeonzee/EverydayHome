package kr.spring.notice.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
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
}
