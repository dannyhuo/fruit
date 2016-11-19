package com.fruit.model;

import java.util.Date;

public class FruitOrder {
    private Long orderId;

    private Long customerId;

    private Date createTime;

    private Long orderPay;

    private Long orderOughtPay;

    private Byte status;

    private String remark;

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public Long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Long customerId) {
        this.customerId = customerId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Long getOrderPay() {
        return orderPay;
    }

    public void setOrderPay(Long orderPay) {
        this.orderPay = orderPay;
    }

    public Long getOrderOughtPay() {
        return orderOughtPay;
    }

    public void setOrderOughtPay(Long orderOughtPay) {
        this.orderOughtPay = orderOughtPay;
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