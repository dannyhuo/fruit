package com.fruit.dao.mysql;

import java.util.List;
import java.util.Map;

import com.fruit.model.GoodsInventory;
import com.fruit.model.vo.GoodsInventoryVo;

public interface GoodsInventoryMapper {
    int deleteByPrimaryKey(Long goodsInventoryId);

    int insert(GoodsInventory record);

    int insertSelective(GoodsInventory record);

    GoodsInventory selectByPrimaryKey(Long goodsInventoryId);

    int updateByPrimaryKeySelective(GoodsInventory record);

    int updateByPrimaryKey(GoodsInventory record);
    
    /**
     * 根据仓库条件查询库存
     * @param repostory
     * @return
     */
    List<GoodsInventoryVo> queryInventory(Map<String, Object> params);
    
    List<GoodsInventoryVo> querySelective(Map<String, Object> params);
}