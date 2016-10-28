package com.fruit.model;

import java.util.Date;

public class OutboundOrderDetail {
    private Long outboundOrderDetailId;

    private Long outboundOrderId;

    private Long orderDetailId;

    private Long goodsId;

    private Date createTime;

    private Date outboundTime;

    private Byte status;

    private String remark;

    public Long getOutboundOrderDetailId() {
        return outboundOrderDetailId;
    }

    public void setOutboundOrderDetailId(Long outboundOrderDetailId) {
        this.outboundOrderDetailId = outboundOrderDetailId;
    }

    public Long getOutboundOrderId() {
        return outboundOrderId;
    }

    public void setOutboundOrderId(Long outboundOrderId) {
        this.outboundOrderId = outboundOrderId;
    }

    public Long getOrderDetailId() {
        return orderDetailId;
    }

    public void setOrderDetailId(Long orderDetailId) {
        this.orderDetailId = orderDetailId;
    }

    public Long getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Long goodsId) {
        this.goodsId = goodsId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getOutboundTime() {
        return outboundTime;
    }

    public void setOutboundTime(Date outboundTime) {
        this.outboundTime = outboundTime;
    }

    public Byte getStatus() {
        return status;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}