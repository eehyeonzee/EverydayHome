package kr.spring.houseBoard.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.houseBoard.service.HouseBoardService;
import kr.spring.houseBoard.vo.HouseBoardVO;
import kr.spring.util.PagingUtil;
import kr.spring.util.StringUtil;

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
		
		// 회원번호
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
		
		// 전달 객체
		ModelAndView mav = new ModelAndView();
		mav.setViewName("houseBoardList"); // 타일스 식별자
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("pagingHtml", page.getPagingHtml());
		
		return mav;
	}
	
	// 글 상세
	@RequestMapping("/houseBoard/detail.do")
	public ModelAndView process(@RequestParam int house_num) { // 글번호 저장
		// 해당 글의 조회수 증가
		houseBoardService.updateHBoardHits(house_num);
		// selectHBoard에 글번호 전달
		HouseBoardVO houseBoard = houseBoardService.selectHBoard(house_num);
		
		// HTML 태그 불허용
		houseBoard.setHouse_title(StringUtil.useNoHtml(houseBoard.getHouse_title()));
		// HTML 태그 불허, 줄바꿈 허용
	    // CK에디터 사용시 주석 처리
	    // houseBoard.setHouse_content(StringUtil.useBrNoHtml(houseBoard.getHouse_content()));
		//								뷰 이름			속성명		속성값
		return new ModelAndView("houseBoardDetail", "houseBoard", houseBoard);
	}
	
	// 이미지 출력
	@RequestMapping("/houseBoard/imageView.do")
	public ModelAndView viewImage(@RequestParam int house_num) {
		
		HouseBoardVO houseBoard = houseBoardService.selectHBoard(house_num);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("imageView"); // // imageView 빈 이름(id) 생성 -> mav가 클래스 파일(빈 객체) 찾아서 실행시켜줌
		//				속성명		속성값(byte[]의 데이터)
		mav.addObject("imageFile", houseBoard.getHouse_thumbnail());
		mav.addObject("filename", houseBoard.getThumbnail_filename());
		
		return mav;
	}
	
	// 글 수정 - 폼 호출
	@GetMapping("/houseBoard/update.do")
	public String formUpdate(@RequestParam int house_num, Model model) {
		
		HouseBoardVO houseBoardVO = houseBoardService.selectHBoard(house_num);
		
		model.addAttribute("houseBoardVO", houseBoardVO);
		
		return "houseBoardModify"; // 타일스 식별자
	}
	
	// 글 수정 - 전송된 데이터 처리
	@PostMapping("/houseBoard/update.do")
	public String submitUpdate(@Valid HouseBoardVO houseBoardVO, BindingResult result, HttpServletRequest request, Model model) {
		
		logger.debug("<<글 수정>> : " + houseBoardVO);
		
		// 유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return "houseBoardModify";
		}
		
		// 글 수정
		houseBoardService.updateHBoard(houseBoardVO);
		// View에 표시할 메시지
		model.addAttribute("message", "수정이 완료되었습니다.");
		model.addAttribute("url", request.getContextPath() + "/houseBoard/list.do"); // url은 전체 경로를 명시해주는 것이 좋음
		
		return "common/resultView";
	}
	
	// 글 수정 - 썸네일 삭제 (ajax방식)
	@RequestMapping("/houseBoard/deleteFile.do")
	@ResponseBody
	public Map<String,String> processFile(int house_num, HttpSession session) {
		
		Map<String,String> map = new HashMap<String,String>();
		
		Integer user_num = (Integer)session.getAttribute("user_num");
		
		if(user_num == null) {
			map.put("result", "logout");
			
		}else {
			houseBoardService.deleteFile(house_num);
			map.put("result", "success");
		}
		
		return map;
	}
	
	// CKEditor를 이용한 이미지 업로드
	@RequestMapping("/houseBoard/imageUploader.do")
	@ResponseBody
	public Map<String,Object> uploadImage(MultipartFile upload, HttpSession session, HttpServletRequest request) throws Exception {
		
		// 업로드와 절대 경로 구하기
		String realFolder = session.getServletContext().getRealPath("/resources/image_upload");
		
		// 업로드한 파일 이름
		String org_filename = upload.getOriginalFilename();
		String str_filename = System.currentTimeMillis() + org_filename;
		
		logger.debug("<<원본 파일명>> : " + org_filename);
		logger.debug("<<저장할 파일명>> : " + str_filename);
		
		Integer user_num = (Integer)session.getAttribute("user_num");
		
		String filepath = realFolder + "\\" + user_num + "\\" + str_filename;
		logger.debug("<<파일 경로>> : " + filepath);
		
		File f = new File(filepath);
		if(!f.exists()) {
			f.mkdirs();
		}
		
		upload.transferTo(f);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("uploaded", true);
		map.put("url", request.getContextPath() + "/resources/image_upload/" + user_num + "/" + str_filename);
		
		return map;
	}

	// 글 삭제
	@RequestMapping("/houseBoard/delete.do")
	public String submitDelete(@RequestParam int house_num) {
		
		logger.debug("<<글 삭제>> : " + house_num);
		
		// 글 삭제
		houseBoardService.deleteHBoard(house_num);
		
		return "redirect:/houseBoard/list.do";
	}

}
