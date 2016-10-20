package com.fruit.dao.mysql;

import com.fruit.model.PurchaseOrder;

public interface PurchaseOrderMapper {
    int deleteByPrimaryKey(Long purchaseOrderId);

    int insert(PurchaseOrder record);

    int insertSelective(PurchaseOrder record);

    PurchaseOrder selectByPrimaryKey(Long purchaseOrderId);

    int updateByPrimaryKeySelective(PurchaseOrder record);

    int updateByPrimaryKey(PurchaseOrder record);
}