package com.fruit.dao.mysql;

import java.util.List;
import java.util.Map;

import com.fruit.model.Customer;

public interface CustomerMapper {
    int deleteByPrimaryKey(Long customerId);

    int insert(Customer record);

    int insertSelective(Customer record);

    Customer selectByPrimaryKey(Long customerId);

    int updateByPrimaryKeySelective(Customer record);

    int updateByPrimaryKey(Customer record);
    
    List<Customer> querySelective(Map<String, Object> params);
}