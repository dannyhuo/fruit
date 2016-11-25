package com.fruit.dao.mysql;

import java.util.List;
import java.util.Map;

import com.fruit.model.PurchaseOrder;
import com.fruit.model.vo.PurchaseOrderVo;

public interface PurchaseOrderMapper {
    int deleteByPrimaryKey(Long purchaseOrderId);

    int insert(PurchaseOrder record);

    int insertSelective(PurchaseOrder record);

    PurchaseOrder selectByPrimaryKey(Long purchaseOrderId);

    int updateByPrimaryKeySelective(PurchaseOrder record);

    int updateByPrimaryKey(PurchaseOrder record);
    
    List<PurchaseOrderVo> querySelective(Map<String, Object> params);
}