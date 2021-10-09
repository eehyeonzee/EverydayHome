package kr.spring.member.dao;

import kr.spring.member.vo.MemberVO;

/**
 * @Package Name   : kr.spring.member.dao
 * @FileName  : MemberMapper.java
 * @작성일       : 2021. 10. 10. 
 * @작성자       : 오상준
 * @프로그램 설명 : 회원 DAO 부분
 */
public interface MemberMapper {
		public int seleceMem_num();							// 회원번호 시퀀스 생성
		public void insertMember(MemberVO member);			// 회원(member)테이블에 생성
		public void insertMember_datail(MemberVO member);	// 회원가입 - 회원 상세 테이블
}
