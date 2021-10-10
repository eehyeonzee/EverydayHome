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
	public void insertHBoard(HouseBoardVO houseBoard) {
		houseBoardMapper.insertHBoard(houseBoard);
	}

	@Override
	public int getHBoardCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<HouseBoardVO> getHBoardList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HouseBoardVO getHBoard(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateHBoard(HouseBoardVO houseBoard) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteHBoard(int num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateHThumbnail(HouseBoardVO houseBoard) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateHImg(HouseBoardVO houseBoard) {
		// TODO Auto-generated method stub
		
	}
	
}
