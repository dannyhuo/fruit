package com.fruit.dao.mysql;

import java.util.List;
import java.util.Map;

import com.fruit.model.Repostory;
import com.fruit.model.vo.RepostoryVo;

public interface RepostoryMapper {
    int deleteByPrimaryKey(Long repostoryId);

    int insert(Repostory record);

    int insertSelective(Repostory record);

    Repostory selectByPrimaryKey(Long repostoryId);

    int updateByPrimaryKeySelective(Repostory record);

    int updateByPrimaryKey(Repostory record);
    
    List<RepostoryVo> querySelective(Map<String, Object> params);
}