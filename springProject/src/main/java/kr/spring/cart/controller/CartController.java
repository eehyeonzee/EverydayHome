package kr.spring.cart.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.cart.service.CartService;
import kr.spring.cart.vo.CartVO;

@Controller
public class CartController {

	@Autowired
	private CartService cartService;
	
	@ModelAttribute
	public CartVO initCommand() {
		return new CartVO();
	}
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	
	//장바구니 목록
	@RequestMapping("cart/cartList.do")
	public ModelAndView cartList(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Integer user_num = (Integer)session.getAttribute("user_num");
		logger.debug("<<user_num>>" + user_num);
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<CartVO> list = cartService.cartList(user_num);
		int sumMoney = cartService.sumMoney(user_num);
		//장바구니 전체 금액에 따라 배송비 구분
		//배송료 10만원 이상 =>무료 미만 => 2500원
		int fee = sumMoney >= 100000 ? 0 : 2500;
		map.put("sumMoney",sumMoney);
		map.put("fee", fee);
		map.put("allSum", sumMoney+fee);
		map.put("list",list);
		map.put("count",list.size());
		mav.addObject("map",map);
		mav.setViewName("cartList");
		logger.debug("<<count>>:" + list.size());
		return mav;
	}
	
	//장바구니 추가
	@RequestMapping("cart/cartInsert.do")
	public String cartInsert(@ModelAttribute CartVO cart, HttpSession session) {
		Integer user_num = (Integer)session.getAttribute("user_num");
		cart.setMem_num(user_num);
		//장바구니에 지금 추가하려는 상품이 있는지 확인
		int count = cartService.cartCount(cart.getProd_num(),user_num);
		// 카운트가 
		if(count ==0) {
			//없으면 insert
			cartService.cartInsert(cart);
		}else {
			cartService.CurrentUpdate(cart);
		}
		return "redirect:cartList.do";
		//장바구니에 추가되었습니다. 장바구니로 가시겠습니까? 하면 장바구니로 가게하고 취소를 누르면 그 페이지 그대로 남아있도록하기.
	}
	//장바구니 삭제
	@GetMapping("cart/cartDelete.do")
	public String delete(@RequestParam int cart_num) {
		cartService.cartDelete(cart_num);
		return "redirect:cartList.do";
	}
	//장바구니 수정
	@RequestMapping("cart/cartUpdate.do")
	public String cartUpdate(@RequestParam int[] cart_quan, @RequestParam int[] prod_num, HttpSession session) {
		//session에서 유저 번호 알아옴
		Integer user_num = (Integer)session.getAttribute("user_num");
		for(int i=0; i<prod_num.length; i++) {
			CartVO cart = new CartVO();
			cart.setMem_num(user_num);
			cart.setProd_num(prod_num[i]);
			cart.setCart_quan(cart_quan[i]);
			cartService.cartUpdate(cart);
			logger.debug ("<<cartUpdate>>: " +cart);
		}
		
		return "redirect:cartList.do";
	}
}
