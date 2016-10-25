package com.fruit.dao.mysql;

import java.util.List;

import com.fruit.model.Goods;
import com.fruit.model.vo.GoodsVo;

public interface GoodsMapper {
    int deleteByPrimaryKey(Long goodsId);

    int insert(Goods record);

    int insertSelective(Goods record);

    Goods selectByPrimaryKey(Long goodsId);

    int updateByPrimaryKeySelective(Goods record);

    int updateByPrimaryKey(Goods record);
    
    List<GoodsVo> selectByParam(GoodsVo goodsVo);
    
    /**
     * 通过关键字搜索
     * @param keyWords
     * @return
     */
    List<GoodsVo> search(GoodsVo goodsVo);
    
}