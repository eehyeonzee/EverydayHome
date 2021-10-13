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
	@Override
	public MemberVO selectMember(Integer mem_num) {
		MemberVO memberVO = memberMapper.selectMember(mem_num);					// 회원정보 저장
		memberVO.setCoupon_count(memberMapper.selectGetCouponCount(mem_num));	// 쿠폰번호 저장
		memberVO.setFollower_count(memberMapper.selectGetFollowCount(mem_num));	// 팔로우 수 저장
		memberVO.setFollow_count(memberMapper.selectGetFollowerCount(mem_num));	// 팔로워 수 저장
		
		return memberVO;
	}
	@Override
	public void updateProfile(MemberVO member) {
		memberMapper.updateProfile(member);
	}
	@Override
	public void updateMember(MemberVO member) {
		memberMapper.updateMember(member);
		
	}
	
}