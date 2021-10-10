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
	/*
	 * private String house_color; // 컬러
	 */
	private String house_style; // 스타일
	private String house_title; // 제목
	private String house_content; // 내용
	private int house_hits; // 조회수
	private int house_recom; // 추천수
	private Date house_reg_date; // 작성일
	private Date house_modi; // 수정일
	private byte[] house_thumbnail; // 썸네일 사진
	private String thumbnail_filename; // 썸네일 파일명
	private byte[] house_img; // 업로드 사진
	private String upload_filename; // 업로드 파일명
	
	// ========== 이미지 BLOB 처리 ========== //
	public void setUpload(MultipartFile upload) throws IOException {
		// MultipartFile -> byte[]
		setHouse_thumbnail(upload.getBytes());
		setHouse_img(upload.getBytes());
		// 파일 이름
		setThumbnail_filename(upload.getOriginalFilename());
		setUpload_filename(upload.getOriginalFilename());
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
	
	/*
	 * public String getHouse_color() { return house_color; }
	 * 
	 * public void setHouse_color(String house_color) { this.house_color =
	 * house_color; }
	 */
	
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
	
	public Date getHouse_modi() {
		return house_modi;
	}
	
	public void setHouse_modi(Date house_modi) {
		this.house_modi = house_modi;
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
	
	public byte[] getHouse_img() {
		return house_img;
	}
	
	public void setHouse_img(byte[] house_img) {
		this.house_img = house_img;
	}
	
	public String getUpload_filename() {
		return upload_filename;
	}
	
	public void setUpload_filename(String upload_filename) {
		this.upload_filename = upload_filename;
	}
	
	// ***(주의)*** 프로퍼티 타입이 byte[]인 것은 항목에서 제외해야 함
	@Override
	public String toString() {
		return "HouseBoardVO [house_num=" + house_num + ", house_type=" + house_type + ", house_space=" + house_space
				+ ", house_area=" + house_area + ", house_color="
				+ /* house_color + */ ", house_style=" + house_style
				+ ", house_title=" + house_title + ", house_content=" + house_content + ", house_hits=" + house_hits
				+ ", house_recom=" + house_recom + ", house_reg_date=" + house_reg_date + ", house_modi=" + house_modi
				+ ", thumbnail_filename=" + thumbnail_filename + ", upload_filename=" + upload_filename + "]";
	}
	
}
