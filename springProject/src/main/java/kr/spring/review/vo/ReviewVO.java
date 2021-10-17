package kr.spring.review.vo;

import java.io.IOException;
import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class ReviewVO {
	private int rev_num;
	private String rev_content;
	private int rev_grade;
	private Date rev_reg_date;
	private byte[] rev_img;
	private String rev_filename;
	private int prod_num;
	private int mem_num;
	
	//제품정보
	private String buis_name;
	private String prod_name;
	private String prod_option;
	private Date order_date;
	private int prod_price;
	
	//리뷰중복
	private int overlap;
	
	
	public void setUpload(MultipartFile upload)throws IOException {
		
		setRev_img(upload.getBytes());
		
		setRev_filename(upload.getOriginalFilename());
	}
	
	public int getRev_num() {
		return rev_num;
	}
	public void setRev_num(int rev_num) {
		this.rev_num = rev_num;
	}
	public String getRev_content() {
		return rev_content;
	}
	public void setRev_content(String rev_content) {
		this.rev_content = rev_content;
	}
	public int getRev_grade() {
		return rev_grade;
	}
	public void setRev_grade(int rev_grade) {
		this.rev_grade = rev_grade;
	}
	public Date getRev_reg_date() {
		return rev_reg_date;
	}
	public void setRev_reg_date(Date rev_reg_date) {
		this.rev_reg_date = rev_reg_date;
	}
	public byte[] getRev_img() {
		return rev_img;
	}
	public void setRev_img(byte[] rev_img) {
		this.rev_img = rev_img;
	}
	public String getRev_filename() {
		return rev_filename;
	}
	public void setRev_filename(String rev_filename) {
		this.rev_filename = rev_filename;
	}
	public int getProd_num() {
		return prod_num;
	}
	public void setProd_num(int prod_num) {
		this.prod_num = prod_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public String getBuis_name() {
		return buis_name;
	}
	public void setBuis_name(String buis_name) {
		this.buis_name = buis_name;
	}
	public String getProd_name() {
		return prod_name;
	}
	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}
	public String getProd_option() {
		return prod_option;
	}
	public void setProd_option(String prod_option) {
		this.prod_option = prod_option;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	
	
	public int getOverlap() {
		return overlap;
	}

	public void setOverlap(int overlap) {
		this.overlap = overlap;
	}
	
	

	public int getProd_price() {
		return prod_price;
	}

	public void setProd_price(int prod_price) {
		this.prod_price = prod_price;
	}

	@Override
	public String toString() {
		return "ReviewVO [rev_num=" + rev_num + ", rev_content=" + rev_content + ", rev_grade=" + rev_grade
				+ ", rev_reg_date=" + rev_reg_date + ", prod_num=" + prod_num + ", mem_num=" + mem_num + ", buis_name="
				+ buis_name + ", prod_name=" + prod_name + ", prod_option=" + prod_option + ", order_date=" + order_date
				+ ", prod_price=" + prod_price + ", overlap=" + overlap + "]";
	}


	
	
}
