package com.fruit.dao.mysql;

import java.util.List;
import java.util.Map;

import com.fruit.model.FruitOrderDetail;
import com.fruit.model.vo.FruitOrderDetailVo;

public interface FruitOrderDetailMapper {
    int deleteByPrimaryKey(Long orderDetailId);

    int insert(FruitOrderDetail record);

    int insertSelective(FruitOrderDetail record);

    FruitOrderDetail selectByPrimaryKey(Long orderDetailId);

    int updateByPrimaryKeySelective(FruitOrderDetail record);

    int updateByPrimaryKey(FruitOrderDetail record);
    
    List<FruitOrderDetailVo> querySelective(Map<String, Object> params);
}