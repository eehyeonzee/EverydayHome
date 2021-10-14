package kr.spring.store.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
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

import kr.spring.store.service.StoreService;
import kr.spring.store.vo.StoreVO;
import kr.spring.util.PagingUtil;

@Controller
public class StoreController {

	private static final Logger logger = LoggerFactory.getLogger(StoreController.class);
	private int rowCount = 20;
	private int pageCount = 10;
	
	@Autowired
	private StoreService storeService;
	
	// 자바빈 초기화
	@ModelAttribute
	public StoreVO initCommand() {
		return new StoreVO();
	}
	
	// 스토어 메인 호출
	@GetMapping("/store/storeMain.do")
	public String storeMain() {
		logger.debug("<<스토어 메인 호출>>");
		
		// 타일스 식별자
		return "storeMain";
	}
	
	// 상품 등록 폼 호출
	@GetMapping("/store/storeRegister.do")
	public String storeRegisterView() {
		logger.debug("<<상품 등록 호출>>");
		
		// 타일스 식별자
		return "storeRegister";
	}
	
	// 상품 등록 - 상품 등록 처리
	@PostMapping("/store/storeRegister.do")
	public String storeRegister(@Valid StoreVO storeVO, BindingResult result,
			                    HttpSession session) {
		logger.debug("<<상품 정보>>" + storeVO);
		
		// 유효성 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return storeRegisterView();
		}
		storeVO.setMem_num((Integer)session.getAttribute("user_num"));
		storeService.productRegister(storeVO);
		
		// 타일스 식별자
		return "redirect:/store/storeMain.do";
	}
	
	// 카테고리 페이지 출력
	@RequestMapping("/store/storeCategory.do")
	public ModelAndView process(@RequestParam(value="pageNum", defaultValue="1") int currentPage,
			@RequestParam(value="keyfield", defaultValue = "") String keyfield,
			@RequestParam(value="keyword", defaultValue = "") String keyword) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		
		// 글의 총 갯수 또는 검색된 글의 갯수
		int count = storeService.selectRowCount(map);
		
		logger.debug("<<count>> : " + count);
		
		// 페이지 처리
		PagingUtil page = new PagingUtil(keyfield, keyword, currentPage, count, rowCount, pageCount, "storeCategory.do");
		
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());
		
		List<StoreVO> list = null;
		if(count > 0) {
			list = storeService.selectList(map);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("storeCategory");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("pagingHtml", page.getPagingHtml());
		
		return mav;
	}
}
