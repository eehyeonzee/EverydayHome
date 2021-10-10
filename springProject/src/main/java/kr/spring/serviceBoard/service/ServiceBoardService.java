package kr.spring.serviceBoard.service;

import java.util.List;
import java.util.Map;

import kr.spring.serviceBoard.vo.ServiceBoardVO;

public interface ServiceBoardService {
	public void serviceBoardInsert(ServiceBoardVO serviceBoard);
	public int getServiceBoardCount();
	public List<ServiceBoardVO> getServiceBoardList(Map<String,Object> map);
	public ServiceBoardVO getServiceBoard(int num);
	public void serviceBoardUpdate(ServiceBoardVO board);
	public void serviceBoardDelete(int num);
}
