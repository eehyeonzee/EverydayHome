package kr.spring.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.member.dao.MemberMapper;
import kr.spring.member.vo.MemberVO;

/**
 * @Package Name   : kr.spring.member.service
 * @FileName  : MemberServiceImpl.java
 * @작성일       : 2021. 10. 10. 
 * @작성자       : 오상준
 * @프로그램 설명 : 회원 부분 서비스 처리
 */

@Service
@Transactional	
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper memberMapper;

	@Override
	public void insertMember(MemberVO member) {
		//회원번호 셋팅
		member.setMem_num(memberMapper.seleceMem_num());
		memberMapper.insertMember(member);
		memberMapper.insertMember_datail(member);
		
	}

	@Override
	public MemberVO selectCheckMember(String mem_id) {
		// 회원 아이디 중복 체크
		return memberMapper.selectCheckMember(mem_id);
	}

	
	
	
}