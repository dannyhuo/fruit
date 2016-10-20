package com.fruit.dao.mysql;

import com.fruit.model.PurchaseOrderDetail;

public interface PurchaseOrderDetailMapper {
    int deleteByPrimaryKey(Long purchaseOrderDetailId);

    int insert(PurchaseOrderDetail record);

    int insertSelective(PurchaseOrderDetail record);

    PurchaseOrderDetail selectByPrimaryKey(Long purchaseOrderDetailId);

    int updateByPrimaryKeySelective(PurchaseOrderDetail record);

    int updateByPrimaryKey(PurchaseOrderDetail record);
}