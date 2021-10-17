package kr.spring.order.dao;

import org.apache.ibatis.annotations.Insert;

import kr.spring.order.vo.OrderVO;

public interface OrderMapper {

	@Insert("INSERT INTO orders(order_num, order_date, order_zipcode, order_address1, order_address2, "
			+ "receiver_name, receiver_phone, receiver_email, mem_num, prod_num, pay_quan, pay_price, "
			+ "coupon_num, point, buis_name)"
			+ "VALUES(orders_seq.nextval, SYSDATE, #{order_zipcode}, #{order_address1}, #{order_address2}, "
			+ "#{receiver_name}, #{receiver_phone}, #{receiver_email}, #{mem_num}, #{prod_num}, #{pay_quan}, #{pay_price}, "
			+ "#{coupon_num}, #{point}, #{buis_name}")
	public void insertOrder(OrderVO orderVO);
}
