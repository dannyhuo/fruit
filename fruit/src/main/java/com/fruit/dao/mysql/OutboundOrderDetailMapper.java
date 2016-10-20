package com.fruit.dao.mysql;

import com.fruit.model.OutboundOrderDetail;

public interface OutboundOrderDetailMapper {
    int deleteByPrimaryKey(Long outboundOrderDetailId);

    int insert(OutboundOrderDetail record);

    int insertSelective(OutboundOrderDetail record);

    OutboundOrderDetail selectByPrimaryKey(Long outboundOrderDetailId);

    int updateByPrimaryKeySelective(OutboundOrderDetail record);

    int updateByPrimaryKey(OutboundOrderDetail record);
}