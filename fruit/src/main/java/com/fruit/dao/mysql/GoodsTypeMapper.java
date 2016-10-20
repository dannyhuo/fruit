package com.fruit.dao.mysql;

import com.fruit.model.GoodsType;

public interface GoodsTypeMapper {
    int deleteByPrimaryKey(Long goodsTypeId);

    int insert(GoodsType record);

    int insertSelective(GoodsType record);

    GoodsType selectByPrimaryKey(Long goodsTypeId);

    int updateByPrimaryKeySelective(GoodsType record);

    int updateByPrimaryKey(GoodsType record);
}