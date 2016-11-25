package com.fruit.dao.mysql;

import java.util.List;
import java.util.Map;

import com.fruit.model.PurchaseOrderDetail;
import com.fruit.model.vo.PurchaseOrderDetailVo;

public interface PurchaseOrderDetailMapper {
    int deleteByPrimaryKey(Long purchaseOrderDetailId);

    int insert(PurchaseOrderDetail record);

    int insertSelective(PurchaseOrderDetail record);

    PurchaseOrderDetail selectByPrimaryKey(Long purchaseOrderDetailId);

    int updateByPrimaryKeySelective(PurchaseOrderDetail record);

    int updateByPrimaryKey(PurchaseOrderDetail record);
    
    List<PurchaseOrderDetailVo> querySelective(Map<String, Object> params);
}