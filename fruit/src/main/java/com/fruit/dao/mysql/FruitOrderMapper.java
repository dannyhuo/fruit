package com.fruit.dao.mysql;

import com.fruit.model.FruitOrder;
import com.fruit.model.vo.FruitOrderVo;

public interface FruitOrderMapper {
    int deleteByPrimaryKey(Long orderId);

    int insert(FruitOrder record);

    int insertSelective(FruitOrder record);

    FruitOrderVo selectByPrimaryKey(Long orderId);

    int updateByPrimaryKeySelective(FruitOrder record);

    int updateByPrimaryKey(FruitOrder record);
}