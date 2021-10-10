package kr.spring.member.service;

import kr.spring.member.vo.MemberVO;

public interface MemberService {

	public void insertMember(MemberVO member);			// 회원가입 트랜잭션 실행
	public MemberVO selectCheckMember(String mem_id);	// 회원가입 아이디 중복 체크
}