package com.fruit.dao.mysql;

import java.util.List;
import java.util.Map;

import com.fruit.model.Supplier;

public interface SupplierMapper {
    int deleteByPrimaryKey(Long supplierId);

    int insert(Supplier record);

    int insertSelective(Supplier record);

    Supplier selectByPrimaryKey(Long supplierId);

    int updateByPrimaryKeySelective(Supplier record);

    int updateByPrimaryKey(Supplier record);
    
    List<Supplier> querySelective(Map<String, Object> params);
}