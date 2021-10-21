package kr.spring.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

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
	public String orderPage(OrderVO order, MemberVO member, StoreVO storeVO, HttpServletRequest request, HttpSession session, Model model) {
		
		logger.debug("<<주문 페이지 호출>>");
		
		// 로그인한 회원의 정보를 세팅
		member.setMem_num((Integer)session.getAttribute("user_num"));
		// 로그인한 회원의 정보를 주문 테이블에 세팅
		order.setMem_num(member.getMem_num());
		// 수량 정보를 가져 옴
		Integer quan = Integer.parseInt(request.getParameter("quan"));
		// 상품 옵션 정보를 가져 옴
		String prod_option = request.getParameter("prod_option");
		
		logger.debug("<<회원 정보>> : " + member.getMem_num());
		
		member = memberService.selectMember(member.getMem_num());
		storeVO = storeService.selectProduct(storeVO.getProd_num());
		
		// 수량 정보 세팅
		storeVO.setQuan(quan);
		// 상품 옵션 세팅
		storeVO.setCommit_option(prod_option);
		 
		logger.debug("<<주문 내용 삽입 멤버 정보>> : " + member);
		logger.debug("<<주문 내용 삽입 상품 정보>> : " + storeVO);
		 
		model.addAttribute("memberVO", member);
		model.addAttribute("storeVO", storeVO);
		
		// 타일스 식별자
		return "orderMain";
	}
	
}
