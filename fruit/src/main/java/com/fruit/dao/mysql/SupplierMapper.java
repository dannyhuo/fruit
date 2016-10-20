package com.fruit.dao.mysql;

import com.fruit.model.Supplier;

public interface SupplierMapper {
    int deleteByPrimaryKey(Long supplierId);

    int insert(Supplier record);

    int insertSelective(Supplier record);

    Supplier selectByPrimaryKey(Long supplierId);

    int updateByPrimaryKeySelective(Supplier record);

    int updateByPrimaryKey(Supplier record);
}