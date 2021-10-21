package kr.spring.main.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.spring.houseBoard.service.HouseBoardService;
import kr.spring.houseBoard.vo.HouseBoardVO;
import kr.spring.util.PagingUtil;


@Controller
public class MainController {
	
	@Autowired
	private HouseBoardService houseService;
	
	
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	
	@RequestMapping("/main/main.do")
	public String main(Model model) {
		
		Map<String, Object>map = new HashMap<String, Object>();
		
		int count = houseService.selectRowCount(map);
		
		logger.debug("<<count>>: " + count);
		
		PagingUtil page = new PagingUtil(1, count, 12, 10, null);
		
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());
		
		List<HouseBoardVO> HList = null;
		if(count>0) {
			HList = houseService.selectHBoardList(map);
			logger.debug("<<house list>>" + HList);
			
			//request에 저장
			model.addAttribute("count", count);
			model.addAttribute("HList", HList);
			
		}
				
		return "main"; //타일스 식별자
	}

}
