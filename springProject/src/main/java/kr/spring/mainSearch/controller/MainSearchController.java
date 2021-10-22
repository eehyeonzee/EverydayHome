package kr.spring.mainSearch.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.event.service.EventService;
import kr.spring.houseBoard.service.HouseBoardService;
import kr.spring.houseBoard.vo.HouseBoardVO;
import kr.spring.store.service.StoreService;
import kr.spring.util.PagingUtil;

@Controller
public class MainSearchController {
	
	@Autowired
	private HouseBoardService houseBoardService;
	
	@Autowired
	private EventService eventService;
	
	@Autowired
	private StoreService storeService;
	
	// HouseBoardVO 객체 초기화
	 @ModelAttribute
	 public HouseBoardVO initCommand1() {
		 
	    return new HouseBoardVO();
	 }
		 
	
	private static final Logger logger = LoggerFactory.getLogger(MainSearchController.class);

	// 통합 검색 화면 호출
	@GetMapping("/mainSearch/mainSearch.do")
	public ModelAndView mainAllSearchCall(
			@RequestParam(value="housePageNum", defaultValue="1") int houseCurrentPage,
			@RequestParam(value="eventPageNum", defaultValue="1") int eventcurrentPage,
			@RequestParam(value="storePageNum", defaultValue="1") int storecurrentPage,
			@RequestParam(value="keyfield", defaultValue="1") String keyfield,
			@RequestParam(value="keyword", defaultValue="") String keyword) {
				
		//------------------------ 사진게시판 부분 ------------------------//
		
		Map<String,Object> hmap = new HashMap<String,Object>();
		hmap.put("keyfield", keyfield);
		hmap.put("keyword", keyword);
		
		// 사진게시판 검색 글 총 개수
		int houseCount = houseBoardService.selectAllSearchRowCount(hmap);
		logger.debug("<<사진 맵>> : " + hmap.toString());
		logger.debug("<<houseCount>> : " + houseCount);
		
		// 사진게시판 페이지 처리
		PagingUtil housePage = new PagingUtil(houseCurrentPage,houseCount,4,5,"mainSearch.do");	// 나중에 URL 수정
		
		hmap.put("start", housePage.getStartCount());
		hmap.put("end", housePage.getEndCount());
		
		List<HouseBoardVO> houseList = null;
		if(houseCount > 0) {
			houseList = houseBoardService.selectAllSearchList(hmap);
		}
		
		//------------------------ 이벤트 부분 ------------------------//
		
		
		
		// 전달 객체
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mainSearch"); // 타일스 식별자
		
		// 사진게시판
		mav.addObject("houseCount", houseCount);
		mav.addObject("houseList", houseList);
		mav.addObject("housePagingHtml", housePage.getPagingHtml());
		
		// 이벤트
//		mav.addObject("eventCount", eventCount);
//		mav.addObject("eventList", eventList);
//		mav.addObject("eventPagingHtml", eventPage.getPagingHtml());
		
		// 상품
//		mav.addObject("productCount", productCount);
//		mav.addObject("productList", productList);
//		mav.addObject("productPagingHtml", productPage.getPagingHtml());
		
		
		// 현재 검색어 출력
		mav.addObject("keyword", keyword);
		mav.addObject("keyfield", keyfield);
		
		
		return mav;
				
		
	}
	 
}
