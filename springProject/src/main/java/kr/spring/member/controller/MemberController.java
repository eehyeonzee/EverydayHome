package kr.spring.member.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.regex.Pattern;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kr.spring.houseBoard.service.HouseBoardService;
import kr.spring.houseBoard.vo.HouseBoardVO;
import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberBuisVO;
import kr.spring.member.vo.MemberVO;
import kr.spring.util.AuthCheckException;
import kr.spring.util.PagingUtil;

@Controller
public class MemberController {
	
	// 로그 지정
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	// 게시물, 페이지 카운트 지정
	private int rowCount = 4;
	private int pageCount = 5;
	private int mem_rowCount = 13;
	private int mem_pageCount = 5;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private HouseBoardService houseBoardService;
	
	@Autowired
	private JavaMailSender mailSender;	//자바 메일 전송 객체 생성
	
	// Member 자바빈(VO) 초기화
	 @ModelAttribute
	 public MemberVO initCommand() {
		 
	    return new MemberVO();
	 }
		 
	 // Member 자바빈(VO) 초기화
	 @ModelAttribute
	 public MemberBuisVO initCommand2() {
		 
	    return new MemberBuisVO();
	 }
	 
	// 회원가입 - 회원가입 폼 호출
	@RequestMapping("/member/registerUser.do")
	public String form() {
		
		logger.debug("<<회원가입 폼 호출>>");
		
		return "memberRegister";	// 타일스 식별자 호출
	}
	
	// 회원가입 - 회원가입 폼 처리
	@PostMapping("/member/registerUser.do")
	public String submit(@Valid MemberVO memberVO, BindingResult result) {
		
		// 유효성 검사 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			logger.debug(result.toString());
			return form();
		}
		
