package com.fruit.dao.mysql;

import java.util.List;

import com.fruit.model.BackMenu;

public interface BackMenuMapper {
    int deleteByPrimaryKey(Long backMenuId);

    int insert(BackMenu record);

    int insertSelective(BackMenu record);

    BackMenu selectByPrimaryKey(Long backMenuId);

    int updateByPrimaryKeySelective(BackMenu record);

    int updateByPrimaryKey(BackMenu record);
    
    List<BackMenu> querySelective(BackMenu record);
}