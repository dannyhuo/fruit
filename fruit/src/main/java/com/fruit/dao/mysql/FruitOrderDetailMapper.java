package com.fruit.dao.mysql;

import com.fruit.model.FruitOrderDetail;

public interface FruitOrderDetailMapper {
    int deleteByPrimaryKey(Long orderDetailId);

    int insert(FruitOrderDetail record);

    int insertSelective(FruitOrderDetail record);

    FruitOrderDetail selectByPrimaryKey(Long orderDetailId);

    int updateByPrimaryKeySelective(FruitOrderDetail record);

    int updateByPrimaryKey(FruitOrderDetail record);
}