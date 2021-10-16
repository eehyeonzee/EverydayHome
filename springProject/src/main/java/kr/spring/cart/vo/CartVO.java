package kr.spring.cart.vo;

public class CartVO {
	private int cart_num;
	private int prod_num;
	private int mem_num;
	private int cart_quan;
	public int getCart_num() {
		return cart_num;
	}
	public void setCart_num(int cart_num) {
		this.cart_num = cart_num;
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
	public int getCart_quan() {
		return cart_quan;
	}
	public void setCart_quan(int cart_quan) {
		this.cart_quan = cart_quan;
	}
	
	@Override
	public String toString() {
		return "CartVO [cart_num=" + cart_num + ", prod_num=" + prod_num + ", mem_num=" + mem_num + ", cart_quan="
				+ cart_quan + "]";
	}
	
	
}
