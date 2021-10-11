package kr.spring.qna.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.qna.vo.QnaVO;

public interface QnaMapper {

	@Insert("INSERT INTO service_board (service_num, service_title, service_content, service_email, service_keyword, service_file, mem_num) VALUES (service_board_seq.nextval, #{service_title}, #{service_content}, #{service_email}, #{service_keyword}, #{service_file}, 1)")
	public void qnaInsert(QnaVO serviceboard);
	
	@Select("SELECT COUNT(*) FROM service_board")
	public int getQnaCount();
	
	@Select("SELECT * FROM (SELECT a.*,rownum rnum FROM (SELECT * FROM service_board ORDER BY service_num DESC)a) WHERE rnum >= #{start} AND rnum <= #{end}")
	public List<QnaVO> getQnaList(Map<String, Object> map);
	
	@Select("SELECT * FROM service_board WHERE service_num = #{service_num}")
	public QnaVO getQna(int num);
	
	@Update("UPDATE service_board SET service_title=#{service_title},service_content=#{service_content},service_keyword=#{service_keyword},service_file=#{service_file} WHERE service_num=#{service_num}")
	public void qnaUpdate(QnaVO serviceboard);
	
	@Delete("DELETE FROM service_board WHERE service_num = #{service_num}")
	public void qnaDelete(int num);
	
}
