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
	public List<HouseBoardVO> selectHBoardList(Map<String,Object> map); // 글 목록
	public int selectRowCount(Map<String,Object> map);
	public void insertHBoard(HouseBoardVO houseBoard); // 글 등록
	public HouseBoardVO selectHBoard(Integer house_num); // 글 상세
	public void updateHBoardHits(Integer house_num); // 조회수
	public void updateHBoard(HouseBoardVO houseBoard); // 글 수정
	public void deleteHBoard(int house_num); // 글 삭제
	public String getHBoardNick(Integer mem_num); // 닉네임
	// 썸네일 업데이트
	public void updateHThumbnail(HouseBoardVO houseBoard);
	// 글쓰기 이미지 업데이트
	public void updateHImg(HouseBoardVO houseBoard);
}
