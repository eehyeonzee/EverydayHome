package kr.spring.store.dao;

import org.apache.ibatis.annotations.Insert;

import kr.spring.store.vo.StoreVO;

public interface StoreMapper {
	
	@Insert("INSERT INTO product(prod_num, prod_name, prod_price, delive_price, "
			+ "delive_type, selec_product, prod_option1, prod_content, prod_img, "
			+ "prod_filename, thumbnail_img, thumbnail_filename, prod_quan, "
			+ "add_product, prod_keyword, mem_num, prod_cate) "
			+ "VALUES(product_seq.nextval, #{prod_name}, #{prod_price}, #{delive_price}, "
			+ "#{delive_type}, #{selec_product}, #{prod_option1}, #{prod_content}, #{prod_img}, "
			+ "#{prod_filename}, #{thumbnail_img}, #{thumbnail_filename}, #{prod_quan}, "
			+ "#{add_product}, #{prod_keyword}, #{user_num}, #{prod_cate})")
	public void productRegister(StoreVO storeVO);
}
