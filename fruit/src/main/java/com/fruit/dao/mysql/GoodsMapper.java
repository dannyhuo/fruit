package com.fruit.dao.mysql;

import java.util.List;
import java.util.Map;

import com.fruit.model.Goods;
import com.fruit.model.vo.GoodsVo;

public interface GoodsMapper {
    int deleteByPrimaryKey(Long goodsId);

    int insert(Goods record);

    int insertSelective(Goods record);

    Goods selectByPrimaryKey(Long goodsId);

    int updateByPrimaryKeySelective(Goods record);

    int updateByPrimaryKey(Goods record);
    
    List<GoodsVo> selectByParam(Map<String, Object> params);
    
    Long selectCountByParam(Map<String, Object> params);
    
    /**
     * 通过关键字搜索
     * @param keyWords
     * @return
     */
    List<GoodsVo> search(Map<String, Object> params);
    
    Long searchCount(Map<String, Object> params);
    
}