package kr.spring.store.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.store.dao.StoreMapper;
import kr.spring.store.vo.StoreVO;

@Service
@Transactional
public class StoreServiceImpl implements StoreService{

	@Autowired
	private StoreMapper storeMapper;
	
	@Override
	public void productRegister(StoreVO storeVO) {
		storeMapper.productRegister(storeVO);
	}

}
