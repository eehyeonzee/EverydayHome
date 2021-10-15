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
	public List<HouseBoardVO> selectHBoardList(Map<String,Object> map); // 글 목록
	public int selectRowCount(Map<String,Object> map); // 글의 개수
	@Insert("INSERT INTO house_board (house_num,house_title,house_area,house_type,house_style,house_space,house_content,house_thumbnail,thumbnail_filename,mem_num)"
			+ " VALUES (house_board_seq.nextval,#{house_title},#{house_area},#{house_type},#{house_style},#{house_space},#{house_content},#{house_thumbnail},#{thumbnail_filename},#{mem_num})")
	public void insertHBoard(HouseBoardVO houseBoard); // 글쓰기
	@Select("SELECT * FROM house_board b JOIN member m ON b.mem_num = m.mem_num WHERE b.house_num = #{house_num}")
	public HouseBoardVO selectHBoard(Integer house_num); // 글 상세
	@Update("UPDATE house_board SET house_hits=house_hits+1 WHERE house_num = #{house_num}")
	public void updateHBoardHits(Integer house_num); // 조회수
	public void updateHBoard(HouseBoardVO houseBoard); // 글 수정
	@Delete("DELETE FROM house_board WHERE house_num = #{house_num}")
	public void deleteHBoard(Integer house_num); // 글 삭제
	// 썸네일 삭제(업데이트)
	@Update("UPDATE house_board SET house_thumbnail = '', thumbnail_filename = '' WHERE house_num = #{house_num}")
	public void deleteFile(Integer house_num);
}
