package com.fruit.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fruit.dao.mysql.PurchaseOrderDetailMapper;
import com.fruit.model.PurchaseOrderDetail;
import com.fruit.model.vo.PurchaseOrderDetailVo;

@Service("purchaseOrderDetailService")
public class PurchaseOrderDetailService {

	@Autowired
	private PurchaseOrderDetailMapper purchaseOrderDetailMapper;
	
	public int deleteByPrimaryKey(Long purchaseOrderDetailId){
		return purchaseOrderDetailMapper.deleteByPrimaryKey(purchaseOrderDetailId);
	}

	public int insert(PurchaseOrderDetail record){
    	return purchaseOrderDetailMapper.insert(record);
    }

	public int insertSelective(PurchaseOrderDetail record){
    	return purchaseOrderDetailMapper.insertSelective(record);
    }

	public PurchaseOrderDetail selectByPrimaryKey(Long purchaseOrderDetailId){
    	return purchaseOrderDetailMapper.selectByPrimaryKey(purchaseOrderDetailId);
    }

	public int updateByPrimaryKeySelective(PurchaseOrderDetail record){
    	return purchaseOrderDetailMapper.updateByPrimaryKeySelective(record);
    }

	public int updateByPrimaryKey(PurchaseOrderDetail record){
    	return purchaseOrderDetailMapper.updateByPrimaryKey(record);
    }
    
	public List<PurchaseOrderDetailVo> querySelective(Map<String, Object> params){
    	return purchaseOrderDetailMapper.querySelective(params);
    }
}
