package kr.spring.houseBoard.service;

import java.util.List;
import java.util.Map;

import kr.spring.houseBoard.vo.HCommentVO;
import kr.spring.houseBoard.vo.HouseBoardVO;

/**
 * @Package Name   : kr.spring.houseBoard.service
 * @FileName  : HouseBoardService.java
 * @작성일       : 2021. 10. 10. 
 * @작성자       : 이현지
 * @프로그램 설명 : 집들이 게시판 서비스
 */

public interface HouseBoardService {
	// =============== 집들이 게시판 & 내가 쓴 글 =============== //
	public List<HouseBoardVO> selectHBoardList(Map<String,Object> map); // 글 목록
	public int selectRowCount(Map<String,Object> map); // 글의 개수
	public List<HouseBoardVO> selectMyBoardList(Map<String, Object> map); // 내가쓴 글 목록
	public int selectMyBoardRowCount(Integer mem_num); // 내가 쓴 글의 개수
	public void insertHBoard(HouseBoardVO houseBoard); // 글쓰기
	public HouseBoardVO selectHBoard(Integer house_num); // 글 상세
	public void updateHBoardHits(Integer house_num); // 조회수
	public void updateHBoard(HouseBoardVO houseBoard); // 글 수정
	public void deleteHBoard(Integer house_num); // 글 삭제
	// 썸네일 삭제(업데이트)
	public void deleteFile(Integer house_num);
	
	// =============== 추천 =============== //
	
	
	// =============== 댓글 =============== //
	public List<HCommentVO> selectListComm(Map<String,Object> map);
	public int selectRowCountComm(Map<String,Object> map);
	public void insertComm(HCommentVO hComment);
	public void updateComm(HCommentVO hComment);
	public void deleteComm(Integer comm_num);
}
