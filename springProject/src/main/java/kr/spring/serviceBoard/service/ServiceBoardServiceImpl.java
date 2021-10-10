package kr.spring.serviceBoard.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.serviceBoard.dao.ServiceBoardMapper;
import kr.spring.serviceBoard.vo.ServiceBoardVO;

/**
 * @Package Name   : kr.spring.serviceBoard.service
 * @FileName  : ServiceBoardServiceImpl.java
 * @작성일       : 2021. 10. 10. 
 * @작성자       : 나윤경
 * @프로그램 설명 : 
 */
@Service
@Transactional
public class ServiceBoardServiceImpl implements ServiceBoardService {

	@Autowired
	private ServiceBoardMapper serviceBoardMapper;
	
	@Override
	public void serviceBoardInsert(ServiceBoardVO serviceBoard) {
		serviceBoardMapper.serviceBoardInsert(serviceBoard);
	}

	@Override
	public int getServiceBoardCount() {
		return serviceBoardMapper.getServiceBoardCount();
	}

	@Override
	public List<ServiceBoardVO> getServiceBoardList(Map<String, Object> map) {
		return serviceBoardMapper.getBoardList(map);
	}

	@Override
	public ServiceBoardVO getServiceBoard(int num) {
		return serviceBoardMapper.getServiceBoard(num);
	}

	@Override
	public void serviceBoardUpdate(ServiceBoardVO board) {
		serviceBoardMapper.serviceBoardUpdate(board);
	}

	@Override
	public void serviceBoardDelete(int num) {
		serviceBoardMapper.serviceBoardDelete(num);
	}

}
