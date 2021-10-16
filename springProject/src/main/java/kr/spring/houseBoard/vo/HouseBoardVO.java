package kr.spring.houseBoard.vo;

import java.io.IOException;
import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

/**
 * @Package Name   : kr.spring.houseBoard.vo
 * @FileName  : HouseBoardVO.java
 * @작성일       : 2021. 10. 10. 
 * @작성자       : 이현지
 * @프로그램 설명 : 집들이 게시판VO
 */

public class HouseBoardVO {
	private int house_num; // 글번호
	private String house_type; // 주거 형태
	private String house_space; // 공간
	private String house_area; // 평수
	private String house_style; // 스타일
	private String house_title; // 제목
	private String house_content; // 내용
	private int house_hits; // 조회수
	private int house_recom; // 추천수
	private Date house_reg_date; // 작성일
	private Date house_mod_date; // 수정일
	private byte[] house_thumbnail; // 썸네일 이미지
	private String thumbnail_filename; // 썸네일 파일명
	
	// === 회원 === //
	private int mem_num; // 회원번호
	private String mem_id; // 회원ID
	private int mem_auth; // 회원등급
	private String nickname; // 닉네임
	private byte[] profile;      // 프로필 사진
	private String profile_filename;   // 프로필 사진 파일명
	
	// === 댓글, 북마크, 팔로우 === //
	// 댓글
	private int scrap_num; // 북마크 번호
	private int follow_num; // 팔로우 번호
	
	// ========== 업로드 이미지 BLOB 처리 ========== //
	public void setUpload(MultipartFile upload) throws IOException {
		// MultipartFile -> byte[]
		setHouse_thumbnail(upload.getBytes());
		// 파일 이름
		setThumbnail_filename(upload.getOriginalFilename());
	}

	public int getHouse_num() {
		return house_num;
	}

	public void setHouse_num(int house_num) {
		this.house_num = house_num;
	}

	public String getHouse_type() {
		return house_type;
	}

	public void setHouse_type(String house_type) {
		this.house_type = house_type;
	}

	public String getHouse_space() {
		return house_space;
	}

	public void setHouse_space(String house_space) {
		this.house_space = house_space;
	}

	public String getHouse_area() {
		return house_area;
	}

	public void setHouse_area(String house_area) {
		this.house_area = house_area;
	}

	public String getHouse_style() {
		return house_style;
	}

	public void setHouse_style(String house_style) {
		this.house_style = house_style;
	}

	public String getHouse_title() {
		return house_title;
	}

	public void setHouse_title(String house_title) {
		this.house_title = house_title;
	}

	public String getHouse_content() {
		return house_content;
	}

	public void setHouse_content(String house_content) {
		this.house_content = house_content;
	}

	public int getHouse_hits() {
		return house_hits;
	}

	public void setHouse_hits(int house_hits) {
		this.house_hits = house_hits;
	}

	public int getHouse_recom() {
		return house_recom;
	}

	public void setHouse_recom(int house_recom) {
		this.house_recom = house_recom;
	}
	
	public Date getHouse_reg_date() {
		return house_reg_date;
	}

	public void setHouse_reg_date(Date house_reg_date) {
		this.house_reg_date = house_reg_date;
	}

	public Date getHouse_mod_date() {
		return house_mod_date;
	}

	public void setHouse_mod_date(Date house_mod_date) {
		this.house_mod_date = house_mod_date;
	}

	public byte[] getHouse_thumbnail() {
		return house_thumbnail;
	}

	public void setHouse_thumbnail(byte[] house_thumbnail) {
		this.house_thumbnail = house_thumbnail;
	}

	public String getThumbnail_filename() {
		return thumbnail_filename;
	}

	public void setThumbnail_filename(String thumbnail_filename) {
		this.thumbnail_filename = thumbnail_filename;
	}

	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	
	public int getMem_auth() {
		return mem_auth;
	}

	public void setMem_auth(int mem_auth) {
		this.mem_auth = mem_auth;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getScrap_num() {
		return scrap_num;
	}

	public void setScrap_num(int scrap_num) {
		this.scrap_num = scrap_num;
	}

	public int getFollow_num() {
		return follow_num;
	}

	public void setFollow_num(int follow_num) {
		this.follow_num = follow_num;
	}
	
	public byte[] getProfile() {
		return profile;
	}

	public void setProfile(byte[] profile) {
		this.profile = profile;
	}

	public String getProfile_filename() {
		return profile_filename;
	}

	public void setProfile_filename(String profile_filename) {
		this.profile_filename = profile_filename;
	}

	// ***(주의)*** 프로퍼티 타입이 byte[]인 것은 항목에서 제외 -> house_thumbnail, house_img
	@Override
	public String toString() {
		return "HouseBoardVO [house_num=" + house_num + ", house_type=" + house_type + ", house_space=" + house_space
				+ ", house_area=" + house_area + ", house_style=" + house_style + ", house_title=" + house_title
				+ ", house_content=" + house_content + ", house_hits=" + house_hits + ", house_recom=" + house_recom
				+ ", house_reg_date=" + house_reg_date + ", house_mod_date=" + house_mod_date + ", thumbnail_filename="
				+ thumbnail_filename + ", mem_num=" + mem_num + ", mem_id=" + mem_id + ", mem_auth=" + mem_auth
				+ ", nickname=" + nickname + ", profile_filename=" + profile_filename + ", scrap_num=" + scrap_num
				+ ", follow_num=" + follow_num + "]";
	}

	
	
	
}
