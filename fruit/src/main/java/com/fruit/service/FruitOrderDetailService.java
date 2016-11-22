package com.fruit.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fruit.dao.mysql.FruitOrderDetailMapper;
import com.fruit.model.FruitOrderDetail;
import com.fruit.model.vo.FruitOrderDetailVo;

@Service("fruitOrderDetailService")
public class FruitOrderDetailService {
	
	@Autowired
	private FruitOrderDetailMapper fruitOrderDetailMapper;

	public int deleteByPrimaryKey(Long orderDetailId){
		return fruitOrderDetailMapper.deleteByPrimaryKey(orderDetailId);
	}

	public int insert(FruitOrderDetail record){
		return fruitOrderDetailMapper.insert(record);
	}

	public int insertSelective(FruitOrderDetail record){
		return fruitOrderDetailMapper.insertSelective(record);
	}

	public FruitOrderDetail selectByPrimaryKey(Long orderDetailId){
		return fruitOrderDetailMapper.selectByPrimaryKey(orderDetailId);
	}

	public int updateByPrimaryKeySelective(FruitOrderDetail record){
		return fruitOrderDetailMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(FruitOrderDetail record){
		return fruitOrderDetailMapper.updateByPrimaryKey(record);
	}
    
	public List<FruitOrderDetailVo> querySelective(Map<String, Object> params){
		return fruitOrderDetailMapper.querySelective(params);
	}
}
