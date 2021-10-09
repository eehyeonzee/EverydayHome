package kr.spring.member.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
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
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;

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
