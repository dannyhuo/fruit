package com.fruit.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fruit.dao.mysql.SupplierMapper;
import com.fruit.model.Supplier;

@Service("supplierService")
public class SupplierService {
	
	@Autowired
	private SupplierMapper supplierMapper;

	public int deleteByPrimaryKey(Long supplierId){
		return supplierMapper.deleteByPrimaryKey(supplierId);
	}

	public int insert(Supplier record){
    	return supplierMapper.insert(record);
    }

	public int insertSelective(Supplier record){
    	return supplierMapper.insertSelective(record);
    }

	public Supplier selectByPrimaryKey(Long supplierId){
    	return supplierMapper.selectByPrimaryKey(supplierId);
    }

	public int updateByPrimaryKeySelective(Supplier record){
    	return supplierMapper.updateByPrimaryKeySelective(record);
    }

	public int updateByPrimaryKey(Supplier record){
    	return supplierMapper.updateByPrimaryKey(record);
    }
    
	public List<Supplier> querySelective(Map<String, Object> params){
		return supplierMapper.querySelective(params);
	}
}
