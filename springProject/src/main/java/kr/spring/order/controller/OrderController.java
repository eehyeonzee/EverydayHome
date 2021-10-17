package kr.spring.order.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;
import kr.spring.order.service.OrderService;
import kr.spring.order.vo.OrderVO;
import kr.spring.store.service.StoreService;
import kr.spring.store.vo.StoreVO;

@Controller
public class OrderController {
	
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@Autowired
	private OrderService orderService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private StoreService storeService;
	
	// 자바빈 초기화
	@ModelAttribute
	public OrderVO initCommand() {
		return new OrderVO();
	}
	
	// 주문 메인 호출
	@GetMapping("/order/orderMain.do")
	public String orderPage() {
		logger.debug("<<주문 페이지 호출>>");
		
		// 타일스 식별자
		return "orderMain";
	}
	
	// 주문 테이블에 주문 내용 삽입
	
	@RequestMapping(value = "/order/orderMain.do", method = RequestMethod.POST)
	public String orderInsert(StoreVO storeVO, HttpSession session, Model model, @ModelAttribute("order_quan") String order_quan) {
		 
		MemberVO member = (MemberVO)session.getAttribute("user_num"); 
		member = memberService.selectMember(member.getMem_num());
		storeVO = storeService.selectProduct(storeVO.getProd_num());
		  
		logger.debug("<<주문 내용 삽입 멤버 정보>> : " + member);
		logger.debug("<<주문 내용 삽입 상품 정보>> : " + storeVO);
		 
		model.addAttribute("memberInfo", member); model.addAttribute("productInfo", storeVO); 
		model.addAttribute("order_quan", order_quan);
		 
		return "/order/orderMain"; 
	}

}
