package com.fruit.dao;

import com.fruit.model.MobileFavorite;
import com.fruit.model.MobileFavoriteHistory;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

public interface MobileFavoriteHistoryMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(MobileFavoriteHistory record);

    int insertSelective(MobileFavoriteHistory record);

    MobileFavoriteHistory selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(MobileFavoriteHistory record);

    int updateByPrimaryKey(MobileFavoriteHistory record);
    
    List<MobileFavorite> queryFavoriterList(Map<String, Object> param);
    
    int countFavoriterList(Map<String, Object> param);
}