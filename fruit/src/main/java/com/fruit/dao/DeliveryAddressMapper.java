package com.fruit.dao;

import com.fruit.model.DeliveryAddress;

public interface DeliveryAddressMapper {
    int deleteByPrimaryKey(Long addressId);

    int insert(DeliveryAddress record);

    int insertSelective(DeliveryAddress record);

    DeliveryAddress selectByPrimaryKey(Long addressId);

    int updateByPrimaryKeySelective(DeliveryAddress record);

    int updateByPrimaryKey(DeliveryAddress record);
}