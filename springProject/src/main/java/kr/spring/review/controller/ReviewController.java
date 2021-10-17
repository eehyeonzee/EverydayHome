package kr.spring.review.controller;

import java.util.List;

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
	@RequestMapping("member/myBuyList.do")
	public ModelAndView mybuylist(HttpSession session) {
		ModelAndView mav= new ModelAndView();
		Integer user_num = (Integer)session.getAttribute("user_num");
		int count = reviewService.reviewStoreCount(user_num);
		logger.debug("<<count>>:"+count);
		logger.debug("<<user_num>>:"+user_num);
		List<ReviewVO> list = null;
		//구매 내역 존재시
		if(count > 0) {
		//구매목록
		list = reviewService.reviewbuyList(user_num);
		//작성한 리뷰 목록
		List<ReviewVO> list2 = reviewService.reviewList(user_num);
		for(int i=0; i<list.size(); i++) {
			for(int j=0; j<list2.size(); j++) {
				// 리뷰작성한 제품은 1, 리뷰작성안한 제품은 0
				if(list.get(i).getProd_num() == list2.get(j).getProd_num()) {
					list.get(i).setOverlap(1);
				}else{
					list.get(i).setOverlap(0);
				};
				j++;
			}
			i++;
		}
		
		}
		logger.debug("<<list>>:"+list);
		logger.debug("<<count>>:"+count);
		mav.addObject("count",count);
		mav.addObject("list", list);
		mav.setViewName("myBuyList");
		
		return mav;
	}
	//리뷰 폼 호출
	
	//리뷰쓰기
	@RequestMapping("member/reviewWrite.do")
	public String reviewWrite(@ModelAttribute ReviewVO review, HttpSession session) {
		Integer user_num = (Integer)session.getAttribute("user_num");
		review.setMem_num(user_num);
		//중복리뷰 방지
		if(review.getOverlap()==1) {
			return "redirect:reviewWrite.do";
		}else {
			reviewService.reviewInsert(review);
		}
		return "redirect:reviewWrite.do";
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
