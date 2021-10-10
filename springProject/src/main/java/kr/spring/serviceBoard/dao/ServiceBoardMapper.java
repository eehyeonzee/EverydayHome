package kr.spring.serviceBoard.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.spring.serviceBoard.vo.ServiceBoardVO;

public interface ServiceBoardMapper {

	@Insert("INSERT INTO service_board (service_num, service_title, service_content, service_email, service_keyword, service_file, mem_num)"
			+ "VALUES (service_board_seq.nextval, #{service_title}, #{service_content},"
			+ "#{service_email}, #{service_keyword}, #{service_file}, #{mem_num}")
	public void serviceBoardInsert(ServiceBoardVO serviceboard);
	
	@Select("SELECT COUNT(*) FROM service_board")
	public int getServiceBoardCount();
	
	public List<ServiceBoardVO> getBoardList(Map<String, Object> map);
	
	
	
}
