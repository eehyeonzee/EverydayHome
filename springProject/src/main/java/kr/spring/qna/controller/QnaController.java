package kr.spring.qna.controller;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.qna.service.QnaService;
import kr.spring.qna.vo.QnaVO;
import kr.spring.serviceBoard.service.ServiceBoardService;
import kr.spring.serviceBoard.vo.ServiceBoardVO;
import kr.spring.util.PagingUtil;

@Controller
public class QnaController {
		//로그 처리 (로그 대상 지정)
		private static final Logger log = LoggerFactory.getLogger(QnaController.class);
		private int rowCount = 20;
		private int pageCount = 10;
		
		@Autowired
		private ServiceBoardService serviceBoardService;
		
		@Autowired
		private JavaMailSender mailSender;	//자바 메일 전송 객체 생성
		
		@Autowired
		private QnaService qnaService;
		
		//자바빈 초기화
		@ModelAttribute
		public QnaVO initCommand() {
			return new QnaVO();
		}
		
		@GetMapping("/qna/qnaInsert.do")
		//글쓰기 폼 호출
		public String qnaInsert() {
			log.debug("<<글쓰기 폼 호출>>");
			
			return "qna/qnaInsert";
		}
		//글쓰기 처리
		@PostMapping("/qna/qnaInsert.do")
		public String qnaInsertSubmit(@Valid QnaVO vo, BindingResult result) {
			//유효성 체크 결과 오류가 있으면 폼 호출
			if(result.hasErrors()) {
				return qnaInsert();
			}
			//글쓰기
			qnaService.qnaInsert(vo);
			
			return "redirect:/qna/qnaList.do";
		}

		
		//qnaServiceList 게시판 목록
		@RequestMapping("/qna/qnaServiceList.do")
		public ModelAndView getQnaServiceList(
			@RequestParam(value="pageNum", defaultValue="1")int currentPage) {
			
			log.debug("<<currentPage>>: " + currentPage);
			
			//총 레코드 수
			int count = qnaService.getQnaServiceCount();
			
			//페이지 처리
			PagingUtil page = new PagingUtil(currentPage, count, 10, 10, "qnaServiceList.do");
			
			//목록 호출
			List<QnaVO> list = null;
			if(count>0) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("start", page.getStartCount());
				map.put("end", page.getEndCount());
				
				list = qnaService.getQnaServiceList(map);
			}
			
			ModelAndView mav = new ModelAndView();
			
			//뷰 이름 설정
			mav.setViewName("/qna/qnaServiceList");
			
			//데이터 저장
			mav.addObject("count",count);
			mav.addObject("list", list);
			mav.addObject("pagingHtml", page.getPagingHtml());
			
