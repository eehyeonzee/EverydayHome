package kr.spring.store.controller;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import kr.spring.store.service.StoreService;
import kr.spring.store.vo.StoreVO;

@Controller
public class StoreController {

	private static final Logger logger = LoggerFactory.getLogger(StoreController.class);
	
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
	public String storeRegister(@Valid StoreVO storeVO, BindingResult result) {
		logger.debug("<<상품 정보>>" + storeVO);
		
		// 유효성 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return storeRegisterView();
		}
		
		storeService.productRegister(storeVO);
		
		// 타일스 식별자
		return "redirect:/store/storeMain.do";
	}
}
