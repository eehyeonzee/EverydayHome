package kr.spring.store.service;

import java.util.List;
import java.util.Map;

import kr.spring.store.vo.StoreVO;

public interface StoreService {

	public void productRegister(StoreVO storeVO);
	public List<StoreVO> selectList(Map<String, Object> map);
	public int selectRowCount(Map<String, Object> map);
	public StoreVO selectProduct(Integer prod_num);
	public void updateProduct(StoreVO storeVO);
	public void deleteThumbnail(Integer prod_num);
}
