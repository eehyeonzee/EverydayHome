package kr.spring.member.service;

import kr.spring.member.vo.MemberVO;

public interface MemberService {

	public void insertMember(MemberVO member);			// 회원가입 트랜잭션 실행
	
}