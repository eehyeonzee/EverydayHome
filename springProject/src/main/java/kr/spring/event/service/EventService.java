package kr.spring.event.service;

import java.util.List;
import java.util.Map;

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
}
