package com.fruit.dao.mysql;

import java.util.List;
import java.util.Map;

import com.fruit.model.Employee;
import com.fruit.model.vo.EmployeeVo;

public interface EmployeeMapper {
    int deleteByPrimaryKey(Long employeeId);

    int insert(Employee record);

    int insertSelective(Employee record);

    Employee selectByPrimaryKey(Long employeeId);

    int updateByPrimaryKeySelective(Employee record);

    int updateByPrimaryKey(Employee record);
    
    List<EmployeeVo> querySelective(Map<String, Object> params);
}