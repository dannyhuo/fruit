package com.fruit.dao.mysql;

import com.fruit.model.OutboundOrder;

public interface OutboundOrderMapper {
    int deleteByPrimaryKey(Long outboundOrderId);

    int insert(OutboundOrder record);

    int insertSelective(OutboundOrder record);

    OutboundOrder selectByPrimaryKey(Long outboundOrderId);

    int updateByPrimaryKeySelective(OutboundOrder record);

    int updateByPrimaryKey(OutboundOrder record);
}