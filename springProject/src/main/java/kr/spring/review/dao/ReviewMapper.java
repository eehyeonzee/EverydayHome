package kr.spring.review.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.review.vo.ReviewVO;

public interface ReviewMapper {
	@Insert("INSERT INTO product_review(rev_num, rev_content, rev_grade, rev_reg_date, rev_img, rev_filename, prod_num, mem_num) VALUES(product_review_seq.nextval, #{rev_content}, #{rev_grade}, sysdate, #{rev_img}, #{rev_filename}, #{prod_num}, #{mem_num}")
	public void reviewInsert(ReviewVO review);//리뷰등록
	@Select("SELECT * FROM product_review WHERE rev_num = #{rev_num}")
	public ReviewVO reviewDetail(int rev_num);//리뷰읽기
	@Update("UPDATE product_review SET rev_content = #{rev_content}, rev_grade=#{rev_grade} WHERE rev_num = #{rev_num}")
	public ReviewVO reviewUpdate(ReviewVO review);//리뷰수정
	@Delete("DELETE FROM product_review WHERE rev_num = #{rev_num}")
	public void reviewDelete(int rev_num); //리뷰삭제
	@Select("SELECT d.prod_num as prod_num, p.prod_name as prod_name, p.prod_option1 as prod_option1, o.order_date as order_date, d.buis_name as buis_name , p.prod_price as prod_price FROM orders o, order_detail d, product p WHERE o.order_num = d.order_num AND p.prod_num = d.prod_num AND o.mem_num = '6' ORDER BY o.order_date")
	public List<ReviewVO> reviewbuyList(int mem_num);
	@Select("SELECT * FROM product_review WHERE prod_num =#{prod_num}")
	public List<ReviewVO> reviewList(int mem_num);//리뷰리스트
	@Select("SELECT * FROM product_review WHERE prod_num =#{prod_num}")
	public List<ReviewVO> reviewListStore(int prod_num);//리뷰 스토어에서 보게하기
	@Select("SELECT count(*) FROM product_review WHERE mem_num=#{mem_num}")
	public int reviewMyCount(int mem_num);//내 리뷰 총 개수 세기
	@Select("SELECT count(*) FROM product_review WHERE prod_num=#{prod_num}")
	public int reviewStoreCount(int prod_num);//상품 리뷰 총 개수 세기
	@Update("UPDATE product_review SET rev_filename = '', rev_img = '' WHERE rev_num = #{rev_num}")
	public int reviewFileDelete(int rev_num);//리뷰 파일 삭제
	@Select("SELECT COUNT(*) FROM order_detail d, orders o WHERE o.order_num = d.order_num AND mem_num = #{mem_num}")
	public int reviewBuyCount(int mem_num);
	@Select("select count(*) FROM product_review WHERE mem_num = #{mem_num} AND prod_num= #{prod_num}")
	public int reviewExist(@Param("mem_num")int mem_num, @Param("prod_num")int prod_num);//리뷰쓴적잇는지 확인
	@Select("SELECT COUNT(*) FROM orders o, order_detail d WHERE d.order_num=o.order_num AND mem_num =#{mem_num} AND prod_num =#{prod_num}")
	public int orderExist(@Param("mem_num")int mem_num,@Param("prod_num") int prod_num);
	
}
