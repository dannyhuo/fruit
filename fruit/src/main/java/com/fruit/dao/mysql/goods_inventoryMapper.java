package com.fruit.dao.mysql;

import com.fruit.model.goods_inventory;

public interface goods_inventoryMapper {
    int deleteByPrimaryKey(Long goodsInventoryId);

    int insert(goods_inventory record);

    int insertSelective(goods_inventory record);

    goods_inventory selectByPrimaryKey(Long goodsInventoryId);

    int updateByPrimaryKeySelective(goods_inventory record);

    int updateByPrimaryKey(goods_inventory record);
}