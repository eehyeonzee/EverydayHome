package kr.spring.member.service;

import kr.spring.member.vo.MemberVO;

/**
 * @Package Name   : kr.spring.member.service
 * @FileName  : MemberService.java
 * @작성일       : 2021. 10. 13. 
 * @작성자       : 오상준
 * @프로그램 설명 : 회원 서비스부분
 */

public interface MemberService {

	public void insertMember(MemberVO member);			// 회원가입 트랜잭션 실행
	public MemberVO selectCheckMember(String mem_id);	// 회원가입 아이디 중복 체크
	public MemberVO selectMember(Integer mem_num);		// 마이페이지 - 회원정보 호출
	public int selectGetCouponCount(Integer mem_num);	// 마이페이지 - 회원 쿠폰 수 반환
	
}