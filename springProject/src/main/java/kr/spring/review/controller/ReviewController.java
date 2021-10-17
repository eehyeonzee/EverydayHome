package kr.spring.review.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.review.service.ReviewService;
import kr.spring.review.vo.ReviewVO;


@Controller
public class ReviewController {
	@Autowired
	private ReviewService reviewService;
	
	@ModelAttribute
	public ReviewVO initCommain() {
		return new ReviewVO();
	}
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	//구매목록
	@RequestMapping("/member/myBuyList.do")
	public ModelAndView mybuylist(HttpSession session) {
		ModelAndView mav= new ModelAndView();
		Integer user_num = (Integer)session.getAttribute("user_num");
		int count = reviewService.reviewMyCount(user_num);
		logger.debug("<<count>>:"+count);
		logger.debug("<<user_num>>:"+user_num);
		List<ReviewVO> list = null;
		//구매 내역 존재시
		if(count > 0) {
		list = reviewService.reviewbuyList(user_num);
		}
		logger.debug("<<list>>:"+list);
		logger.debug("<<count>>:"+count);
		mav.addObject("count",count);
		mav.addObject("list", list);
		mav.setViewName("myBuyList");
		
		return mav;
	}
	
	//리뷰 폼 호출
	@PostMapping("/member/reviewCheck.do")
	@ResponseBody
	public String reviewCheck(@ModelAttribute("review") ReviewVO review ,HttpSession session){
		
		logger.debug("<<get.prod_num>>" + review.getProd_num());
		int mem_num= (Integer)session.getAttribute("user_num");
		
		logger.debug("<<mem_num>>"+mem_num);
			int count = reviewService.reviewExist(mem_num,review.getProd_num());
			logger.debug("<<count>>:"+count);
			int orderCheck = 0;
			if(count==0) { //리뷰쓴적 없음
				orderCheck= reviewService.orderExist(mem_num,review.getProd_num()); //구매내역있는지 확인
				logger.debug("<<채크>>:"+orderCheck);
				if(orderCheck == 0) {
					return "1";
				}//주문한적없음
				return "2";
			}else {//리뷰쓴적있음
				return "3";
			}
	}
	@GetMapping("member/reviewWrite.do")
	public String reviewWriteform() {
		return "reviewForm";
	}
	//리뷰쓰기
	@PostMapping("member/reviewWrite.do")
	public String reviewWrite(@ModelAttribute ReviewVO review, HttpSession session) {
		Integer user_num = (Integer)session.getAttribute("user_num");
		review.setMem_num(user_num);
		//중복리뷰 방지
			reviewService.reviewInsert(review);
		return "redirect:myReviewList.do";
	}
	//리뷰쓴목록
	@RequestMapping("member/myReviewList.do")
	public ModelAndView myReviewList(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Integer user_num = (Integer)session.getAttribute("user_num");
		List<ReviewVO> list = reviewService.reviewList(user_num);
		
		mav.addObject("list",list);
		mav.setViewName("myReviewList");
		return mav;

	}
	//리뷰수정
	//리뷰삭제하기
	@GetMapping("member/reviewDelete.do")
	public String delete(@RequestParam int rev_num) {
		reviewService.reviewDelete(rev_num);
		return "redirect:myReviewList.do";
	}
	
	//상품상세페이지에서 리뷰보기
	//이미지출력
	//글 수정시 이미지삭제
	//리뷰 삭제하기
}
