package kr.spring.member.service;

import kr.spring.member.vo.MemberVO;

public interface MemberService {

	public int seleceMem_num();							// 회원번호 시퀀스 생성
	public void insertMember(MemberVO member);			// 회원(member)테이블에 생성
	public void insertMember_datail(MemberVO member);	// 회원가입 - 회원 상세 테이블
	
}