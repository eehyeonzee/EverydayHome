package kr.spring.member.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import kr.spring.member.vo.MemberBuisVO;
import kr.spring.member.vo.MemberVO;

/**
 * @Package Name   : kr.spring.member.service
 * @FileName  : MemberService.java
 * @작성일       : 2021. 10. 13. 
 * @작성자       : 오상준
 * @프로그램 설명 : 회원 서비스부분
 */

public interface MemberService {

	public void insertMember(MemberVO member);					// 회원가입 트랜잭션 실행
	public MemberVO selectCheckMember(String mem_id);			// 회원가입 아이디 중복 체크
	public MemberVO selectMember(Integer mem_num);				// 마이페이지 - 회원정보 호출
	public void updateProfile(MemberVO member);					// 프로필 이미지 업데이트
	public void updateMember(MemberVO member);					// 회원정보 수정
	public void deleteMember(Integer mem_num);					// 회원정보 삭제
	public void insertSeller(MemberBuisVO memberBuisVO);		// 마이페이지 판매자 정보 등록
		
	// 판매자 페이지
	
	
	// 관리자 페이지
	public List<MemberVO> selectMemberList(Map<String, Object> map);			// 관리자 페이지 - 회원 정보 전체 출력
	public List<MemberBuisVO> selectMemberBuisList(Map<String, Object> map);	// 관리자 페이지 - 판매자 신청 내역 조회	
	public int selectMemberCount(Map<String, Object> map);						// 관리자 페이지 - 회원 전체 수 구하기
	public int selectMemberBuisCount(Map<String, Object> map);					// 관리자 페이지 - 판매자 신청 전체 수 구하기
	public void updateMemberStop(Integer mem_num);			// 관리자 페이지 - 회원 정지
	public void updateMemberStopCancel(Integer mem_num);	// 관리자 페이지 - 회원 정지 해제
	public void updateMemberSellerAuth(Integer mem_num);	// 관리자 페이지 - 회원등급 판매자 변경
	public void updateMemberPasswdReset(Integer mem_num);	// 관리자 페이지 - 회원 비밀번호 초기화
	public void updateSellerMember(Integer mem_num);	// 관리자 페이지 - 판매자 신청 등록 (사업자테이블 상태 변경) (회원 등급 변경)
	public void deleteSellerMember(Integer mem_num);		// 관리자 페이지 - 판매자 신청 취소 (사업자 테이블 해당 ROW 삭제)
}
