package kr.spring.event.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.event.dao.EventMapper;
import kr.spring.event.vo.EventVO;
@Service
@Transactional
public class EventServiceImpl implements EventService{

	@Autowired
	private EventMapper eventMapper;
	
	@Override
	public void eventWrite(EventVO event) {
		eventMapper.eventWrite(event);
		
	}

	@Override
	public int eventTotalCount() {
		return eventMapper.eventTotalCount();
	}


	@Override
	public EventVO eventDetail(int event_num) {
		return eventMapper.eventDetail(event_num);
	}

	@Override
	public void eventUpdate(EventVO event) {
		eventMapper.eventUpdate(event);
	}

	@Override
	public void eventDelete(int event_num) {
		eventMapper.eventDelete(event_num);
	}

	@Override
	public List<EventVO> eventGetList(Map<String, Object> map) {
		return eventMapper.eventGetList(map);
	}

	@Override
	public int eventGetHits(int event_num) {
		return eventMapper.eventGetHits(event_num);
	}

	@Override
	public void deleteFile(Integer event_num) {
		eventMapper.deleteFile(event_num);
		
	}


}
