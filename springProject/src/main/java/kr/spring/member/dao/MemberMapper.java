package kr.spring.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.houseBoard.vo.HouseBoardVO;
import kr.spring.houseBoard.vo.HouseBoardVO;
import kr.spring.member.vo.MemberBuisVO;
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
	@Insert("INSERT INTO mem_detail (mem_num,mem_name,passwd,phone,email,zipcode,address1,address2,nickname) VALUES (#{mem_num}, #{mem_name}, #{passwd}, #{phone}, #{email}, #{zipcode}, #{address1}, #{address2}, #{nickname})")
	public void insertMember_datail(MemberVO member);	// 회원가입 - 회원 상세 테이블
	@Select("SELECT m.mem_num,m.mem_id,m.mem_auth,d.passwd,d.profile,d.email, d.nickname FROM member m LEFT OUTER JOIN mem_detail d ON m.mem_num=d.mem_num WHERE m.mem_id=#{mem_id}")
	public MemberVO selectCheckMember(String mem_id);	// 회원가입 중복체크 - 회원존재 여부 체크
	@Select("SELECT * FROM member m JOIN mem_detail d ON m.mem_num=d.mem_num WHERE m.mem_num=#{mem_num}")
	public MemberVO selectMember(Integer mem_num);		// 마이페이지 - 회원 정보 출력
	@Select("SELECT count(*) FROM coupon WHERE mem_num=#{mem_num}")
	public int selectGetCouponCount(Integer mem_num);	// 마이페이지 - 회원 쿠폰 수 반환
	@Select("SELECT count(*) FROM follow WHERE follow_mem_num = #{mem_num}")
	public int selectGetFollowCount(Integer mem_num);	// 마이페이지 - 팔로우 수 구하기
	@Select("SELECT count(*) FROM follow WHERE follower_mem_num = #{mem_num}")
	public int selectGetFollowerCount(Integer mem_num);	// 마이페이지 - 팔로워 수 구하기
	@Select("SELECT count(*) FROM house_board WHERE mem_num = #{mem_num}")
	public int selectGetHouseBoardCount(Integer mem_num);	// 마이페이지 - 작성글 수 구하기
	@Update("UPDATE mem_detail SET profile=#{profile},profile_filename=#{profile_filename} WHERE mem_num=#{mem_num}") // 프로필 이미지 업데이트
	public void updateProfile(MemberVO member);		// 마이페이지 - 프로필 사진 업데이트
	@Update("UPDATE mem_detail SET mem_name = #{mem_name}, nickname = #{nickname}, phone = #{phone}, email = #{email}, zipcode = #{zipcode}, address1 = #{address1}, address2 = #{address2} WHERE mem_num = #{mem_num}")
	public void updateMember(MemberVO member);		// 마이페이지 - 회원 정보 수정
	
	@Update("UPDATE member SET mem_auth=0 WHERE mem_num = #{mem_num}")
	public void deleteMember(Integer mem_num);		// 마이페이지 - 회원 삭제(등급 0 변경)
	@Delete("DELETE FROM mem_detail WHERE mem_num = #{mem_num}")
	public void deleteMemberDetail(Integer mem_num);		// 마이페이지 - 회원상세정보 삭제
	@Insert("INSERT INTO buis_detail (mem_num, buis_num, ceo_name, buis_name, buis_item, opening_date, buis_zipcode, buis_address1, buis_address2) VALUES (#{mem_num}, #{buis_num}, #{ceo_name}, #{buis_name}, #{buis_item}, #{opening_date}, #{buis_zipcode}, #{buis_address1}, #{buis_address2})")
	public void insertSeller(MemberBuisVO memberBuisVO);		// 마이페이지 판매자 정보 등록

	public List<MemberVO> selectMemberList(Map<String, Object> map);	// 관리자 페이지 - 회원 정보 전체 출력
	@Select("SELECT count(*) FROM member m JOIN mem_detail d ON m.mem_num=d.mem_num")
	public int selectMemberCount();			// 관리자 페이지 - 회원 전체 수 구하기
	@Update("UPDATE member SET mem_auth = 1 WHERE mem_num=#{mem_num}")
	public void updateMemberStop(Integer mem_num);			// 관리자 페이지 - 회원 정지
	@Update("UPDATE member SET mem_auth = 2 WHERE mem_num=#{mem_num}")
	public void updateMemberStopCancel(Integer mem_num);	// 관리자 페이지 - 회원 정지 해제
	@Update("UPDATE member SET mem_auth = 3 WHERE mem_num=#{mem_num}")
	public void updateMemberSellerAuth(Integer mem_num);	// 관리자 페이지 - 회원등급 판매자 변경
	@Update("UPDATE mem_detail SET passwd = '123456789a' WHERE mem_num=#{mem_num}")
	public void updateMemberPasswdReset(Integer mem_num);	// 관리자 페이지 - 회원 비밀번호 초기화
}