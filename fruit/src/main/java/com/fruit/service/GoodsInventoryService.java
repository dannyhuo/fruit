package com.fruit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fruit.dao.mysql.GoodsInventoryMapper;
import com.fruit.model.GoodsInventory;
import com.fruit.model.Repostory;

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
	
	/**
     * 根据仓库条件查询库存
     * @param repostory
     * @return
     */
    public List<GoodsInventory> queryInventory(Repostory repostory){
    	return goodsInventoryMapper.queryInventory(repostory);
    }
}
