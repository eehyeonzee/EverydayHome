package kr.spring.qna.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.qna.dao.QnaMapper;
import kr.spring.qna.vo.QnaVO;

@Service
@Transactional
public class QnaServiceImpl implements QnaService{

	@Autowired
	private QnaMapper qnaMapper;
	
	@Override
	public void qnaInsert(QnaVO qna) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int getQnaCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<QnaVO> getQnaList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public QnaVO getQna(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void qnaUpdate(QnaVO qna) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void qnaDelete(int num) {
		// TODO Auto-generated method stub
		
	}

	
	

}
