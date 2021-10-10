package kr.spring.member.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.regex.Pattern;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;
import kr.spring.util.AuthCheckException;

@Controller
public class MemberController {
	
	// 로그 지정
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private JavaMailSender mailSender;	//자바 메일 전송 객체 생성
	
	// 자바빈(VO) 초기화
	 @ModelAttribute
	 public MemberVO initCommand() {
	    return new MemberVO();
	 }
	
	
	// 회원가입 - 회원가입 폼 호출
	@GetMapping("/member/registerUser.do")
	public String form() {
		
		logger.debug("<<회원가입 폼 호출>>");
		
		return "memberRegister";	// 타일스 식별자 호출
	}
	
	// 회원가입 - 회원가입 폼 처리
	@PostMapping("/member/registerUser.do")
	public String submit(@Valid MemberVO memberVO, BindingResult result) {
		logger.debug("<<회원정보>> : " + memberVO);
		
		// 유효성 검사 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return form();
		}
		
		// 회원가입
		memberService.insertMember(memberVO);
		return "redirect:/main/main.do";
	}
	
	
	// 회원가입 - 이메일 인증 난수 생성 및 메일 발송 컨트롤러
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
			//아이디 중복
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
					session.setAttribute("user_id", member.getMem_id());
					session.setAttribute("user_auth", member.getMem_auth());
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
