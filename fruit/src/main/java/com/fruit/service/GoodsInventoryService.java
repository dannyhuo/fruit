package com.fruit.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fruit.dao.mysql.GoodsInventoryMapper;
import com.fruit.model.GoodsInventory;

@Service("goodsInventoryService")
public class GoodsInventoryService {

	@Autowired
	private GoodsInventoryMapper goodsInventoryMapper;
	
	/**
	 * 减少库存数量
	 * @param num
	 * @return
	 */
	public int updateByPrimaryKeySelective(GoodsInventory record){
		return goodsInventoryMapper.updateByPrimaryKeySelective(record);
	}
}