			return mav;
			
		}
		
		
		//qnaList 게시판 목록
		@RequestMapping("/qna/qnaList.do")
		public ModelAndView getQnaList(
				@RequestParam(value="pageNum", defaultValue="1")int currentPage) {
			
			log.debug("<<currentPage>>: " + currentPage);
			
			//총 레코드 수
			int count = qnaService.getQnaCount();
			
			//페이지 처리
			PagingUtil page = new PagingUtil(currentPage, count, 10, 10, "qnaList.do");
			
			//목록 호출
			List<QnaVO> list = null;
			if(count>0) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("start", page.getStartCount());
				map.put("end", page.getEndCount());
				
				list = qnaService.getQnaList(map);
			}
			ModelAndView mav = new ModelAndView();
			//뷰 이름 설정
			mav.setViewName("qnaList");
			
			//데이터 저장
			mav.addObject("count",count);
			mav.addObject("list", list);
			mav.addObject("pagingHtml", page.getPagingHtml());
			
			return mav;
			
		}
		
		
		
		
		
		
		/*
		//글 상세
		@RequestMapping("/serviceBoard/serviceBoardDetail.do")
		public ModelAndView serviceBoardDetail(@RequestParam int num) {
			QnaVO serviceboard = serviceBoardService.getServiceBoard(num);
									//뷰 이름					//속성명		//속성값
			return new ModelAndView("/serviceBoard/serviceBoardDetail","serviceboard","serviceboard");
		}
		*/
		
		//수정폼
		@GetMapping("/qna/qnaUpdate.do")
		public String qnaUpdate(@RequestParam int num, Model model) {
			QnaVO qna = qnaService.getQna(num);
			
			model.addAttribute("qnaVO", qna);
			return "qna/qnaUpdate";
			
		}
		//수정 처리
		@PostMapping("/qna/qnaUpdate.do")
		public String qnaUpdateSubmit(@Valid QnaVO vo, BindingResult result) {
			//유효성 체크 결과 오류가 있으면 폼을 호출
			if(result.hasErrors()) {
				return "qna/qnaUpdate";
				
			}
			qnaService.qnaUpdate(vo);
			return "redirect:/qna/qnaList.do";
		}
		
		//글 삭제 폼
		@GetMapping("/qna/qnaDelete.do")
		public String qnaDelete(@RequestParam int num, Model model) {
			QnaVO vo = new QnaVO();
			vo.setQna_num(num);
			
			model.addAttribute("qnaVO",vo);
			
			return "qna/qnaDelete";
		}
		//글 삭제 처리
		@PostMapping("/qna/qnaDelete.do")
		public String qnaDeleteSubmit(@Valid QnaVO vo, BindingResult result) {
			
			qnaService.qnaDelete(vo.getQna_num());
			
			return "redirect:/qna/qnaList.do";
		}
		

		//serviceBoard---------------------------------------------
		//자바빈 초기화
		@ModelAttribute
		public ServiceBoardVO initCommand1() {
			return new ServiceBoardVO();
		}
		
		@GetMapping("/qna/serviceBoardInsert.do")
		//글쓰기 폼 호출
		public String serviceBoardInsertForm() {
			log.debug("<<글쓰기 폼 호출>>");
			
			return "qna/serviceBoardInsertForm";
		}
		//글쓰기 처리
		@PostMapping("/qna/serviceBoardInsert.do")
		public String submit(@Valid ServiceBoardVO serviceboard, BindingResult result,
				HttpSession session, HttpServletRequest request) {
			//유효성 체크 결과 오류가 있으면 폼 호출
			if(result.hasErrors()) {
				return serviceBoardInsertForm();
			}
			//글쓰기
			serviceBoardService.serviceBoardInsert(serviceboard);
			
			return "redirect:/qna/qnaList.do";
		}
		
		
		
		//게시판 목록
		@RequestMapping("/qna/serviceBoardList.do")
		public ModelAndView getServiceBoardList(
				@RequestParam(value="pageNum",defaultValue="1") int currentPage,
				@RequestParam(value="keyfield",defaultValue="") String keyfield,
				@RequestParam(value="keyword",defaultValue="") String keyword) {
			
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("keyfield", keyfield);
			map.put("keyword", keyword);
			
			log.debug("<<currentPage>>: " + currentPage);
			
			//글의 총갯수 또는 검색된 글의 갯수
			int count = serviceBoardService.selectRowCount(map);
			
			//총 레코드 수
			//int count = serviceBoardService.getServiceBoardCount();
			
			//페이지 처리
			PagingUtil page = new PagingUtil(keyfield,keyword,currentPage,count,rowCount,pageCount, "serviceBoardList.do");
			
			//목록 호출
			List<ServiceBoardVO> list = null;
			if(count>0) {
				map.put("start", page.getStartCount());
				map.put("end", page.getEndCount());
				
				list = serviceBoardService.getServiceBoardList(map);
			}
			
			ModelAndView mav = new ModelAndView();
			
			//뷰 이름 설정
			mav.setViewName("qna/serviceBoardList");
			
			//데이터 저장
			mav.addObject("count",count);
			mav.addObject("list", list);
			mav.addObject("pagingHtml", page.getPagingHtml());
			
			return mav;
			
		}
		//글 상세
		@RequestMapping("/qna/serviceBoardDetail.do")
		public ModelAndView serviceBoardDetail(@RequestParam int service_num) {
			ServiceBoardVO serviceboard = serviceBoardService.getServiceBoard(service_num);
			//HTML 태그 불허
			//serviceboard.setService_title(StringUtil.useNoHtml(serviceboard.getService_title()));
			//HTML 태그 불허, 줄바꿈 허용
			//serviceboard.setService_content(StringUtil.useBrNoHtml(serviceboard.getService_content()));
									//뷰 이름					//속성명		//속성값
			return new ModelAndView("qna/serviceBoardDetail","serviceboard",serviceboard);
		}
		
		//이미지 출력
		@RequestMapping("/qna/imageView.do")
		public ModelAndView viewImage(@RequestParam int service_num) {
			
		ServiceBoardVO serviceboard = serviceBoardService.getServiceBoard(service_num);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("imageView");
		                //속성명         속성값(byte[]의 데이터)     
		mav.addObject("imageFile", serviceboard.getService_file());
		mav.addObject("filename", serviceboard.getService_filename());
				
		return mav;
	}
		
		//이메일 전송
		@GetMapping("/qna/mailCheck.do")
		@ResponseBody	//ajax처리를 위한 어노테이션
		public void sendMail(String service_email, String service_reply)throws Exception{
			
			/* 뷰(View)로부터 넘어온 데이터 확인 */
		       log.info("이메일 데이터 전송 확인");
		       log.info("이메일 : " + service_email);
		       log.info("내용 : " + service_reply);
		       
		       String title = "Re: 매일의 홈에 문의 주셔서 감사합니다.";	
		       String content = "문의 내용 확인하였습니다" +service_reply;
		       
		       String fromEmail = "springtest1010@gmail.com";
		       String toEmail = service_email;
			        
			        
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
		       
		   }

}
