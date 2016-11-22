package com.fruit.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fruit.dao.mysql.EmployeeMapper;
import com.fruit.model.Employee;
import com.fruit.model.vo.EmployeeVo;

@Service("employeeService")
public class EmployeeService {
	@Autowired
	private EmployeeMapper employeeMapper;
	
	public int deleteByPrimaryKey(Long employeeId){
		return employeeMapper.deleteByPrimaryKey(employeeId);
	}

	public int insert(Employee record){
		return employeeMapper.insert(record);
	}

	public int insertSelective(Employee record){
		return employeeMapper.insertSelective(record);
	}

	public Employee selectByPrimaryKey(Long employeeId){
		return employeeMapper.selectByPrimaryKey(employeeId);
	}

	public int updateByPrimaryKeySelective(Employee record){
		return employeeMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Employee record){
		return employeeMapper.updateByPrimaryKey(record);
	}
    
	public List<EmployeeVo> querySelective(Map<String, Object> params){
		return employeeMapper.querySelective(params);
	}
}
