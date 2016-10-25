package com.fruit.dao.mysql;

import java.util.List;

import com.fruit.model.GoodsType;
import com.fruit.model.vo.GoodsTypeVo;

public interface GoodsTypeMapper {
    int deleteByPrimaryKey(Long goodsTypeId);

    int insert(GoodsType record);

    int insertSelective(GoodsType record);

    GoodsType selectByPrimaryKey(Long goodsTypeId);

    int updateByPrimaryKeySelective(GoodsType record);

    int updateByPrimaryKey(GoodsType record);
    
    List<GoodsTypeVo> selectByParam(GoodsTypeVo goodsTypeVo);
}