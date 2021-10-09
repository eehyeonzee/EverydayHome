package kr.spring.member.vo;

import java.io.IOException;
import java.sql.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

public class MemberVO {
	private int mem_num;      // 회원번호
	   @Pattern(regexp="^[A-Za-z0-9]{4,12}$")
	   private String mem_id;         // ID
	   private int mem_auth;         // 회원등급
	   @NotEmpty
	   private String mem_name;      // 이름
	   @Pattern(regexp="^[A-Za-z0-9]{4,12}$")
	   private String passwd;      // 비밀번호
	   @NotEmpty
	   private String phone;      // 전화번호
	   @Email
	   @NotEmpty
	   private String email;      // 이메일
	   @Size(min=5, max=5)
	   private String zipcode;      // 우편번호
	   @NotEmpty
	   private String address1;   // 주소
	   @NotEmpty
	   private String address2;   // 나머지 주소
	   @NotEmpty
	   private Date birthday;	  // 생일
	   private byte[] profile;      // 프로필 사진
	   private String profile_filename;   // 프로필 사진 파일명
	   private Date reg_date;      // 가입일
	   private int point;			// 포인트
	   @NotEmpty
	   private String passwdkey;	// 비밀번호 키
	   private String passwd_question;	// 비밀번호 찾기 힌트
	   private int coupon_num;		// 쿠폰번호
	   private String coupon_name;	// 쿠폰명
	   private String coupon_context; // 쿠폰내용
	   private int discount_price;	// 할인가격
	   
	   //============ 비밀번호 일치 여부 체크 ==============//
	   public boolean isCheckedPassword(String userPasswd) {
	      if(mem_auth > 1 && passwd.equals(userPasswd)) {
	         return true;
	      }
	      return false;
	   }
	   
	   //============= 이미지 BLOB 처리 ==================//
	   public void setUpload(MultipartFile upload) throws IOException{
	      // MultipartFile -> byte[]
	      setProfile(upload.getBytes());
	      // 파일 이름
	      setProfile_filename(upload.getOriginalFilename());
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
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
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
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getPasswdkey() {
		return passwdkey;
	}
	public void setPasswdkey(String passwdkey) {
		this.passwdkey = passwdkey;
	}
	public String getPasswd_question() {
		return passwd_question;
	}

	public void setPasswd_question(String passwd_question) {
		this.passwd_question = passwd_question;
	}
	public int getCoupon_num() {
		return coupon_num;
	}
	public void setCoupon_num(int coupon_num) {
		this.coupon_num = coupon_num;
	}
	public String getCoupon_name() {
		return coupon_name;
	}
	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}
	public String getCoupon_context() {
		return coupon_context;
	}
	public void setCoupon_context(String coupon_context) {
		this.coupon_context = coupon_context;
	}
	public int getDiscount_price() {
		return discount_price;
	}
	public void setDiscount_price(int discount_price) {
		this.discount_price = discount_price;
	}

	@Override
	public String toString() {
		return "MemberVO [mem_num=" + mem_num + ", mem_id=" + mem_id + ", mem_auth=" + mem_auth + ", mem_name="
				+ mem_name + ", passwd=" + passwd + ", phone=" + phone + ", email=" + email + ", zipcode=" + zipcode
				+ ", address1=" + address1 + ", address2=" + address2 + ", birthday=" + birthday + ", profile_filename="
				+ profile_filename + ", reg_date=" + reg_date + ", point=" + point + ", passwdkey=" + passwdkey
				+ ", passwd_question=" + passwd_question + ", coupon_num=" + coupon_num + ", coupon_name=" + coupon_name
				+ ", coupon_context=" + coupon_context + ", discount_price=" + discount_price + "]";
	}
	
	
	   
}
