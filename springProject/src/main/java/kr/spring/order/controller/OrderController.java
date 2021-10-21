package kr.spring.order.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
		Integer check = (Integer)session.getAttribute("user_num");
		
		if(check != null) {
			// 로그인한 회원의 정보를 주문 테이블에 세팅
			member.setMem_num((Integer)session.getAttribute("user_num"));
			order.setMem_num(member.getMem_num());
			member = memberService.selectMember(member.getMem_num());
			model.addAttribute("memberVO", member);
		}
		// 수량 정보를 가져 옴
		Integer quan = Integer.parseInt(request.getParameter("quan"));
		// 상품 옵션 정보를 가져 옴
		String prod_option = request.getParameter("prod_option");
		
		logger.debug("<<회원 정보>> : " + member.getMem_num());
		
		storeVO = storeService.selectProduct(storeVO.getProd_num());
		
		// 수량 정보 세팅
		storeVO.setQuan(quan);
		// 상품 옵션 세팅
		storeVO.setCommit_option(prod_option);
		 
		logger.debug("<<주문 내용 삽입 멤버 정보>> : " + member);
		logger.debug("<<주문 내용 삽입 상품 정보>> : " + storeVO);
		 
		model.addAttribute("storeVO", storeVO);
		
		// 타일스 식별자
		return "orderMain";
	}
	
	@RequestMapping("/order/kakao.do")
	@ResponseBody
	public String kakaopay(OrderVO orderVO, HttpServletRequest request) {
		
		try {
			URL url = new URL("https://kapi.kakao.com/v1/payment/ready");
			
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "KakaoAK 023a91daaf2d3e17aca5d8af0d4739a8");
			conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			conn.setDoOutput(true);
			
			String receiver_name = request.getParameter("receiver_name");
			orderVO.setReceiver_name(receiver_name);
			String receiver_phone = request.getParameter("receiver_phone");
			orderVO.setReceiver_phone(receiver_phone);
			String order_zipcode = request.getParameter("order_zipcode");
			orderVO.setOrder_zipcode(order_zipcode);
			String order_address1 = request.getParameter("order_address1");
			orderVO.setOrder_address1(order_address1);
			String order_address2 = request.getParameter("order_address2");
			orderVO.setOrder_address2(order_address2);
			String buis_name = request.getParameter("buis_name");
			orderVO.setBuis_name(buis_name);
			String prod_name = request.getParameter("prod_name");
			orderVO.setProd_name(prod_name);
			int pay_price = Integer.parseInt(request.getParameter("final_price"));
			orderVO.setPay_price(pay_price);
			int quan = Integer.parseInt(request.getParameter("quan"));
			orderVO.setPay_quan(quan);
			String prod_opt = request.getParameter("commit_option");
			orderVO.setProd_opt(prod_opt);
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("cid", "TC0ONETIME");
			map.put("partner_order_id", "partner_order_id");
			map.put("partner_user_id", orderVO.getBuis_name());
			map.put("item_name", orderVO.getProd_name());
			map.put("quantity", String.valueOf(orderVO.getPay_quan()));
			map.put("total_amount", String.valueOf(orderVO.getPay_price()));
			map.put("tax_free_amount", "0");
			map.put("approval_url", "http://localhost:8081/EverydayHome/main/main.do");
			map.put("fail_url", "http://localhost:8081/EverydayHome/member/login.do");
			map.put("cancel_url", "http://localhost:8081/EverydayHome/store/storeCategory.do");
			
			String params = new String();
			for(Map.Entry<String, String> emap : map.entrySet()) {
				params += (emap.getKey() + "=" + emap.getValue() + "&");
			}
			
			OutputStream os = conn.getOutputStream();
			DataOutputStream dos = new DataOutputStream(os);
			dos.writeBytes(params);
			dos.flush();
			dos.close();
			
			int result = conn.getResponseCode();
			logger.debug("result" + result);
			
			InputStream is;
			
			if(result == 200) {
				is = conn.getInputStream();
			}else {
				is = conn.getErrorStream();
			}
			
			InputStreamReader isr = new InputStreamReader(is);
			BufferedReader br = new BufferedReader(isr);
			
			return br.readLine();
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "{\"result\":\"NO\"}";
	}
	
}
