package kr.spring.houseBoard.dao;

import kr.spring.houseBoard.vo.HouseBoardVO;

/**
 * @Package Name   : kr.spring.houseBoard.dao
 * @FileName  : HouseBoardMapper.java
 * @작성일       : 2021. 10. 10. 
 * @작성자       : 이현지
 * @프로그램 설명 : 집들이 게시판 매퍼
 */

public interface HouseBoardMapper {
	public void insertHBoard(HouseBoardVO houseBoard); // 글쓰기
}
