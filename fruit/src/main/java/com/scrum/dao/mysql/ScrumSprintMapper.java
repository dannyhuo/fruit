package com.scrum.dao.mysql;

import com.scrum.model.ScrumSprint;

public interface ScrumSprintMapper {
    int deleteByPrimaryKey(Long sprintId);

    int insert(ScrumSprint record);

    int insertSelective(ScrumSprint record);

    ScrumSprint selectByPrimaryKey(Long sprintId);

    int updateByPrimaryKeySelective(ScrumSprint record);

    int updateByPrimaryKey(ScrumSprint record);
}