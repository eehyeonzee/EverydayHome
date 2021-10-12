package kr.spring.store.vo;

import java.io.IOException;
import java.sql.Date;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;

import org.springframework.web.multipart.MultipartFile;

public class StoreVO {
	
	private int prod_num;				// 상품번호
	@NotEmpty
	private String prod_name;			// 상품명
	@Min(1)
	private	int prod_price;				// 가격
	private int delive_price;			// 배송비
	@NotEmpty
	private String delive_type;			// 배송유형
	private String selec_product;		// 상품선택
	private String prod_option1;		// 옵션1
	private String prod_content;		// 상품내용
	private byte[] prod_img;			// 상품이미지
	private String prod_filename;		// 상품파일명
	private byte[] thumbnail_img;		// 썸네일이미지
	private String thumbnail_filename;	// 썸네일파일명
	@Min(1)
	private int prod_quan;				// 수량
	private String add_product;			// 추가상품명
	private Date prod_reg_date;			// 상품등록일
	private String prod_keyword;		// 상품키워드
	private int mem_num;				// 회원번호
	@NotEmpty
	private String prod_cate;			// 카테고리
	
	// 이미지 BLOB 처리
	public void setUpload(MultipartFile upload)throws IOException {
		
		// MultipartFile -> byte[]
		setProd_img(upload.getBytes());
		setThumbnail_img(upload.getBytes());
		
		// 파일 이름
		setProd_filename(upload.getOriginalFilename());
		setThumbnail_filename(upload.getOriginalFilename());
	}
	
	public int getProd_num() {
		return prod_num;
	}
	public void setProd_num(int prod_num) {
		this.prod_num = prod_num;
	}
	public String getProd_name() {
		return prod_name;
	}
	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}
	public int getProd_price() {
		return prod_price;
	}
	public void setProd_price(int prod_price) {
		this.prod_price = prod_price;
	}
	public int getDelive_price() {
		return delive_price;
	}
	public void setDelive_price(int delive_price) {
		this.delive_price = delive_price;
	}
	public String getDelive_type() {
		return delive_type;
	}
	public void setDelive_type(String delive_type) {
		this.delive_type = delive_type;
	}
	public String getSelec_product() {
		return selec_product;
	}
	public void setSelec_product(String selec_product) {
		this.selec_product = selec_product;
	}
	public String getProd_option1() {
		return prod_option1;
	}
	public void setProd_option1(String prod_option1) {
		this.prod_option1 = prod_option1;
	}
	public String getProd_content() {
		return prod_content;
	}
	public void setProd_content(String prod_content) {
		this.prod_content = prod_content;
	}
	public byte[] getProd_img() {
		return prod_img;
	}
	public void setProd_img(byte[] prod_img) {
		this.prod_img = prod_img;
	}
	public String getProd_filename() {
		return prod_filename;
	}
	public void setProd_filename(String prod_filename) {
		this.prod_filename = prod_filename;
	}
	public byte[] getThumbnail_img() {
		return thumbnail_img;
	}
	public void setThumbnail_img(byte[] thumbnail_img) {
		this.thumbnail_img = thumbnail_img;
	}
	public String getThumbnail_filename() {
		return thumbnail_filename;
	}
	public void setThumbnail_filename(String thumbnail_filename) {
		this.thumbnail_filename = thumbnail_filename;
	}
	public int getProd_quan() {
		return prod_quan;
	}
	public void setProd_quan(int prod_quan) {
		this.prod_quan = prod_quan;
	}
	public String getAdd_product() {
		return add_product;
	}
	public void setAdd_product(String add_product) {
		this.add_product = add_product;
	}
	public Date getProd_reg_date() {
		return prod_reg_date;
	}
	public void setProd_reg_date(Date prod_reg_date) {
		this.prod_reg_date = prod_reg_date;
	}
	public String getProd_keyword() {
		return prod_keyword;
	}
	public void setProd_keyword(String prod_keyword) {
		this.prod_keyword = prod_keyword;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public String getProd_cate() {
		return prod_cate;
	}
	public void setProd_cate(String prod_cate) {
		this.prod_cate = prod_cate;
	}
	
	@Override
	public String toString() {
		return "StoreVO [prod_num=" + prod_num + ", prod_name=" + prod_name + ", prod_price=" + prod_price
				+ ", delive_price=" + delive_price + ", delive_type=" + delive_type + ", selec_product=" + selec_product
				+ ", prod_option1=" + prod_option1 + ", prod_content=" + prod_content + ", prod_filename="
				+ prod_filename + ", thumbnail_filename=" + thumbnail_filename + ", prod_quan=" + prod_quan
				+ ", add_product=" + add_product + ", prod_reg_date=" + prod_reg_date + ", prod_keyword=" + prod_keyword
				+ ", mem_num=" + mem_num + ", prod_cate=" + prod_cate + "]";
	}
}
