package com.scrum.dao.mysql;

import com.scrum.model.SprintTask;

public interface SprintTaskMapper {
    int deleteByPrimaryKey(Long taskId);

    int insert(SprintTask record);

    int insertSelective(SprintTask record);

    SprintTask selectByPrimaryKey(Long taskId);

    int updateByPrimaryKeySelective(SprintTask record);

    int updateByPrimaryKey(SprintTask record);
}