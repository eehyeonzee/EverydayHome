package kr.spring.houseBoard.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.houseBoard.service.HouseBoardService;
import kr.spring.houseBoard.vo.HouseBoardVO;
import kr.spring.util.PagingUtil;

/**
 * @Package Name   : kr.spring.houseBoard.controller
 * @FileName  : HouseBoardController.java
 * @작성일       : 2021. 10. 10. 
 * @작성자       : 이현지
 * @프로그램 설명 : 집들이 게시판 컨트롤러
 */

@Controller
public class HouseBoardController {
	
	// 로그 처리(로그 대상 지정)
	private static final Logger logger = LoggerFactory.getLogger(HouseBoardController.class);
	
	// 게시물, 페이지 카운트 지정
	private int rowCount = 12;
	private int pageCount = 7;
	
	@Autowired
	private HouseBoardService houseBoardService;
	
	// 자바빈(VO) 초기화
	@ModelAttribute
	public HouseBoardVO initCommand() { // 속성명 지정 안 하면 houseBoardVO로 알아서 앞글자가 소문자로 변환
		return new HouseBoardVO();
	}
	
	// 글쓰기 - 폼 호출
	@GetMapping("/houseBoard/write.do")
	public String form() {
		return "houseBoardWrite"; // 타일스 식별자
	}
	
	// 글쓰기 - 전송된 데이터 처리
	@PostMapping("/houseBoard/write.do")
	public String submit(@Valid HouseBoardVO houseBoardVO, BindingResult result, HttpSession session) {
		
		logger.debug("<<글쓰기>> : " + houseBoardVO);
		
		// 유효성 체크 결과 오류가 있으면 폼을 호출
		if(result.hasErrors()) {
			return form();
		}
		
		// 회원번호 세팅
		houseBoardVO.setMem_num((Integer)session.getAttribute("user_num"));
		// 글쓰기
		houseBoardService.insertHBoard(houseBoardVO);
		
		return "redirect:/houseBoard/list.do";
	}
	
	// 글 목록
	@RequestMapping("/houseBoard/list.do")
	public ModelAndView Process(@RequestParam(value="pageNum", defaultValue="1") int currentPage,
								@RequestParam(value="keyfield", defaultValue="") String keyfield,
								@RequestParam(value="keyword", defaultValue="") String keyword) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		
		// 글의 총 개수 또는 검색된 글의 개수
		int count = houseBoardService.selectRowCount(map);
		
		logger.debug("<<count>> : " + count);
		
		// 페이지 처리
		PagingUtil page = new PagingUtil(keyfield,keyword,currentPage,count,rowCount,pageCount,"list.do");
		
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());
		
		List<HouseBoardVO> list = null;
		if(count > 0) {
			list = houseBoardService.selectHBoardList(map);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("houseBoardList"); // 타일스 식별자
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("pagingHtml", page.getPagingHtml());
		
		return mav;
	}
	
	// 글 상세
	
	// 이미지 출력
	@RequestMapping("/houseBoard/imageView.do")
	public ModelAndView viewImage(@RequestParam int house_num) {
		
		HouseBoardVO houseBoard = houseBoardService.selectHBoard(house_num);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("imageView"); // // imageView 빈 이름(id) 생성 -> mav가 클래스 파일(빈 객체) 찾아서 실행시켜줌
		//				속성명		속성값(byte[]의 데이터)
		mav.addObject("imageFile", houseBoard.getHouse_thumbnail());
		mav.addObject("imageFile", houseBoard.getHouse_img());
		mav.addObject("filename", houseBoard.getThumbnail_filename());
		mav.addObject("filename", houseBoard.getUpload_filename());
		
		return mav;
	}
	
	// 글 수정
	
	// 글 삭제
	
	
	
	/*
	// 로그 처리(로그 대상 지정)
	private static final Logger log = LoggerFactory.getLogger(HouseBoardController.class);
	
	@Autowired
	private HouseBoardService houseBoardService;
	
	// 자바빈(VO) 초기화
	@ModelAttribute
	public HouseBoardVO initCommand() {
		return new HouseBoardVO();
	}
	
	// 글쓰기 폼 호출
	@GetMapping("/houseBoard/houseBoardWrite.do")
	public String insertHBoardForm() {
		log.debug("<<글쓰기 폼 호출>>");
		return "houseBoardWrite"; // 타일스 식별자 호출
	}
	
	// 글 쓰기 처리
	@PostMapping("/houseBoard/houseBoardWrite.do")
	public String submitHBoard(@Valid HouseBoardVO houseBoardVO, BindingResult result) {
		
		// 유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return insertHBoardForm();
		}
		
		houseBoardService.insertHBoard(houseBoardVO);
		
		return "redirect:/houseBoard/houseBoardList.do";
	}
	
	// 글 목록
	@RequestMapping("/houseBoard/houseBoardList.do")
	public ModelAndView getHBoardList(@RequestParam(value="pageNum",defaultValue="1") int currentPage) {
		
		log.debug("<<currentPage>> : " + currentPage);
		
		// 총 레코드 수
		int count = houseBoardService.getHBoardCount();
		
		// 페이지 처리
		PagingUtil page = new PagingUtil(currentPage,count,12,5,"houseBoardList.do");
		
		// 목록 호출
		List<HouseBoardVO> list = null;
		if(count > 0) {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("start",page.getStartCount());
			map.put("end", page.getEndCount());
			
			list = houseBoardService.getHBoardList(map);
		}
		
		ModelAndView mav = new ModelAndView();
		// 뷰 이름 설정
		mav.setViewName("houseBoardList");
		// 데이터 저장
		mav.addObject("count",count);
		mav.addObject("list",list);
		mav.addObject("pagingHtml",page.getPagingHtml());
		
		return mav;
	}
	
	// 글 상세
	@RequestMapping("/houseBoard/houseBoardDetail.do")
	public ModelAndView getHBoardDetail(@RequestParam int house_num) { // 글번호 저장
		HouseBoardVO houseBoard = houseBoardService.getHBoard(house_num); // getHBoard에 글번호 전달
		houseBoard.setNickname(houseBoardService.getHBoardNick(houseBoard.getMem_num()));
		//								뷰 이름			속성명		속성값
		return new ModelAndView("houseBoardDetail", "houseBoard", houseBoard);
	}
	
	// 글 수정 폼
	@GetMapping("/houseBoard/houseBoardUpdate.do")
	public String updateHBoard(@RequestParam int house_num, Model model) { // Model -> 메소드 호출될 때 컨테이너가 객체를 주입해줌
		HouseBoardVO houseBoard = houseBoardService.getHBoard(house_num);
		// 데이터 저장				속성명			속성값
		model.addAttribute("houseBoardVO", houseBoard);
		
		return "houseBoardUpdate";
	}
	
	// 글 수정 처리
	@PostMapping("/houseBoard/houseBoardUpdate.do")
	public String submitUpdate(@Valid HouseBoardVO houseBoard, BindingResult result) {
		// 유효성 체크 결과 오류가 있으면 폼을 호출
		if(result.hasErrors()) {
			return "houseBoardUpdate";
		}
		
		houseBoardService.updateHBoard(houseBoard);
		
		return "redirect:/houseBoard/houseBoardList.do";
	}
	
	// 글 삭제
	 */
	
}

















