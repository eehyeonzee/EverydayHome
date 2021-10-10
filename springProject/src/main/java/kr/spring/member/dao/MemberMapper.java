package kr.spring.member.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.spring.member.vo.MemberVO;

/**
 * @Package Name   : kr.spring.member.dao
 * @FileName  : MemberMapper.java
 * @작성일       : 2021. 10. 10. 
 * @작성자       : 오상준
 * @프로그램 설명 : 회원 DAO 부분
 */
public interface MemberMapper {
	@Select("SELECT member_seq.nextval FROM dual")	
	public int seleceMem_num();							// 회원번호 시퀀스 생성
	@Insert("INSERT INTO member (mem_num, mem_id) VALUES(#{mem_num}, #{mem_id})")
	public void insertMember(MemberVO member);			// 회원(member)테이블에 생성
	@Insert("INSERT INTO mem_detail (mem_num,mem_name,passwd,phone,email,zipcode,address1,address2) VALUES (#{mem_num}, #{mem_name}, #{passwd}, #{phone}, #{email}, #{zipcode}, #{address1}, #{address2})")
	public void insertMember_datail(MemberVO member);	// 회원가입 - 회원 상세 테이블
}
