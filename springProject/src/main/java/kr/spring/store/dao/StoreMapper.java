package kr.spring.store.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.store.vo.StoreVO;

public interface StoreMapper {
	
	@Insert("INSERT INTO product(prod_num, prod_name, prod_price, delive_price, "
			+ "delive_type, selec_product, prod_option1, prod_option2, prod_content, prod_img, "
			+ "prod_filename, thumbnail_img, thumbnail_filename, prod_quan, "
			+ "add_product, prod_keyword, mem_num, prod_cate) "
			+ "VALUES(product_seq.nextval, #{prod_name}, #{prod_price}, #{delive_price}, "
			+ "#{delive_type}, #{selec_product}, #{prod_option1}, #{prod_option2}, #{prod_content}, #{prod_img}, "
			+ "#{prod_filename}, #{thumbnail_img}, #{thumbnail_filename}, #{prod_quan}, "
			+ "#{add_product}, #{prod_keyword}, #{mem_num}, #{prod_cate})")
	public void productRegister(StoreVO storeVO);
	public List<StoreVO> selectList(Map<String, Object> map);
	public int selectRowCount(Map<String, Object> map);
	@Select("SELECT * FROM product p JOIN member m ON p.mem_num = m.mem_num WHERE p.prod_num = #{prod_num}")
	public StoreVO selectProduct(Integer prod_num);
	public void updateProduct(StoreVO storeVO);
	@Update("UPDATE product SET thumbnail_img = '', thumbnail_filename = '' WHERE prod_num = #{prod_num}")
	public void deleteThumbnail(Integer prod_num);
	@Delete("DELETE FROM product WHERE prod_num = #{prod_num}")
	public void deleteBoard(Integer prod_num);
}
