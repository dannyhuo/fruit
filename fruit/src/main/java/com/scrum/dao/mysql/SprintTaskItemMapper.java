package com.scrum.dao.mysql;

import com.scrum.model.SprintTaskItem;

public interface SprintTaskItemMapper {
    int deleteByPrimaryKey(Long taskItemId);

    int insert(SprintTaskItem record);

    int insertSelective(SprintTaskItem record);

    SprintTaskItem selectByPrimaryKey(Long taskItemId);

    int updateByPrimaryKeySelective(SprintTaskItem record);

    int updateByPrimaryKey(SprintTaskItem record);
}