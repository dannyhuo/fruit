package com.fruit.dao.oracle;

import com.fruit.model.MobileFavorite;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

public interface MobileFavoriteMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(MobileFavorite record);

    int insertSelective(MobileFavorite record);

    MobileFavorite selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(MobileFavorite record);

    int updateByPrimaryKey(MobileFavorite record);
    
    List<MobileFavorite> queryFavoriterList(Map<String, Object> param);
    
    int countFavoriterList(Map<String, Object> param);
}