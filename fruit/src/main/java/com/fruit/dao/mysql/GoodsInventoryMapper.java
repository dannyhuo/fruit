package com.fruit.dao.mysql;

import java.util.List;

import com.fruit.model.GoodsInventory;
import com.fruit.model.Repostory;

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
    List<GoodsInventory> queryInventory(Repostory repostory);
}