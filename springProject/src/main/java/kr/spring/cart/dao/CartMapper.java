package kr.spring.cart.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.cart.vo.CartVO;

public interface CartMapper {

	@Insert("INSERT INTO cart(cart_num,prod_num,mem_num,cart_quan)values(cart_seq.nextval,#{prod_num},#{mem_num},#{cart_quan})")
	public void cartInsert(CartVO cartVO); //장바구니 추가
	@Select("SELECT c.cart_num AS cart_num, c.mem_num AS mem_num, p.prod_num AS prod_num, m.mem_name AS mem_name, p.prod_name AS prod_name, c.cart_quan, p.prod_price AS prod_price,(prod_price * cart_quan) money FROM mem_detail m, product p, cart c WHERE m.mem_num = c.mem_num AND p.prod_num = c.prod_num AND c.mem_num = #{mem_num} ORDER BY c.cart_num")
	public List<CartVO> cartList(int mem_num); //장바구니 목록
	@Delete("DELETE FROM cart WHERE cart_num = #{cart_num}")
	public void cartDelete(int cart_num); //장바구니 삭제
	@Update("UPDATE cart SET cart_quan = ${cart_quan} WHERE mem_num = #{mem_num} AND prod_num = ${prod_num}")
	public void cartUpdate(CartVO cartVO); //장바구니 수정
	@Select("SELECT NVL(SUM(prod_price * cart_quan),0) money FROM cart c, product p WHERE c.prod_num = p.prod_num AND c.mem_num = #{mem_num}")
	public int sumMoney(int mem_num); //장바구니 금액 합계
	@Select("SELECT count(*) FROM cart WHERE mem_num = #{mem_num} AND prod_num = #{prod_num}")
	public int cartCount(CartVO cartVO); //장바구니 총 개수 세기
	@Update("UPDATE cart SET cart_quan = cart_quan + ${cart_quan} WHERE mem_num = #{mem_num} AND prod_num = ${prod_num}")
	public void CurrentUpdate(CartVO cartVO); //장바구니 개수 변경

}