		logger.debug("<<회원정보>> : " + memberVO);
		// 회원가입
		memberService.insertMember(memberVO);
		return "redirect:/main/main.do";
	}
	
	
	// 회원가입 - 이메일 인증 난수 생성 및 메일 발송 컨트롤러.
	@GetMapping("/member/mailCheck.do")
	@ResponseBody	// ajax처리를 위한 어노테이션
    public String sendMail(String email) throws Exception{		// ModelAttribute 생략
        
		/* 뷰(View)로부터 넘어온 데이터 확인 */
        logger.info("이메일 데이터 전송 확인");
        logger.info("이메일 : " + email);
        
        // JAVA Random 객체를 사용하여 숫자 + 문자 8자리 난수 생성
        String emailCheckCode = excuteGenerate();
        logger.info("인증번호 : " + emailCheckCode);	
        
        
        String title = "매일의 홈 이메일 인증 이메일 입니다.";	
        String content = "홈페이지를 방문해주셔서 정말 감사합니다." +
        		"<br><br>" +
        		"매일의 홈 이메일 인증번호 인증번호는 : <b style='font-size : 13px; color: red;'>" + emailCheckCode + "</b>입니다." +
        		"<br><br>" +
        		"해당 인증 번호를 확인란에 입력해주세요.";
        String fromEmail = "springtest1010@gmail.com";
        String toEmail = email;
        
        try {
            MimeMessage mail = mailSender.createMimeMessage();
            MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8");
            
            
            /*
             * Multpart 기능을 사용하기 위해서는 아래의 코드로 사용 가능 
             * MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");
             * true는 멀티파트 메세지를 사용하겠다는 의미
             */
            
            mailHelper.setFrom(fromEmail);	// 보내는이
            // 빈에 아이디 설정한 것은 단순히 smtp 인증을 받기 위해 사용 따라서 보내는이(setFrom())반드시 필요
            // 보내는이와 메일주소를 수신하는이가 볼때 모두 표기 되게 원하신다면 아래의 코드를 사용
            //mailHelper.setFrom("보내는이 이름 <보내는이 아이디@도메인주소>");
            mailHelper.setTo(toEmail);
            mailHelper.setSubject(title);
            mailHelper.setText(content, true);	// 단순한 텍스트만 사용
            // true는 html을 사용하겠다는 의미.
            
            // html 불허용 : mailHelper.setText(content);
            mailSender.send(mail);		// 메일 전송
            
        } catch(Exception e) {
            e.printStackTrace();
        }
        
        return emailCheckCode;
    }
	
	
	// 회원가입 - 아이디 중복 체크
	@RequestMapping("/member/confirmId.do")
	@ResponseBody
	public Map<String, String> process(@RequestParam String mem_id){
		Map<String, String> map = new HashMap<String, String>();
		logger.debug("<<id>> : " + mem_id);
				
		// DB저장 아이디
		MemberVO member = memberService.selectCheckMember(mem_id);
		if(member!=null) { 
			//아이디 중복;
			map.put("result", "idDuplicated");
		}else {
			if(!Pattern.matches("^[A-Za-z0-9]{4,12}$", mem_id)) {
				//패턴 불일치
				map.put("result", "notMatchPattern");
			}else{
				//아이디 미중복
				map.put("result", "idNotFound");
			}
		}
		
		return map;	
	}
	
	// 카카오 로그인 - 세션 처리
	@PostMapping("/member/kakaologin.do")
	@ResponseBody
	public Map<String, String> kakaoLogin(@RequestParam String id, String nickname, String profile_image_url, HttpSession session) {
		
		Map<String, String> map = new HashMap<String, String>();
		
		// 카카오 로그인 - 회원 DB 등록 확인
		
		session.setAttribute("kakao_id", id);
		session.setAttribute("kakao_nickname", nickname);
		session.setAttribute("kakao_photo", profile_image_url);
		map.put("knickname", nickname);
		
		return map;
	}
	
	// 카카오 로그인 - 회원 정보 DB 등록 및 로그인 처리
	@PostMapping("/member/kakaoLoginProcess.do")
	public String kakaoRegister(@Valid MemberVO memberVO, BindingResult result, HttpSession session) {
		
		// 세션 정보 저장
		String id = (String) session.getAttribute("kakao_id");
		String nickname = (String) session.getAttribute("kakao_nickname");
		String photo = (String) session.getAttribute("kakao_photo");
		
		// 로그인한 내역이 한번이라도 없으면 DB 등록 후 로그인
		logger.debug("<<회원정보>> : " + memberVO);
			
		// 유효성 검사 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return form();
		}
		// 입력받은 자바빈 객체에 세션정보 담기
		memberVO.setMem_id(id);
		memberVO.setNickname(nickname);
		memberVO.setProfile_filename(photo);
		// 비밀번호 난수 생성하여 입력
		String radomPasswd = "KAKA" + excuteGenerate();
		memberVO.setPasswd(radomPasswd);
		
		// 회원 정보 DB 등록
		memberService.insertMember(memberVO);
		
		MemberVO newMemberVO = memberService.selectCheckMember(id);
		
		//session.invalidate();
		// 세션 재설정
		session.setAttribute("user_num", newMemberVO.getMem_num());
		session.setAttribute("user_auth", newMemberVO.getMem_auth());
		session.setAttribute("user_photo", newMemberVO.getProfile());
		session.setAttribute("user_nickname", newMemberVO.getNickname());
		
		return "redirect:/main/main.do";
	}
	
	
	@GetMapping("/member/kakaoMemberInfoRegister.do")
	// 카카오 로그인 - 회원 상세 정보 입력 페이지 호출
	public String kakaoMemberInfoRegisterForm(HttpSession session) {
		
		// 세션 정보 저장
		String id = (String) session.getAttribute("kakao_id");
		
		// 카카오 로그인 - 회원 DB 등록 확인
		
		// DB 저장 아이디
		MemberVO memberKakao = memberService.selectCheckMember(id);
		if(memberKakao!=null) {		// 회원이 존재하는 경우 DB 등록 없이 바로 로그인
			logger.debug("<<카카오 로그인>> : " + id);
					
			//session.invalidate();
			// 세션 재설정
			session.setAttribute("user_num", memberKakao.getMem_num());
			session.setAttribute("user_auth", memberKakao.getMem_auth());
			session.setAttribute("user_photo", memberKakao.getProfile());
			session.setAttribute("user_nickname", memberKakao.getNickname());
					
			logger.debug("<<카카오 로그인>> : " + id);
			
			// 메인화면 호출
			return "redirect:/main/main.do";
		}else {
			logger.debug("<<카카오회원 상세정보 입력 폼 호출>>");
			
			return "kakaoRegForm";	// 타일스 식별자
		}
	}
	
	//로그인 - 로그인 폼 호출
	@GetMapping("/member/login.do")
	public String formLogin() {
		return "memberLogin";//타일스 식별자
	}
	
	//로그인 - 로그인 데이터 처리
	@PostMapping("/member/login.do")
	public String submitLogin(@Valid MemberVO memberVO,BindingResult result, 
			                  HttpSession session) {
			
		logger.debug("<<회원 로그인>> : " + memberVO);
			
		//유효성 체크 결과 오류가 있으면 폼 호출
		//id와 passwd 필드만 체크
		if(result.hasFieldErrors("mem_id") || result.hasFieldErrors("passwd")) {
			return formLogin();
		}
			
		//로그인 체크(id,비밀번호 일치 여부 체크)
		try {
			// DB에 저장된 정보 담아서 객체 생성
			MemberVO member = memberService.selectCheckMember(memberVO.getMem_id());	
			// 입력 아이디 넣어서 생성 존재하지 않다면 null
			boolean check = false;
				
			if(member!=null) {//아이디 일치
				//비밀번호 일치 여부 체크               사용자가 입력한 비밀번호
				check = member.isCheckedPassword(memberVO.getPasswd());
			}
			if(check) {
				//인증 성공, 로그인 처리
				session.setAttribute("user_num", member.getMem_num());
				session.setAttribute("user_auth", member.getMem_auth());
				session.setAttribute("user_nickname", member.getNickname());
				session.setAttribute("user_photo", member.getProfile());
					
				return "redirect:/main/main.do";
			}else {
				//인증 실패
				throw new AuthCheckException();
			}
		}catch(AuthCheckException e) {
				//인증 실패로 메시지 생성 및 로그인 폼 호출
			result.reject("invalidIdOrPassword");
				
			return formLogin();
		}
	}
	
	//로그아웃
	@RequestMapping("/member/logout.do")
	public String processLogout(HttpSession session) {
		//로그아웃
		session.invalidate();
			
		return "redirect:/main/main.do";
	}
	
	//마이페이지 호출
	@GetMapping("/member/myPage.do")
	public String myPageMain(HttpSession session, Model model) {
		Integer user_num = (Integer)session.getAttribute("user_num");
		
		MemberVO member = memberService.selectMember(user_num);
		
		logger.debug("<<회원 상세정보>> : " + member);
		
		model.addAttribute("member", member);
		
		return "memberView";	// 타일스 식별자
	}
	
	//프로필 사진 출력
	@RequestMapping("/member/photoView.do")
	public ModelAndView viewImage(HttpSession session) {
			
		Integer user_num = (Integer)session.getAttribute("user_num");
		MemberVO memberVO = memberService.selectMember(user_num);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("imageView");
		mav.addObject("imageFile", memberVO.getProfile());
		mav.addObject("filename", memberVO.getProfile_filename());
			
		return mav;
	}
	
	
	// 회원정보 수정 - 폼 호출
	@GetMapping("/member/memberUpdate.do")
	public String modifyForm(HttpSession session, Model model) {
		Integer user_num = (Integer) session.getAttribute("user_num");
		
		// 회원정보 가져오기
		MemberVO memberVO = memberService.selectMember(user_num);
		
		model.addAttribute("memberVO", memberVO);
		
		return "memberModify";	// 타일스 섫정
	}
	
	// 회원정보수정 - 수정 데이터 처리
	@PostMapping(value = {"/member/memberUpdate.do" , "/member/adminMemberUpdate.do"})	// 다중매핑 사용
	public String submitUpdate(@Valid MemberVO memberVO, BindingResult result, HttpSession session) {
				
		logger.debug("<<회원정보수정>> : " + memberVO);
				
		// 유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			logger.debug("<<회원정보수정 에러>> : " + result.toString());
			return "memberModify";
		}
		
		boolean adminCheck = false;
		
		Integer user_num = (Integer)session.getAttribute("user_num");
		if(memberVO.getMem_num() != 0) {	// 관리자 회원정보 수정시 mem_num이 넘어옴 (개인 회원정보 수정은 안넘어옴)
			user_num = (memberVO.getMem_num());
			adminCheck = true;			// 관리자 체크 false일 경우 회원 개인
		}
		
		memberVO.setMem_num(user_num);
				
		// 회원정보수정
		memberService.updateMember(memberVO);
		
		if(adminCheck == false) {		// 회원인경우 마이페이지 호출
			return "redirect:/member/myPage.do";
		}else {							// 관리자인 경우 회원리스트 호출
			return "redirect:/member/memberList.do";
		}
	}
	
	// 회원정보 수정 - 프로필 사진 변경
	@PostMapping("/member/updateMyPhoto.do")
	@ResponseBody
	public Map<String,String> processProfile(MemberVO memberVO, HttpSession session){
		Map<String,String> map = new HashMap<String,String>();
		
		Integer user_num = (Integer)session.getAttribute("user_num");
		
		if(memberVO.getMem_num() != 0) {	// 관리자 회원정보 수정시 mem_num이 넘어옴 (개인 회원정보 수정은 안넘어옴)
			user_num = (memberVO.getMem_num());
		}
		
		logger.debug("<<user_num>> : " + user_num);
		logger.debug("<<jmem_num>> : " + memberVO.getMem_num());
		
		if(user_num==null) {//로그인이 되지 않은 상태
			map.put("result", "logout");
		}else {//로그인 된 상태
			memberVO.setMem_num(user_num);
			memberService.updateProfile(memberVO);
			
			//이미지를 업로드한 후 세션에 저장된 프로필 사진 정보 갱신
			session.setAttribute("user_photo", memberVO.getProfile());
			
			map.put("result", "success");
		}
		return map;
	}
	
	// 회원정보 수정 - 비밀번호 변경 폼 호출
	@GetMapping("/member/memberPasswdUpdate.do")
	public String memberPasswdUpdateForm() {
		logger.debug("<<비밀번호 변경 폼 호출>>");
		
		return "memberPasswdUpdate";	// 타일스 식별자 호출
	}
	
	// 회원정보 수정 - 비밀번호 변경 처리
	@PostMapping("/member/memberPasswdUpdate.do")
	public String submitUpdatePasswd(@Valid MemberVO memberVO, BindingResult result, HttpSession session) {
		
		logger.debug("<<비밀번호수정>> : " + memberVO);
		
		// 콕 집어서 체크
		// 유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasFieldErrors("now_passwd") || result.hasFieldErrors("passwd")) {
			return memberPasswdUpdateForm();
		}
		
		Integer user_num = (Integer)session.getAttribute("user_num");
		MemberVO member = memberService.selectMember(user_num); // 한 건의 레코드 구하기
		
		// 폼에서 전송한 현재 비밀번호와 DB에서 받아온 현재 비밀번호 일치 여부 체크
		// DB에서 읽어온 비밀번호				사용자가 입력한 비밀번호
		if(!member.getPasswd().equals(memberVO.getNow_passwd())) {
			// 비밀번호 불일치
			result.rejectValue("now_passwd", "invalidPassword");
			return memberPasswdUpdateForm();
		}
		
		return "redirect:/member/myPage.do";
	}
	
	// 회원정보 수정 - 회원 탈퇴
	@PostMapping("/member/memberDelete.do")
	@ResponseBody
	public Map<String, String> memberDelete(String input_pass, HttpSession session){
		Map<String,String> map = new HashMap<String,String>();
	
		// 회원 번호 가져오기
		Integer user_num = (Integer)session.getAttribute("user_num");
		MemberVO memberVO = memberService.selectMember(user_num); // 회원 정보 가져오기
		boolean check = false;
		
		check = memberVO.isCheckedPassword(input_pass);
		
		if(user_num==null) {//로그인이 되지 않은 상태 로그아웃 처리
			map.put("result", "logout");
		}
		
		if(check) {		// 비밀번호가 일치한 경우
			// 인증 성공 회원 정보 삭제후 map에 저장
			memberService.deleteMember(user_num);
			map.put("result", "success");
			
			// 로그인 세션 삭제 (로그아웃)
			session.invalidate();
		}else {			// 비밀번호가 일치하지 않은 경우
			map.put("result", "NotEqualsPasswd");
		}
		
		
		return map;
	}
	
	// 마이페이지 - 내가 쓴 글 목록
	@GetMapping("/member/myBoard.do")
	public ModelAndView myBoardView(HttpSession session,
									@RequestParam(value="pageNum", defaultValue="1") int currentPage) {
		
		// 세션에서 회원번호 받아오기
		Integer user_num = (Integer)session.getAttribute("user_num");
		Map<String,Object> map = new HashMap<String,Object>();
		
		// 글의 총 개수 또는 검색된 글의 개수
		int count = houseBoardService.selectMyBoardRowCount(user_num);
				
		logger.debug("<<count>> : " + count);
		
		// 페이지 처리
		PagingUtil page = new PagingUtil(currentPage,count,rowCount,pageCount,"myBoard.do");
		
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());
		map.put("mem_num", user_num);
		
		MemberVO member = memberService.selectMember(user_num);
		logger.debug("<<회원 내가 쓴 글>> : " + member);
		
		List<HouseBoardVO> list = null;
		if(count > 0) {
			list = houseBoardService.selectMyBoardList(map);
		}
		
		
		logger.debug("<<회원 내가 쓴 글>> : " + member);
		
		// 전달 객체
		ModelAndView mav = new ModelAndView();
		mav.setViewName("myBoardView"); // 타일스 식별자
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("pagingHtml", page.getPagingHtml());
		mav.addObject("member", member);
		
		return mav;
	}
	
	// 마이페이지 - 판매자 신청 폼 호출
	@GetMapping("/member/sellerApplication.do")
	public String sellerApplication() {
		
		return "sellerApplication";	// 타일스 식별자
	}
	
	
	// 마이페이지 - 판매자 신청 폼 처리
	@PostMapping("/member/sellerApplication.do")
	public String sellerApplicationProcess(@Valid MemberBuisVO memberBuisVO, 
														BindingResult result, HttpSession session) {
		Integer user_num = (Integer)session.getAttribute("user_num");
		// 유효성 검사 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			logger.debug("<<판매자 신청 오류 : >>" + result.toString());
			return sellerApplication();
		}
		memberBuisVO.setMem_num(user_num);
		logger.debug("<<사업자 신청 정보>> : " + memberBuisVO);
		// 회원가입
		memberService.insertSeller(memberBuisVO);
		return "redirect:/member/myPage.do";
	}
	
	
	// 관리자 페이지 - 전체회원 조회
	@GetMapping("/member/memberList.do")
	public ModelAndView memberListForm(@RequestParam(value="pageNum", defaultValue="1") int currentPage,
									  @RequestParam(value="keyfield",defaultValue = "") String keyfield,
						              @RequestParam(value="keyword",defaultValue = "1") String keyword) {
				
		// map 생성
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyfield", keyfield);
	    map.put("keyword", keyword);
	    
		// 글의 총 개수 또는 검색된 글의 개수
		int count = memberService.selectMemberCount(map);
						
		logger.debug("<<count>> : " + count);
				
		// 페이지 처리
		PagingUtil page = new PagingUtil(keyfield, keyword, currentPage,count,mem_rowCount,mem_pageCount,"memberList.do");
				
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());
				
		List<MemberVO> list = null;
		if(count > 0) {
			list = memberService.selectMemberList(map);
		}
				
				
		logger.debug("<<전체 회원 조회>> : " + list);
				
		// 전달 객체
		ModelAndView mav = new ModelAndView();
		mav.setViewName("memberAllList"); // 타일스 식별자
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("pagingHtml", page.getPagingHtml());
				
		return mav;
	}
	
	// 관리자 페이지 - 회원 수정
	@GetMapping("/member/adminMemberUpdate.do")
	public String adminMemberUpdate(@RequestParam int mem_num,
								Model model) {
		
		// 회원정보 가져오기
		MemberVO memberVO = memberService.selectMember(mem_num);
		
		model.addAttribute("memberVO", memberVO);
		
		return "adminMemberUpdate";	// 타일스 섫정
	}
	
	
	// 관리자 페이지 - 회원 정지
	@PostMapping("/member/stopAdminMember.do")
	@ResponseBody
	public Map<String, String> memberStop(@RequestParam String output) {
		String[] stopChecked = output.split(",");
		Map<String,String> mapAjax = new HashMap<String,String>();
		
		for(String mem_num : stopChecked) {
			memberService.updateMemberStop(Integer.parseInt(mem_num));
			
			mapAjax.put("result", "success");
		}
		
		return mapAjax;
		
	}
	
	// 관리자 페이지 - 일반 회원 변경
	@PostMapping("/member/upAdminMember.do")
	@ResponseBody
	public Map<String, String> memberStopCancel(@RequestParam String output) {
		String[] stopChecked = output.split(",");
		Map<String,String> mapAjax = new HashMap<String,String>();
		
		for(String mem_num : stopChecked) {
			memberService.updateMemberStopCancel(Integer.parseInt(mem_num));
			
			mapAjax.put("result", "success");
		}
		
		return mapAjax;
		
	}
	
	// 관리자 페이지 - 판매자 등급 변경
	@PostMapping("/member/upSellerMember.do")
	@ResponseBody
	public Map<String, String> memberUpdateSeller(@RequestParam String output) {
		String[] stopChecked = output.split(",");
		Map<String,String> mapAjax = new HashMap<String,String>();
		
		for(String mem_num : stopChecked) {
			memberService.updateMemberSellerAuth(Integer.parseInt(mem_num));
			
			mapAjax.put("result", "success");
		}
		
		return mapAjax;
		
	}
	
	
	// 관리자 페이지 - 회원 탈퇴
	@PostMapping("/member/deleteAdminMember.do")
	@ResponseBody
	public Map<String, String> adminMemberDelete(@RequestParam String output) {
		String[] stopChecked = output.split(",");
		Map<String,String> mapAjax = new HashMap<String,String>();
		
		for(String mem_num : stopChecked) {
			memberService.deleteMember(Integer.parseInt(mem_num));
			
			mapAjax.put("result", "success");
		}
		
		return mapAjax;
		
	}
	
	
	// 관리자 페이지 - 회원 비밀번호 초기화
	@PostMapping("/member/resetPasswdMember.do")
	@ResponseBody
	public Map<String, String> resetPasswdMember(@RequestParam String output) {
		String[] stopChecked = output.split(",");
		Map<String,String> mapAjax = new HashMap<String,String>();
		
		for(String mem_num : stopChecked) {
			memberService.updateMemberPasswdReset(Integer.parseInt(mem_num));
			
			mapAjax.put("result", "success");
		}
		
		return mapAjax;
		
	}
	
	
	// 관리자 페이지 - 판매자 신청내역 조회
	@GetMapping("/member/sellerApplyList.do")
	public ModelAndView sellerApplyListForm(@RequestParam(value="pageNum", defaultValue="1") int currentPage,
										 @RequestParam(value="keyfield",defaultValue = "") String keyfield,
							             @RequestParam(value="keyword",defaultValue = "1") String keyword) {
		// map 생성
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyfield", keyfield);
	    map.put("keyword", keyword);
			    
		// 판매자 신청 글의 총 개수 또는 검색된 글의 개수
		int count = memberService.selectMemberBuisCount(map);								
		logger.debug("<<count>> : " + count);
						
		// 페이지 처리
		PagingUtil page = new PagingUtil(keyfield, keyword, currentPage,count,mem_rowCount,mem_pageCount,"sellerApplyList.do");
						
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());
						
		List<MemberBuisVO> list = null;
		if(count > 0) {
			list = memberService.selectMemberBuisList(map);		// 판매 신청 리스트
		}
						
						
		logger.debug("<<전체 판매 신청 리스트>> : " + list);
						
		// 전달 객체
		ModelAndView mav = new ModelAndView();
		mav.setViewName("sellerApplyList"); // 타일스 식별자
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("pagingHtml", page.getPagingHtml());
						
		return mav;
	}
	
	// 관리자 페이지 - 판매자 등록
	@PostMapping("/member/memberRegistSeller.do")
	@ResponseBody
	public Map<String, String> sellerRegistMember(@RequestParam String output) {
		String[] stopChecked = output.split(",");
		Map<String,String> mapAjax = new HashMap<String,String>();
		
		for(String mem_num : stopChecked) {
			memberService.updateSellerMember(Integer.parseInt(mem_num));		// 바꿀부분
			
			mapAjax.put("result", "success");
		}
		
		return mapAjax;
	}
	
	// 관리자 페이지 - 판매자 등록 취소
	@PostMapping("/member/memberCancelSeller.do")
	@ResponseBody
	public Map<String, String> sellerCancelMember(@RequestParam String output) {
		String[] stopChecked = output.split(",");
		Map<String,String> mapAjax = new HashMap<String,String>();
		
		for(String mem_num : stopChecked) {
			memberService.deleteSellerMember(Integer.parseInt(mem_num));		// 바꿀부분
			
			mapAjax.put("result", "success");
		}
		
		return mapAjax;
	}
	
	//----------------- 회원가입 이메일 인증 8자리 난수 생성 부분
    private int certCharLength = 8;
    
    private final char[] characterTable = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 
                                            'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 
                                            'Y', 'Z', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0' };
	
	public String excuteGenerate() {
        Random random = new Random(System.currentTimeMillis());
        int tablelength = characterTable.length;
        StringBuffer buf = new StringBuffer();
        
        for(int i = 0; i < certCharLength; i++) {
            buf.append(characterTable[random.nextInt(tablelength)]);
        }
        
        return buf.toString();
    }

    public int getCertCharLength() {
        return certCharLength;
    }

    public void setCertCharLength(int certCharLength) {
        this.certCharLength = certCharLength;
    }


}
