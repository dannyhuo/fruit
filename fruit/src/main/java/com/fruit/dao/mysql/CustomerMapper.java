package com.fruit.dao.mysql;

import java.util.List;
import java.util.Map;

import com.fruit.model.Customer;
import com.fruit.model.vo.CustomerVo;

public interface CustomerMapper {
    int deleteByPrimaryKey(Long customerId);

    int insert(Customer record);

    int insertSelective(Customer record);

    Customer selectByPrimaryKey(Long customerId);

    int updateByPrimaryKeySelective(Customer record);

    int updateByPrimaryKey(Customer record);
    
    List<CustomerVo> querySelective(Map<String, Object> params);
}