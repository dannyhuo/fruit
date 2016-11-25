package com.fruit.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fruit.dao.mysql.GoodsInventoryMapper;
import com.fruit.model.GoodsInventory;
import com.fruit.model.vo.GoodsInventoryVo;

@Service("goodsInventoryService")
public class GoodsInventoryService {

	@Autowired
	private GoodsInventoryMapper goodsInventoryMapper;
	
	public int deleteByPrimaryKey(Long goodsInventoryId){
		return goodsInventoryMapper.deleteByPrimaryKey(goodsInventoryId);
	}

	public int insert(GoodsInventory record){
    	return goodsInventoryMapper.insert(record);
    }

    public int insertSelective(GoodsInventory record){
    	return goodsInventoryMapper.insertSelective(record);
    }

    public GoodsInventory selectByPrimaryKey(Long goodsInventoryId){
    	return goodsInventoryMapper.selectByPrimaryKey(goodsInventoryId);
    }
    
	/**
	 * 减少库存数量
	 * @param num
	 * @return
	 */
	public int updateByPrimaryKeySelective(GoodsInventory record){
		return goodsInventoryMapper.updateByPrimaryKeySelective(record);
	}
	
	/**
     * 根据条件查询库存
     * @param repostory
     * @return
     */
    public List<GoodsInventoryVo> queryGoodsInventory(Map<String, Object> params){
    	return goodsInventoryMapper.queryInventory(params);
    }
    
    public List<GoodsInventoryVo> querySelective(Map<String, Object> params){
    	return goodsInventoryMapper.querySelective(params);
    }
    
}
