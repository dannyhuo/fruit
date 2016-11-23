package com.fruit.dao.mysql;

import java.util.List;
import java.util.Map;

import com.fruit.model.OutboundOrderDetail;
import com.fruit.model.vo.OutboundOrderDetailVo;

public interface OutboundOrderDetailMapper {
    int deleteByPrimaryKey(Long outboundOrderDetailId);

    int insert(OutboundOrderDetail record);

    int insertSelective(OutboundOrderDetail record);

    OutboundOrderDetail selectByPrimaryKey(Long outboundOrderDetailId);

    int updateByPrimaryKeySelective(OutboundOrderDetail record);

    int updateByPrimaryKey(OutboundOrderDetail record);
    
    List<OutboundOrderDetailVo> querySelective(Map<String, Object> params);
}