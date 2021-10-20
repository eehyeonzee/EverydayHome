package kr.spring.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.houseBoard.vo.HouseBoardVO;
import kr.spring.member.dao.MemberMapper;
import kr.spring.member.vo.MemberBuisVO;
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
		memberVO.setCoupon_count(memberMapper.selectGetCouponCount(mem_num));	// 쿠폰수 저장
		memberVO.setRecommend_count(memberMapper.myRecommCount(mem_num));		// 좋아요 수 저장
		memberVO.setScrapbook_count(memberMapper.myBookmarkCount(mem_num));		// 북마크 수 저장
		memberVO.setFollower_count(memberMapper.selectGetFollowCount(mem_num));	// 팔로우 수 저장
		memberVO.setFollow_count(memberMapper.selectGetFollowerCount(mem_num));	// 팔로워 수 저장
		memberVO.setHouse_board_count(memberMapper.selectGetHouseBoardCount(mem_num)); // 작성글 수 저장
		
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
	@Override
	public void deleteMember(Integer mem_num) {
		memberMapper.deleteMemberDetail(mem_num);
		memberMapper.deleteMember(mem_num);
	}
	@Override
	public void insertSeller(MemberBuisVO memberBuisVO) {
		memberMapper.insertSeller(memberBuisVO);
		
	}
	@Override
	public List<MemberVO> selectMemberList(Map<String, Object> map) {
		return memberMapper.selectMemberList(map);
	}
	@Override
	public int selectMemberCount(Map<String, Object> map) {
		return memberMapper.selectMemberCount(map);
	}
	@Override
	public void updateMemberStop(Integer mem_num) {
		memberMapper.updateMemberStop(mem_num);
		
	}
	@Override
	public void updateMemberStopCancel(Integer mem_num) {
		memberMapper.updateMemberStopCancel(mem_num);
		
	}
	@Override
	public void updateMemberSellerAuth(Integer mem_num) {
		memberMapper.updateMemberSellerAuth(mem_num);
		
	}
	@Override
	public void updateMemberPasswdReset(Integer mem_num) {
		memberMapper.updateMemberPasswdReset(mem_num);
		
	}
	@Override
	public List<MemberBuisVO> selectMemberBuisList(Map<String, Object> map) {
		return memberMapper.selectMemberBuisList(map);
	}
	@Override
	public int selectMemberBuisCount(Map<String, Object> map) {
		return memberMapper.selectMemberBuisCount(map);
	}
	@Override
	public void updateSellerMember(Integer mem_num) {
		memberMapper.updateSellerMemberState(mem_num);
		memberMapper.updateMemberSellerAuth(mem_num);
	}
	@Override
	public void deleteSellerMember(Integer mem_num) {
		memberMapper.deleteSellerMember(mem_num);
		
	}
	@Override
	public List<MemberVO> SelectIdSearch(Map<String, Object> map) {
		return memberMapper.SelectIdSearch(map);
	}
	@Override
	public void updateMemberPasswd(MemberVO member) {
		memberMapper.updateMemberPasswd(member);
	}
	@Override
	public int selectCountSeller(Integer mem_num) {
		return memberMapper.selectCountSeller(mem_num);
	}
	@Override
	public List<HouseBoardVO> myRecommBoardNum(Map<String, Object> map) {
		return memberMapper.myRecommBoardNum(map);
	}
	@Override
	public int myRecommBoardCount(Map<String, Object> map) {
		return memberMapper.myRecommBoardCount(map);
	}
	@Override
	public HouseBoardVO myRecommBoardList(Map<String, Object> map) {
		return memberMapper.myRecommBoardList(map);
	}
	
	
}