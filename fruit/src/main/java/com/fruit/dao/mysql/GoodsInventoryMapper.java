package com.fruit.dao.mysql;

import com.fruit.model.GoodsInventory;

public interface GoodsInventoryMapper {
    int deleteByPrimaryKey(Long goodsInventoryId);

    int insert(GoodsInventory record);

    int insertSelective(GoodsInventory record);

    GoodsInventory selectByPrimaryKey(Long goodsInventoryId);

    int updateByPrimaryKeySelective(GoodsInventory record);

    int updateByPrimaryKey(GoodsInventory record);
}