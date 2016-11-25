package com.fruit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fruit.dao.mysql.DeliveryAddressMapper;
import com.fruit.model.DeliveryAddress;

@Service("deliveryAddressService")
public class DeliveryAddressService {

	@Autowired
	private DeliveryAddressMapper deliveryAddressMapper;
	
	
	public int insertSelective(DeliveryAddress record){
		return deliveryAddressMapper.insertSelective(record);
	}

    public DeliveryAddress selectByPrimaryKey(Long addressId){
    	return deliveryAddressMapper.selectByPrimaryKey(addressId);
    }
	
	public List<DeliveryAddress> queryDeliveryAddress(Long customerId){
		return deliveryAddressMapper.queryDeliveryAddress(customerId);
	}
}
