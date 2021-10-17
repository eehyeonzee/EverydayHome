package kr.spring.houseBoard.vo;

import java.sql.Date;

public class HCommentsVO {
	private int comm_num; // 댓글 번호
	private Date comm_reg_date; // 댓글 등록일
	private Date comm_mod_date;	// 댓글 수정일
	private String comm_comments; // 댓글 내용
	private int mem_num; // 회원 번호
	private int house_num; // 집들이게시판 글번호
	
	public int getComm_num() {
		return comm_num;
	}
	
	public void setComm_num(int comm_num) {
		this.comm_num = comm_num;
	}
	
	public Date getComm_reg_date() {
		return comm_reg_date;
	}
	
	public void setComm_reg_date(Date comm_reg_date) {
		this.comm_reg_date = comm_reg_date;
	}
	
	public Date getComm_mod_date() {
		return comm_mod_date;
	}
	
	public void setComm_mod_date(Date comm_mod_date) {
		this.comm_mod_date = comm_mod_date;
	}
	
	public String getComm_comments() {
		return comm_comments;
	}
	
	public void setComm_comments(String comm_comments) {
		this.comm_comments = comm_comments;
	}
	
	public int getMem_num() {
		return mem_num;
	}
	
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	
	public int getHouse_num() {
		return house_num;
	}
	
	public void setHouse_num(int house_num) {
		this.house_num = house_num;
	}

	@Override
	public String toString() {
		return "HcommentsVO [comm_num=" + comm_num + ", comm_reg_date=" + comm_reg_date + ", comm_mod_date="
				+ comm_mod_date + ", comm_comments=" + comm_comments + ", mem_num=" + mem_num + ", house_num="
				+ house_num + "]";
	}
	
}
