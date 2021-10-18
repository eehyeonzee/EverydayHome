package kr.spring.review.controller;

import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.bind.annotation.PostMapping;
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
	@RequestMapping("/review/myBuyList.do")
	public ModelAndView mybuylist(HttpSession session) {
		ModelAndView mav= new ModelAndView();
		Integer user_num = (Integer)session.getAttribute("user_num");
		int count = reviewService.reviewBuyCount(user_num);
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
	@PostMapping("/review/reviewCheck.do")
	public String reviewCheck(@ModelAttribute("review") ReviewVO review ,HttpSession session, HttpServletRequest request,Model model){
		
		logger.debug("<<get.prod_num>>" + review.getProd_num());
		int mem_num= (Integer)session.getAttribute("user_num");
		logger.debug("<<mem_num>>"+mem_num);
			int prod_num = review.getProd_num();
			int count = reviewService.reviewExist(mem_num,review.getProd_num());
			logger.debug("<<count>>:"+count);
			int orderCheck = 0;
			if(count==0) { //리뷰쓴적 없음
				orderCheck= reviewService.orderExist(mem_num,review.getProd_num()); //구매내역있는지 확인
				logger.debug("<<채크>>:"+orderCheck);
				if(orderCheck == 0) {
					model.addAttribute("message", "구매정보가 없습니다..");
					model.addAttribute("url", request.getContextPath() + "/store/storeCategory.do"); 
					return "common/resultView";
				}//주문한적없음
				model.addAttribute("prod_num","prod_num");
				model.addAttribute("message", "리뷰작성하시겠습니까?");
				model.addAttribute("url", request.getContextPath() + "/review/reviewForm.do?prod_num="+prod_num); 
				return "common/resultView";
			}else {//리뷰쓴적있음
				model.addAttribute("message", "작성한 리뷰를 확인하시겠습니까?");
				model.addAttribute("url", request.getContextPath() + "/review/reviewList.do"); 
				return "common/resultView";
			}
	}
	//리뷰작성폼 호출 별점도 호출
	@GetMapping("/review/reviewForm.do")
	public String reviewWriteform(@RequestParam int prod_num, HttpSession session, Model model) {
		logger.debug("<<제품번호>>:"+prod_num);
		
		ReviewVO reviewVO = reviewService.productDetail(prod_num);
		Integer mem_num = (Integer)session.getAttribute("user_num");
		model.addAttribute("reviewVO",reviewVO);
		model.addAttribute("mem_num",mem_num);
		model.addAttribute("prod_num",prod_num);
		Map<Object,String> ratingOptions = new HashMap<Object,String>();
		ratingOptions.put(0, "☆☆☆☆☆");
		ratingOptions.put(1, "★☆☆☆☆");
		ratingOptions.put(2, "★★☆☆☆");
		ratingOptions.put(3, "★★★☆☆");
		ratingOptions.put(4, "★★★★☆");
		ratingOptions.put(5, "★★★★★");
		model.addAttribute("ratingOptions", ratingOptions);
		logger.debug("<<제품번호>>:"+reviewVO);
		return "reviewForm";
	}
	//리뷰쓰기
	@PostMapping("/review/reviewWrite.do")
	public String reviewWrite(@ModelAttribute ReviewVO review, HttpSession session, HttpServletRequest request, Model model) {
		Integer user_num = (Integer)session.getAttribute("user_num");
		review.setMem_num(user_num);
		//중복리뷰 방지
			reviewService.reviewInsert(review);
			
			model.addAttribute("message", "리뷰가 작성되었습니다.");
			model.addAttribute("url", request.getContextPath() + "/review/myBuyList.do"); 
			return "common/resultView";
	}
	//리뷰쓴목록
	@RequestMapping("/review/reviewList.do")
	public ModelAndView myReviewList(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Integer mem_num = (Integer)session.getAttribute("user_num");
		int count = reviewService.reviewMyCount(mem_num);
		List<ReviewVO> list = reviewService.reviewList(mem_num);
		
		mav.addObject("count",count);
		mav.addObject("list",list);
		mav.setViewName("reviewList");
		return mav;

	}
	//리뷰수정
	//리뷰삭제하기
	@GetMapping("/review/reviewDelete.do")
	public String delete(@RequestParam int rev_num) {
		reviewService.reviewDelete(rev_num);
		return "redirect:myReviewList.do";
	}
	
	//상품상세페이지에서 리뷰보기
	//이미지출력
	@GetMapping("/review/imageView.do")
	public ModelAndView viewImage(@RequestParam int review_num) {
		
		ReviewVO review =reviewService.reviewDetail(review_num);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("imageView");
		                //속성명         속성값(byte[]의 데이터)     
		mav.addObject("imageFile", review.getRev_img());
		mav.addObject("filename", review.getRev_filename());
		
		return mav;
	}
	//글 수정시 이미지삭제
	//리뷰 삭제하기
}
