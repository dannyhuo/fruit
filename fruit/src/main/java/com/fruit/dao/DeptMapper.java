package com.fruit.dao;

import com.fruit.model.Dept;

public interface DeptMapper {
    int deleteByPrimaryKey(Short deptId);

    int insert(Dept record);

    int insertSelective(Dept record);

    Dept selectByPrimaryKey(Short deptId);

    int updateByPrimaryKeySelective(Dept record);

    int updateByPrimaryKey(Dept record);
}