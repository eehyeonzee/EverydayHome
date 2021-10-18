package kr.spring.event.service;

import java.util.List;
import java.util.Map;

import kr.spring.event.vo.ECommentVO;
import kr.spring.event.vo.EventVO;

public interface EventService {
	public void eventWrite(EventVO eventVO);
	public int eventTotalCount();
	public EventVO eventDetail(int event_num);
	public void eventUpdate(EventVO eventVO);
	public void eventDelete(int event_num);
	public List<EventVO> eventGetList(Map<String,Object> map);
	public int eventGetHits(int event_num);
	public void deleteFile(Integer event_num);
	
	//댓글
	public List<ECommentVO> selectListEComment(Map<String, Object>map);
	public int selectRowCountComment(Map<String, Object>map);
	public void insertEComment(ECommentVO eComment);
	public void updateEComment(ECommentVO eComment);
	public void deleteEComment(Integer comm_num);
}
