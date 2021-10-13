package kr.spring.main.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MainController {
	
	/*
	 * @Autowired private StoreService storeService;
	 */
	
	@RequestMapping("/main/main.do")
	public String main() {
		return "main"; //타일스 식별자
	}
	//구현시 
	/*
	 * @GetMapping("/main/main.do") public String rank(String ActiveTab) {
	 * if(ActiveTab == null) ActiveTab = ""; StringBuffer result = new
	 * StringBuffer(""); result.append("{\result\":["); ArrayList<StoreVO> rankList
	 * =storeService.getrank(ActiveTab); for(int i=0; i<3; i++) {
	 * result.append("[{\"name\": \"" + rankList.get(i).getProd_name()+"\"},");
	 * result.append("[{\"price\": \"" + rankList.get(i).getProd_price()+"\"},");
	 * result.append("[{\"img\": \"" + rankList.get(i).getProd_img()+"\"},");
	 * 
	 * } result.append("]}"); return result.toString(); }
	 */
}
