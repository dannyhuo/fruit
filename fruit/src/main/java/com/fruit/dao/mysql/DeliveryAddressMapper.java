package com.fruit.dao.mysql;

import java.util.List;

import com.fruit.model.DeliveryAddress;

public interface DeliveryAddressMapper {
    int deleteByPrimaryKey(Long addressId);

    int insert(DeliveryAddress record);

    int insertSelective(DeliveryAddress record);

    DeliveryAddress selectByPrimaryKey(Long addressId);

    int updateByPrimaryKeySelective(DeliveryAddress record);

    int updateByPrimaryKey(DeliveryAddress record);
    
    List<DeliveryAddress> queryDeliveryAddress(Long customerId);
}