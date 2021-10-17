package kr.spring.houseBoard.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.houseBoard.dao.HouseBoardMapper;
import kr.spring.houseBoard.vo.HouseBoardVO;

/**
 * @Package Name   : kr.spring.houseBoard.service
 * @FileName  : HouseBoardServiceImpl.java
 * @작성일       : 2021. 10. 10. 
 * @작성자       : 이현지
 * @프로그램 설명 : 집들이 게시판 서비스임플리먼트
 */

@Service
@Transactional
public class HouseBoardServiceImpl implements HouseBoardService {
	
	@Autowired
	private HouseBoardMapper houseBoardMapper;
	
	@Override
	public List<HouseBoardVO> selectHBoardList(Map<String, Object> map) {
		return houseBoardMapper.selectHBoardList(map);
	}

	@Override
	public int selectRowCount(Map<String, Object> map) {
		return houseBoardMapper.selectRowCount(map);
	}

	@Override
	public void insertHBoard(HouseBoardVO houseBoard) {
		houseBoardMapper.insertHBoard(houseBoard);
	}

	@Override
	public HouseBoardVO selectHBoard(Integer house_num) {
		return houseBoardMapper.selectHBoard(house_num);
	}

	@Override
	public void updateHBoardHits(Integer house_num) {
		houseBoardMapper.updateHBoardHits(house_num);
	}

	@Override
	public void updateHBoard(HouseBoardVO houseBoard) {
		houseBoardMapper.updateHBoard(houseBoard);
	}

	@Override
	public void deleteHBoard(int house_num) {
		houseBoardMapper.deleteHBoard(house_num);
	}

	@Override
	public void deleteFile(Integer house_num) {
		houseBoardMapper.deleteFile(house_num);	
	}

	@Override
	public List<HouseBoardVO> selectMyBoardList(Map<String, Object> map) {
		return houseBoardMapper.selectMyBoardList(map);
	}

	@Override
	public int selectMyBoardRowCount(Integer mem_num) {
		return houseBoardMapper.selectMyBoardRowCount(mem_num);
	}

	


	
}
