package kr.spring.event.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.event.vo.EventVO;

public interface EventMapper {
	@Insert("INSERT INTO event (event_num,event_title,event_content,event_type,event_hits,event_reg_date,event_modi,mem_num,event_filename,event_photo) VALUES(event_seq.nextval,#{event_title},#{event_content},'1',1,SYSDATE,SYSDATE,#{mem_num},#{event_filename},#{event_photo})")
	public void eventWrite(EventVO eventVO);
	@Select("select count(*) from event")
	public int eventTotalCount();
	@Select("SELECT * FROM event where event_num=#{event_num}")
	public EventVO eventDetail(int event_num);
	@Update("UPDATE event SET event_title=#{event_title},event_content=#{event_content} WHERE event_num=#{event_num}")
	public void eventUpdate(EventVO eventVO);
	@Delete("DELETE FROM event WHERE event_num=#{event_num}")
	public void eventDelete(int event_num);
	@Select("select * FROM (select a.*,rownum rnum FROM (SELECT * FROM event ORDER BY event_reg_date DESC)a)WHERE rnum>= #{start} AND rnum <= #{end}")
	public List<EventVO> eventGetList(Map<String,Object> map);
	@Update("UPDATE event SET event_hits=event_hits+1 WHERE event_num=#{event_num}")
	public int eventGetHits(int event_num);
	@Update("UPDATE spboard SET event_filename = '', event_photo = '' WHERE event_num = #{event_num}")
	public void deleteFile(Integer event_num);
}
