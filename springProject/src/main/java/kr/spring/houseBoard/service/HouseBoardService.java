package kr.spring.houseBoard.service;

import java.util.List;
import java.util.Map;

import kr.spring.houseBoard.vo.HouseBoardVO;

/**
 * @Package Name   : kr.spring.houseBoard.service
 * @FileName  : HouseBoardService.java
 * @작성일       : 2021. 10. 10. 
 * @작성자       : 이현지
 * @프로그램 설명 : 집들이 게시판 서비스
 */

public interface HouseBoardService {
	public void insertHBoard(HouseBoardVO houseBoard); // 글쓰기 등록
	public int getHBoardCount();
	public List<HouseBoardVO> getHBoardList(Map<String,Object> map);
	public HouseBoardVO getHBoard(int num);
	public void updateHBoard(HouseBoardVO houseBoard);
	public void deleteHBoard(int num);
	// 썸네일 업데이트
	public void updateHThumbnail(HouseBoardVO houseBoard);
	// 글쓰기 이미지 업데이트
	public void updateHImg(HouseBoardVO houseBoard);
}
