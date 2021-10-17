package kr.spring.houseBoard.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.houseBoard.vo.HouseBoardVO;    

/**
 * @Package Name   : kr.spring.houseBoard.dao
 * @FileName  : HouseBoardMapper.java
 * @작성일       : 2021. 10. 10. 
 * @작성자       : 이현지
 * @프로그램 설명 : 집들이 게시판 DAO
 */

public interface HouseBoardMapper {
		// =============== 집들이 게시판 & 내가 쓴 글 =============== //
		public List<HouseBoardVO> selectHBoardList(Map<String,Object> map); // 글 목록
		public int selectRowCount(Map<String,Object> map); // 글의 개수
		public List<HouseBoardVO> selectMyBoardList(Map<String, Object> map);   // 내가 쓴 글 목록
		@Select("SELECT COUNT(*) FROM house_board b JOIN mem_detail m ON b.mem_num = m.mem_num WHERE m.mem_num=#{mem_num}")
		public int selectMyBoardRowCount(Integer mem_num); // 내가 쓴 글의 개수
		@Insert("INSERT INTO house_board (house_num,house_title,house_area,house_type,house_style,house_space,house_content,house_thumbnail,thumbnail_filename,mem_num)"
				+ " VALUES (house_board_seq.nextval,#{house_title},#{house_area},#{house_type},#{house_style},#{house_space},#{house_content},#{house_thumbnail},#{thumbnail_filename},#{mem_num})")
		public void insertHBoard(HouseBoardVO houseBoard); // 글쓰기
		@Select("SELECT * FROM house_board b JOIN mem_detail m ON b.mem_num = m.mem_num WHERE b.house_num = #{house_num}")
		public HouseBoardVO selectHBoard(Integer house_num); // 글 상세
		@Update("UPDATE house_board SET house_hits=house_hits+1 WHERE house_num = #{house_num}")
		public void updateHBoardHits(Integer house_num); // 조회수 증가
		public void updateHBoard(HouseBoardVO houseBoard); // 글 수정
		@Delete("DELETE FROM house_board WHERE house_num = #{house_num}")
		public void deleteHBoard(Integer house_num); // 글 삭제
		// 썸네일 삭제(업데이트)
		@Update("UPDATE house_board SET house_thumbnail = '', thumbnail_filename = '' WHERE house_num = #{house_num}")
		public void deleteFile(Integer house_num);
		
		// =============== 추천 =============== //
		@Insert("INSERT INTO recommend (house_num, mem_num) VALUES (#{house_num}, #{mem_num})")
		public void saveHeart(HouseBoardVO houseBoard); // 테이블에 추천수 저장
		
		@Update("UPDATE house_board SET house_recom = house_recom+1 WHERE house_num = #{house_num}")
		public void plusHeart(Integer house_num); // 추천하기 (+1)
		@Update("UPDATE house_board SET house_recom = house_recom-1 WHERE house_num = #{house_num}")
		public void minusHeart(Integer house_num); // 추천 취소 (-1)
		
		@Select("SELECT house_recom FROM house_board WHERE house_num = #{house_num}")
		public int selectHeartCount(Integer house_num); // 추천수 불러오기
		@Select("SELECT COUNT(*) FROM recommend WHERE house_num = #{house_num} AND mem_num = #{mem_num}")
		public int heartDuplicationCheck(Integer house_num); // 추천수 중복 체크
		
		@Delete("DELETE FROM recommend WHERE house_num = #{house_num} AND mem_num = #{mem_num}")
		public void removeHeart(Integer house_num); // 테이블에서 추천수 제거

		// =============== 댓글 =============== //
		/*
		 * public List<HCommentsVO> selectHCommentsList(Map<String,Object> map); // 댓글
		 * 목록 public int selectHCommentsCount(Map<String,Object> map); // 댓글 개수 public
		 * void insertHcomments(HCommentsVO hComments); // 댓글 쓰기 public void
		 * updateHComments(HCommentsVO hComments); // 댓글 수정 public void
		 * deleteHComments(Integer comm_num);
		 */

}







