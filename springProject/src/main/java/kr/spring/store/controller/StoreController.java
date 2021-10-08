package kr.spring.store.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StoreController {

	private static final Logger logger = LoggerFactory.getLogger(StoreController.class);
	
	// 스토어 메인 호출
	@GetMapping("/store/storeMain.do")
	public String storeMain() {
		logger.debug("<<스토어 메인 호출>>");
		
		return "storeMain";
	}
}
