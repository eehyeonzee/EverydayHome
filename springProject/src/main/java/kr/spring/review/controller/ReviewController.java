package kr.spring.review.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;

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
	//리뷰쓰기
	//리뷰쓴목록
	//리뷰수정
	//리뷰삭제하기
	//상품상세페이지에서 리뷰보기
	//이미지출력
	//글 수정시 이미지삭제
	//리뷰 삭제하기
}
