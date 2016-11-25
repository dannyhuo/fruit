package com.fruit.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fruit.dao.mysql.PurchaseOrderDetailMapper;
import com.fruit.dao.mysql.PurchaseOrderMapper;
import com.fruit.model.PurchaseOrder;
import com.fruit.model.vo.PurchaseOrderDetailVo;
import com.fruit.model.vo.PurchaseOrderVo;

@Service("purchaseOrderService")
public class PurchaseOrderService {
	
	@Autowired
	private PurchaseOrderMapper purchaseOrderMapper;
	
	@Autowired
	private PurchaseOrderDetailMapper purchaseOrderDetailMapper;

	public int deleteByPrimaryKey(Long purchaseOrderId){
		return purchaseOrderMapper.deleteByPrimaryKey(purchaseOrderId);
	}

	public int insert(PurchaseOrder record){
    	return purchaseOrderMapper.insert(record);
    }

	public int insertSelective(PurchaseOrder record){
    	return purchaseOrderMapper.insertSelective(record);
    }

	public PurchaseOrder selectByPrimaryKey(Long purchaseOrderId){
    	return purchaseOrderMapper.selectByPrimaryKey(purchaseOrderId);
    }

	public int updateByPrimaryKeySelective(PurchaseOrder record){
    	return purchaseOrderMapper.updateByPrimaryKeySelective(record);
    }

	public int updateByPrimaryKey(PurchaseOrder record){
    	return purchaseOrderMapper.updateByPrimaryKey(record);
    }
    
	public List<PurchaseOrderVo> querySelective(Map<String, Object> params){
    	return purchaseOrderMapper.querySelective(params);
    }
	
	/**
	 * 创建采购单
	 * @param purchaseOrderVo
	 */
	public void savePurchaseOrder(PurchaseOrderVo purchaseOrderVo){
		if(null != purchaseOrderVo){
			purchaseOrderMapper.insertSelective(purchaseOrderVo);
			
			if(null != purchaseOrderVo.getPurchaseOrderDetails() && 
					purchaseOrderVo.getPurchaseOrderDetails().size() > 0){
				for (PurchaseOrderDetailVo purchaseOrderDetailVo : purchaseOrderVo.getPurchaseOrderDetails()) {
					purchaseOrderDetailVo.setPurchaseOrderId(purchaseOrderVo.getPurchaseOrderId());
					purchaseOrderDetailMapper.insertSelective(purchaseOrderDetailVo);
				}
			}
		}
	}
}
