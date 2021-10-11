package kr.spring.serviceBoard.dao;

import org.apache.ibatis.annotations.Insert;

import kr.spring.serviceBoard.vo.ServiceBoardVO;

public interface ServiceBoardMapper {  

	@Insert("INSERT INTO service_board (service_num, service_title, service_content, service_email, service_keyword, service_file, mem_num) VALUES (service_board_seq.nextval, #{service_title}, #{service_content}, #{service_email}, #{service_keyword}, #{service_file}, 1)")
	public void serviceBoardInsert(ServiceBoardVO serviceboard);
	
}
