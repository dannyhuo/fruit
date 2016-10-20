package com.fruit.dao.mysql;

import com.fruit.model.Repostory;

public interface RepostoryMapper {
    int deleteByPrimaryKey(Long repostoryId);

    int insert(Repostory record);

    int insertSelective(Repostory record);

    Repostory selectByPrimaryKey(Long repostoryId);

    int updateByPrimaryKeySelective(Repostory record);

    int updateByPrimaryKey(Repostory record);
}